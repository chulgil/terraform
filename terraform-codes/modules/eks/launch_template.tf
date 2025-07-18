# Launch template for EKS nodes
resource "aws_launch_template" "eks_nodes" {
  name_prefix   = "${var.cluster_name}-nodes-"
  image_id      = var.ami_id
  instance_type = var.instance_types[0]
  key_name      = var.key_name
  user_data     = base64encode(local.eks_node_userdata)

  block_device_mappings {
    device_name = "/dev/xvda"

    ebs {
      volume_size           = var.node_disk_size
      volume_type           = "gp3"
      delete_on_termination = true
      encrypted             = true
    }
  }

  metadata_options {
    http_endpoint               = "enabled"
    http_tokens                 = "required"
    http_put_response_hop_limit = 2
    instance_metadata_tags      = "enabled"
  }

  monitoring {
    enabled = true
  }

  tag_specifications {
    resource_type = "instance"
    tags = merge(
      var.tags,
      {
        Name = "${var.cluster_name}-node"
      }
    )
  }

  lifecycle {
    create_before_destroy = true
  }
}

# Use the provided AMI ID or fail if not provided
locals {
  node_ami_id = var.ami_id
}

# Validate that an AMI ID was provided
resource "null_resource" "validate_ami_id" {
  # This will fail if no AMI ID is provided
  count = var.ami_id != "" ? 0 : 1
  
  # This will cause a clear error message if no AMI ID is provided
  provisioner "local-exec" {
    command = <<-EOT
      echo "ERROR: No AMI ID provided. Please set the 'ami_id' variable in your terraform.tfvars file."
      echo "For Kubernetes 1.33, you need to provide a custom AMI ID as this version is not officially supported by AWS EKS."
      exit 1
    EOT
  }
}

# User data for EKS nodes
locals {
  eks_node_userdata = <<-USERDATA
  #!/bin/bash
  set -o xtrace
  /etc/eks/bootstrap.sh ${var.cluster_name} \
    --kubelet-extra-args '--node-labels=nodegroup-type=standard,environment=${var.environment}' \
    --use-max-pods false \
    --container-runtime containerd \
    --dns-cluster-ip ${cidrhost(var.service_ipv4_cidr, 10)}
  USERDATA
}

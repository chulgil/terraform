# Get the latest EKS-optimized AMI using SSM Parameter Store (recommended by AWS)
data "aws_ssm_parameter" "eks_ami_id" {
  count = var.ami_id == "" ? 1 : 0
  name  = "/aws/service/eks/optimized-ami/${var.kubernetes_version}/amazon-linux-2023/x86_64/standard/recommended/image_id"
}

# Launch template for EKS nodes
resource "aws_launch_template" "eks_nodes" {
  name_prefix   = "${var.cluster_name}-nodes-"
  image_id      = var.ami_id != "" ? var.ami_id : data.aws_ssm_parameter.eks_ami_id[0].value
  instance_type = var.instance_types[0]
  key_name      = var.key_name
  user_data     = base64encode(local.eks_node_userdata)

  # Block device mappings
  block_device_mappings {
    device_name = "/dev/xvda"
    ebs {
      volume_size           = var.node_disk_size
      volume_type           = "gp3"
      delete_on_termination = true
      encrypted             = true
      iops                  = var.ebs_iops
      throughput           = var.ebs_throughput
    }
  }

  # Network interfaces
  network_interfaces {
    associate_public_ip_address = false
    delete_on_termination       = true
    security_groups             = [aws_security_group.worker_nodes.id]
  }

  # Metadata options for IMDSv2
  metadata_options {
    http_endpoint               = "enabled"
    http_tokens                 = "required"
    http_put_response_hop_limit = 2
    http_protocol_ipv6          = "disabled"
    instance_metadata_tags      = "enabled"
  }

  # Enable detailed monitoring
  monitoring {
    enabled = true
  }

  # Tag specifications
  tag_specifications {
    resource_type = "instance"
    tags = merge(
      var.tags,
      {
        Name                                              = "${var.cluster_name}-node"
        "kubernetes-io-cluster-${var.cluster_name}"      = "owned"
        "k8s-io-cluster-autoscaler-enabled"              = "true"
        "k8s-io-cluster-autoscaler-${var.cluster_name}"  = "owned"
      }
    )
  }

  tag_specifications {
    resource_type = "volume"
    tags = merge(
      var.tags,
      {
        Name = "${var.cluster_name}-node-volume"
      }
    )
  }

  # Lifecycle policy
  lifecycle {
    create_before_destroy = true
  }
}

# User data for EKS nodes
locals {
  eks_node_userdata = <<-USERDATA
  #!/bin/bash
  set -o xtrace
  
  # Set container runtime to containerd
  cat <<-EOF > /etc/containerd/config.toml
  version = 2
  [plugins]
    [plugins."io.containerd.grpc.v1.cri"]
      [plugins."io.containerd.grpc.v1.cri".containerd]
        default_runtime_name = "runc"
        [plugins."io.containerd.grpc.v1.cri".containerd.runtimes.runc]
          runtime_type = "io.containerd.runc.v2"
          [plugins."io.containerd.grpc.v1.cri".containerd.runtimes.runc.options]
            SystemdCgroup = true
  EOF
  
  # Restart containerd
  systemctl restart containerd
  
  # Bootstrap the EKS node
  /etc/eks/bootstrap.sh ${var.cluster_name} \
    --kubelet-extra-args '--node-labels=nodegroup-type=standard,environment=${var.environment},node.kubernetes.io/role=worker,kubernetes.io/role=worker' \
    --container-runtime containerd \
    --dns-cluster-ip ${cidrhost(var.service_ipv4_cidr, 10)} \
    --use-max-pods false \
    --b64-cluster-ca ${aws_eks_cluster.main.certificate_authority[0].data} \
    --apiserver-endpoint ${aws_eks_cluster.main.endpoint}
  
  # Ensure kubelet is running
  systemctl enable kubelet
  systemctl start kubelet
  
  # Install SSM agent
  if ! command -v amazon-ssm-agent &> /dev/null; then
    yum install -y https://s3.${var.region}.amazonaws.com/amazon-ssm-${var.region}/latest/linux_amd64/amazon-ssm-agent.rpm
    systemctl enable amazon-ssm-agent
    systemctl start amazon-ssm-agent
  fi
  
  # Install CloudWatch agent
  if [ ! -f "/opt/aws/amazon-cloudwatch-agent/bin/amazon-cloudwatch-agent-ctl" ]; then
    yum install -y https://s3.${var.region}.amazonaws.com/amazoncloudwatch-agent-${var.region}/amazon_linux/amd64/latest/amazon-cloudwatch-agent.rpm
  fi
  
  # Set up CloudWatch agent config
  mkdir -p /opt/aws/amazon-cloudwatch-agent/etc/
  cat <<-EOF > /opt/aws/amazon-cloudwatch-agent/etc/amazon-cloudwatch-agent.json
  {
    "agent": {
      "metrics_collection_interval": 60,
      "run_as_user": "root"
    },
    "metrics": {
      "append_dimensions": {
        "ClusterName": "${var.cluster_name}",
        "Environment": "${var.environment}"
      },
      "metrics_collected": {
        "disk": {
          "measurement": ["used_percent"],
          "metrics_collection_interval": 60,
          "resources": ["/"]
        },
        "mem": {
          "measurement": ["mem_used_percent"],
          "metrics_collection_interval": 60
        },
        "cpu": {
          "measurement": ["cpu_usage_idle", "cpu_usage_iowait", "cpu_usage_user", "cpu_usage_system"],
          "metrics_collection_interval": 60,
          "totalcpu": false
        }
      }
    }
  }
  EOF
  
  # Start CloudWatch agent
  /opt/aws/amazon-cloudwatch-agent/bin/amazon-cloudwatch-agent-ctl -a fetch-config -m ec2 -s -c file:/opt/aws/amazon-cloudwatch-agent/etc/amazon-cloudwatch-agent.json
  
  USERDATA
}

# Get the latest EKS-optimized AL2023 AMI for Kubernetes 1.33
data "aws_ssm_parameter" "eks_ami" {
  name = "/aws/service/eks/optimized-ami/1.33/amazon-linux-2023/x86_64/standard/recommended/image_id"
  
  # Ensure the parameter exists before trying to use it
  lifecycle {
    postcondition {
      condition     = self != null
      error_message = "Failed to retrieve EKS optimized AL2023 AMI for Kubernetes version 1.33. Please check if the AMI is available in your region."
    }
  }
}

# Launch template for EKS nodes - TEMPORARILY DISABLED FOR DEBUGGING
# resource "aws_launch_template" "eks_nodes" {
#   name_prefix   = "${var.cluster_name}-nodes-"
#   # Always use the latest EKS-optimized AMI from SSM Parameter Store
#   image_id      = data.aws_ssm_parameter.eks_ami.value
#   instance_type = var.instance_types[0]
#   key_name      = var.key_name
#   user_data     = base64encode(local.eks_node_userdata)
#
#   # Block device mappings
#   block_device_mappings {
#     device_name = "/dev/xvda"
#     ebs {
#       volume_size           = var.node_disk_size
#       volume_type           = "gp3"
#       delete_on_termination = true
#       encrypted             = true
#       iops                  = var.ebs_iops
#       throughput           = var.ebs_throughput
#     }
#   }
#
#   # Network interfaces
#   network_interfaces {
#     associate_public_ip_address = false
#     delete_on_termination       = true
#     security_groups             = [aws_security_group.worker_nodes.id]
#   }
#
#   # Metadata options for IMDSv2
#   metadata_options {
#     http_endpoint               = "enabled"
#     http_tokens                 = "required"
#     http_put_response_hop_limit = 2
#     http_protocol_ipv6          = "disabled"
#     instance_metadata_tags      = "enabled"
#   }
#
#   # Enable detailed monitoring
#   monitoring {
#     enabled = true
#   }
#
#   # Tag specifications
#   tag_specifications {
#     resource_type = "instance"
#     tags = merge(
#       var.tags,
#       {
#         Name                                              = "${var.cluster_name}-node"
#         "kubernetes-io-cluster-${var.cluster_name}"      = "owned"
#         "k8s-io-cluster-autoscaler-enabled"              = "true"
#         "k8s-io-cluster-autoscaler-${var.cluster_name}"  = "owned"
#       }
#     )
#   }
#
#   tag_specifications {
#     resource_type = "volume"
#     tags = merge(
#       var.tags,
#       {
#         Name = "${var.cluster_name}-node-volume"
#       }
#     )
#   }

#
#   # Lifecycle policy
#   lifecycle {
#     create_before_destroy = true
#   }
# }

# User data for EKS nodes
locals {
  # Convert node_labels map to string format for bash
  node_labels_string = var.node_labels == null ? "" : join(
    ",", 
    [for k, v in var.node_labels : "${k}=${v}"]
  )
  
  # Join taints with commas
  taints_string = var.node_taints == null ? "" : join(",", var.node_taints)
  
  # Build kubelet extra args
  kubelet_extra_args = join(" ", compact([
    length(local.node_labels_string) > 0 ? "--node-labels=${local.node_labels_string}" : "",
    length(local.taints_string) > 0 ? "--register-with-taints=${local.taints_string}" : ""
  ]))
  
  eks_node_userdata = <<-USERDATA
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="==BOUNDARY=="

--==BOUNDARY==
Content-Type: text/x-shellscript; charset="us-ascii"

#!/bin/bash
# Enable detailed logging
set -x
exec > >(tee /var/log/user-data.log) 2>&1
echo "Starting user data script at $(date)"

# Log system information
echo "System info:"
uname -a
cat /etc/os-release

# Configure containerd
echo "Configuring containerd..."
mkdir -p /etc/containerd
cat > /etc/containerd/config.toml <<EOT
version = 2
[plugins]
  [plugins."io.containerd.grpc.v1.cri"]
    [plugins."io.containerd.grpc.v1.cri".containerd]
      default_runtime_name = "runc"
      [plugins."io.containerd.grpc.v1.cri".containerd.runtimes.runc]
        runtime_type = "io.containerd.runc.v2"
        [plugins."io.containerd.grpc.v1.cri".containerd.runtimes.runc.options]
          SystemdCgroup = true
EOT

# Restart containerd with new config
echo "Restarting containerd..."
systemctl restart containerd
systemctl status containerd

# Configure kubelet for AL2023
echo "Configuring kubelet..."
mkdir -p /etc/systemd/system/kubelet.service.d
cat > /etc/systemd/system/kubelet.service.d/10-eksclt.al2023.conf <<EOT
[Service]
Environment="KUBELET_EXTRA_ARGS=--node-ip=$(hostname -i) --cloud-provider=aws"
EOT

echo "Kubelet configuration completed"

  --==BOUNDARY==
  Content-Type: application/node.eks.aws

  apiVersion: node.eks.aws/v1alpha1
  kind: NodeConfig
  spec:
    cluster:
      name: ${var.cluster_name}
      apiServerEndpoint: ${aws_eks_cluster.main.endpoint}
      certificateAuthority: ${aws_eks_cluster.main.certificate_authority[0].data}
      cidr: ${var.service_ipv4_cidr}
    kubelet:
      config:
        clusterDNS:
          - ${cidrhost(var.service_ipv4_cidr, 10)}
      ${length(local.kubelet_extra_args) > 0 ? "flags:\n      ${replace(local.kubelet_extra_args, " ", "\n      ")}" : ""}

  --==BOUNDARY==
  Content-Type: text/x-shellscript; charset="us-ascii"

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
  cat > /opt/aws/amazon-cloudwatch-agent/etc/amazon-cloudwatch-agent.json <<EOT
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

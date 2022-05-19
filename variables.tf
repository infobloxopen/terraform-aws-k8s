variable "aws_region" {
  description = "AWS region (e.g. `us-east-1` => N. Virginia)"
  type        = string
  default     = "us-east-1"
}

variable "eks_nodes" {
  description = "EKS Kubernetes worker nodes, desired ASG capacity (e.g. `2`)"
  default     = 2
  type        = number
}

variable "eks_min_nodes" {
  description = "EKS Kubernetes worker nodes, minimal ASG capacity (e.g. `1`)"
  default     = 1
  type        = number
}

variable "eks_max_nodes" {
  description = "EKS Kubernetes worker nodes, maximal ASG capacity (e.g. `3`)"
  default     = 3
  type        = number
}

variable "aws_cidr_block" {
  description = "AWS VPC CIDR block (e.g. `10.0.23.0/16`)"
  type        = string
  default     = "10.0.0.0/16"
}

variable "subnets" {
  description = "subnets to configure in the cloud (will be tagged with name and any additional tags)"
  type        = map(object({
    cidr = string
    tags = optional(list(object({
        tag = string
        value = string
      })))
  }))
  default     = {
    "loadbalancers": {
      cidr = "10.0.128.0/20"
    }
    "data": {
      cidr = "10.0.144.0/20"
    }
  }
}

variable "worker_subnets" {
  description = "List of 8-bit numbers of subnets base_cidr_block"
  type        = number
  default     = 2
}

variable "aws_instance_type" {
  description = "AWS EC2 Instance Type (e.g. `t3.medium`)"
  type        = string
  default     = "t3.medium"
}

# variable "aws_eks_version" {
#   description = "AWS EKS cluster version (e.g. `1.13`)"
#   type = string
#   default = "1.13"
# }


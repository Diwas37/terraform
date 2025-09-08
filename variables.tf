variable "region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}

variable "key_name" {
  description = "EC2 Key pair name"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID to launch instances"
  type        = string
}

variable "subnet_ids" {
  description = "Subnets for ASG"
  type        = list(string)
}

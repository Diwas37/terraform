variable "region" { default = "us-east-1" }
variable "env" {
  description = "Environment name (dev, stage, prod)"
}
variable "key_name" {
  description = "EC2 Key Pair name"
}

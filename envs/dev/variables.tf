variable "vpc_cidr" { default = "10.0.0.0/16" }
variable "public_subnets" {
  default = ["10.0.1.0/24", "10.0.2.0/24"]
}
variable "private_subnets" {
  default = ["10.0.3.0/24", "10.0.4.0/24"]
}
variable "azs" {
  default = ["us-east-1a", "us-east-1b"]
}
variable "ami_id" { default = "ami-0c55b159cbfafe1f0" }
variable "key_name" {}
variable "env" { default = "dev" }
variable "tags" {
  default = {
    Project     = "TerraformInfra"
    Owner       = "DevOpsTeam"
    Environment = "dev"
  }
}

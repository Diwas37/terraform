variable "ami_id" {}
variable "instance_type" { default = "t2.micro" }
variable "key_name" {}
variable "subnet_ids" {
  type = list(string)
}
variable "target_group_arns" {
  type = list(string)
  default = []
}
variable "env" {}
variable "tags" {
  type    = map(string)
  default = {}
}

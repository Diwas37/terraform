variable "subnet_ids" {
  type = list(string)
}
variable "vpc_id" {}
variable "env" {}
variable "tags" {
  type    = map(string)
  default = {}
}

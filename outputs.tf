output "launch_template_id" {
  value = aws_launch_template.nginx.id
}

output "autoscaling_group_name" {
  value = aws_autoscaling_group.nginx_asg.name
}

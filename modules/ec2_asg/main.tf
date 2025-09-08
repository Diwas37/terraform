resource "aws_launch_template" "this" {
  name_prefix   = "${var.env}-"
  image_id      = var.ami_id
  instance_type = var.instance_type
  key_name      = var.key_name

  tag_specifications {
    resource_type = "instance"
    tags          = merge(var.tags, { Name = "${var.env}-ec2" })
  }
}

resource "aws_autoscaling_group" "this" {
  desired_capacity     = 2
  max_size             = 3
  min_size             = 1
  vpc_zone_identifier  = var.subnet_ids

  launch_template {
    id      = aws_launch_template.this.id
    version = "$Latest"
  }

  target_group_arns = var.target_group_arns

  tags = [for k, v in var.tags : {
    key                 = k
    value               = v
    propagate_at_launch = true
  }]
}

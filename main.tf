# Launch Template with mixed instances
resource "aws_launch_template" "nginx" {
  name_prefix   = "nginx-lt-"
  image_id      = data.aws_ami.ubuntu.id
  instance_type = "t2.micro"
  key_name      = var.key_name

  user_data = filebase64("${path.module}/user_data.sh")

  lifecycle {
    create_before_destroy = true
  }
}

# Use latest Ubuntu AMI
data "aws_ami" "ubuntu" {
  most_recent = true
  owners      = ["099720109477"] # Canonical (Ubuntu)

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }
}

# Auto Scaling Group with Mixed Instances Policy
resource "aws_autoscaling_group" "nginx_asg" {
  vpc_zone_identifier = var.subnet_ids
  desired_capacity    = 2
  max_size            = 4
  min_size            = 1

  mixed_instances_policy {
    launch_template {
      launch_template_specification {
        launch_template_id = aws_launch_template.nginx.id
        version            = "$Latest"
      }

      override {
        instance_type = "t2.micro"
      }

      override {
        instance_type = "t2.medium"
      }
    }

    instances_distribution {
      on_demand_base_capacity                  = 1
      on_demand_percentage_above_base_capacity = 50
      spot_allocation_strategy                 = "lowest-price"
    }
  }

  tag {
    key                 = "Name"
    value               = "nginx-asg"
    propagate_at_launch = true
  }
}

# EC2 Auto Scaling with Mixed Instances (NGINX)

## Features
- Launch Template with Ubuntu + NGINX installation
- Auto Scaling Group with multiple instance types (t2.micro, t2.medium)
- Combination of On-Demand and Spot Instances
- User data installs and serves a test HTML page via NGINX

## Deployment
```bash
terraform init
terraform plan -var="key_name=your-key" -var="vpc_id=vpc-1234" -var='subnet_ids=["subnet-aaa","subnet-bbb"]'
terraform apply

# Terraform AWS VPC + EC2 ASG + ALB (Production Conventions)

## ✅ Conventions Applied
- **providers.tf** only at root (not in modules).
- **Remote state** with S3 + DynamoDB for locking.
- **Environment separation** (`envs/dev`, `envs/stage`).
- **Tagging** on all resources.
- **Version pinning** for Terraform and AWS provider.
- **No secrets in code** (use AWS SSM/Secrets Manager).
- **Outputs** limited to required values (ALB DNS, VPC ID).

## 🚀 How to Deploy
```sh
cd envs/dev
terraform init
terraform plan -var="key_name=your-keypair"
terraform apply -var="key_name=your-keypair"
```

## 🧹 How to Destroy
```sh
cd envs/dev
terraform destroy -var="key_name=your-keypair"
```

## 📦 State Management
State is stored remotely in S3 with DynamoDB table for locking.  
Update `backend "s3"` in `providers.tf` with your own bucket/table.

## 🔐 Secrets
- Use AWS SSM Parameter Store or Secrets Manager for sensitive variables.
- Do NOT hardcode secrets in variables or commit to Git.

## 📏 Code Quality
- Run `terraform fmt` before committing.
- Validate with `terraform validate`.
- PR review required for all infra changes.

---

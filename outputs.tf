output "cloudfront_url" {
  description = "CloudFront domain to access the static site"
  value       = aws_cloudfront_distribution.this.domain_name
}

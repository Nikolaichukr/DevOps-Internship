output "bucket_id" {
  description = "The name of the bucket"
  value       = aws_s3_bucket.main.id
}

output "bucket_arn" {
  description = "The ARN of the bucket"
  value       = aws_s3_bucket.main.arn
}

output "bucket_region" {
  description = "The region of the bucket"
  value       = aws_s3_bucket.main.region
}

output "access_role_arn" {
  description = "The ARN of the IAM role for accessing the bucket"
  value       = aws_iam_role.s3_access_role.arn
}
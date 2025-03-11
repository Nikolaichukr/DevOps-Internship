➜  s3-bucket git:(terraform-stuff) ✗ terraform apply  


```terraform
Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # aws_iam_policy.s3_access_policy will be created
  + resource "aws_iam_policy" "s3_access_policy" {
      + arn              = (known after apply)
      + attachment_count = (known after apply)
      + description      = "Policy to access my-super-unique-s3-bucket-for-peex S3 bucket"
      + id               = (known after apply)
      + name             = "my-super-unique-s3-bucket-for-peex-access-policy"
      + name_prefix      = (known after apply)
      + path             = "/"
      + policy           = (known after apply)
      + policy_id        = (known after apply)
      + tags_all         = {
          + "Environment" = "Dev"
          + "ManagedBy"   = "Terraform"
          + "Owner"       = "Nikolaichukr"
          + "Project"     = "PeEx"
        }
    }

  # aws_iam_role.s3_access_role will be created
  + resource "aws_iam_role" "s3_access_role" {
      + arn                   = (known after apply)
      + assume_role_policy    = jsonencode(
            {
              + Statement = [
                  + {
                      + Action    = "sts:AssumeRole"
                      + Effect    = "Allow"
                      + Principal = {
                          + Service = "ec2.amazonaws.com"
                        }
                    },
                ]
              + Version   = "2012-10-17"
            }
        )
      + create_date           = (known after apply)
      + force_detach_policies = false
      + id                    = (known after apply)
      + managed_policy_arns   = (known after apply)
      + max_session_duration  = 3600
      + name                  = "my-super-unique-s3-bucket-for-peex-access-role"
      + name_prefix           = (known after apply)
      + path                  = "/"
      + tags                  = {
          + "Name" = "my-super-unique-s3-bucket-for-peex-access-role"
        }
      + tags_all              = {
          + "Environment" = "Dev"
          + "ManagedBy"   = "Terraform"
          + "Name"        = "my-super-unique-s3-bucket-for-peex-access-role"
          + "Owner"       = "Nikolaichukr"
          + "Project"     = "PeEx"
        }
      + unique_id             = (known after apply)

      + inline_policy (known after apply)
    }

  # aws_iam_role_policy_attachment.s3_access_attachment will be created
  + resource "aws_iam_role_policy_attachment" "s3_access_attachment" {
      + id         = (known after apply)
      + policy_arn = (known after apply)
      + role       = "my-super-unique-s3-bucket-for-peex-access-role"
    }

  # aws_s3_bucket.main will be created
  + resource "aws_s3_bucket" "main" {
      + acceleration_status         = (known after apply)
      + acl                         = (known after apply)
      + arn                         = (known after apply)
      + bucket                      = "my-super-unique-s3-bucket-for-peex"
      + bucket_domain_name          = (known after apply)
      + bucket_prefix               = (known after apply)
      + bucket_regional_domain_name = (known after apply)
      + force_destroy               = false
      + hosted_zone_id              = (known after apply)
      + id                          = (known after apply)
      + object_lock_enabled         = (known after apply)
      + policy                      = (known after apply)
      + region                      = (known after apply)
      + request_payer               = (known after apply)
      + tags_all                    = {
          + "Environment" = "Dev"
          + "ManagedBy"   = "Terraform"
          + "Owner"       = "Nikolaichukr"
          + "Project"     = "PeEx"
        }
      + website_domain              = (known after apply)
      + website_endpoint            = (known after apply)

      + cors_rule (known after apply)

      + grant (known after apply)

      + lifecycle_rule (known after apply)

      + logging (known after apply)

      + object_lock_configuration (known after apply)

      + replication_configuration (known after apply)

      + server_side_encryption_configuration (known after apply)

      + versioning (known after apply)

      + website (known after apply)
    }

  # aws_s3_bucket_lifecycle_configuration.lifecycle_rules will be created
  + resource "aws_s3_bucket_lifecycle_configuration" "lifecycle_rules" {
      + bucket                                 = (known after apply)
      + expected_bucket_owner                  = (known after apply)
      + id                                     = (known after apply)
      + transition_default_minimum_object_size = "all_storage_classes_128K"

      + rule {
          + id     = "transition-to-ia"
          + prefix = (known after apply)
          + status = "Enabled"

          + filter {
              + object_size_greater_than = (known after apply)
              + object_size_less_than    = (known after apply)
                # (1 unchanged attribute hidden)
            }

          + noncurrent_version_transition {
              + newer_noncurrent_versions = (known after apply)
              + noncurrent_days           = 30
              + storage_class             = "STANDARD_IA"
            }

          + transition {
              + days          = 30
              + storage_class = "STANDARD_IA"
            }
        }
    }

  # aws_s3_bucket_policy.bucket_policy will be created
  + resource "aws_s3_bucket_policy" "bucket_policy" {
      + bucket = (known after apply)
      + id     = (known after apply)
      + policy = (known after apply)
    }

  # aws_s3_bucket_public_access_block.public_access will be created
  + resource "aws_s3_bucket_public_access_block" "public_access" {
      + block_public_acls       = true
      + block_public_policy     = true
      + bucket                  = (known after apply)
      + id                      = (known after apply)
      + ignore_public_acls      = true
      + restrict_public_buckets = true
    }

  # aws_s3_bucket_server_side_encryption_configuration.encryption will be created
  + resource "aws_s3_bucket_server_side_encryption_configuration" "encryption" {
      + bucket = (known after apply)
      + id     = (known after apply)

      + rule {
          + apply_server_side_encryption_by_default {
              + sse_algorithm     = "AES256"
                # (1 unchanged attribute hidden)
            }
        }
    }

  # aws_s3_bucket_versioning.versioning will be created
  + resource "aws_s3_bucket_versioning" "versioning" {
      + bucket = (known after apply)
      + id     = (known after apply)

      + versioning_configuration {
          + mfa_delete = (known after apply)
          + status     = "Enabled"
        }
    }

Plan: 9 to add, 0 to change, 0 to destroy.

Changes to Outputs:
  + access_role_arn = (known after apply)
  + bucket_arn      = (known after apply)
  + bucket_id       = (known after apply)
  + bucket_region   = (known after apply)

Do you want to perform these actions?
  Terraform will perform the actions described above.
  Only 'yes' will be accepted to approve.

  Enter a value: yes

aws_iam_role.s3_access_role: Creating...
aws_s3_bucket.main: Creating...
aws_iam_role.s3_access_role: Creation complete after 1s [id=my-super-unique-s3-bucket-for-peex-access-role]
aws_s3_bucket.main: Creation complete after 2s [id=my-super-unique-s3-bucket-for-peex]
aws_s3_bucket_public_access_block.public_access: Creating...
aws_s3_bucket_versioning.versioning: Creating...
aws_s3_bucket_server_side_encryption_configuration.encryption: Creating...
aws_iam_policy.s3_access_policy: Creating...
aws_s3_bucket_lifecycle_configuration.lifecycle_rules: Creating...
aws_s3_bucket_public_access_block.public_access: Creation complete after 0s [id=my-super-unique-s3-bucket-for-peex]
aws_s3_bucket_policy.bucket_policy: Creating...
aws_iam_policy.s3_access_policy: Creation complete after 0s [id=arn:aws:iam::[REDACTED]:policy/my-super-unique-s3-bucket-for-peex-access-policy]
aws_iam_role_policy_attachment.s3_access_attachment: Creating...
aws_iam_role_policy_attachment.s3_access_attachment: Creation complete after 1s [id=my-super-unique-s3-bucket-for-peex-access-role-20250311012410565200000001]
aws_s3_bucket_server_side_encryption_configuration.encryption: Creation complete after 1s [id=my-super-unique-s3-bucket-for-peex]
aws_s3_bucket_versioning.versioning: Creation complete after 2s [id=my-super-unique-s3-bucket-for-peex]
aws_s3_bucket_policy.bucket_policy: Creation complete after 9s [id=my-super-unique-s3-bucket-for-peex]
aws_s3_bucket_lifecycle_configuration.lifecycle_rules: Still creating... [10s elapsed]
aws_s3_bucket_lifecycle_configuration.lifecycle_rules: Still creating... [20s elapsed]
aws_s3_bucket_lifecycle_configuration.lifecycle_rules: Creation complete after 22s [id=my-super-unique-s3-bucket-for-peex]

Apply complete! Resources: 9 added, 0 changed, 0 destroyed.

Outputs:

access_role_arn = "arn:aws:iam::[REDACTED]:role/my-super-unique-s3-bucket-for-peex-access-role"
bucket_arn = "arn:aws:s3:::my-super-unique-s3-bucket-for-peex"
bucket_id = "my-super-unique-s3-bucket-for-peex"
bucket_region = "eu-north-1"
```
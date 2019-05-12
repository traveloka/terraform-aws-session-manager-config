data "aws_caller_identity" "current" {}

data "aws_region" "current" {}

data "aws_iam_role" "super_admin" {
  name = "SuperAdmin"
}

data "aws_iam_policy_document" "session_manager" {
  # This policy is mostly copied from arn:aws:iam::aws:policy/service-role/AmazonEC2RoleforSSM version 8
  # Some statements were removed and specific S3 bucket added to reduce privilege
  statement = {
    sid    = "AllowSSMActions"
    effect = "Allow"

    actions = [
      "ssm:DescribeAssociation",
      "ssm:DescribeDocument",
      "ssm:GetDeployablePatchSnapshotForInstance",
      "ssm:GetDocument",
      "ssm:GetManifest",
      "ssm:GetParameters",
      "ssm:ListAssociations",
      "ssm:ListInstanceAssociations",
      "ssm:PutComplianceItems",
      "ssm:PutConfigurePackageResult",
      "ssm:PutInventory",
      "ssm:UpdateAssociationStatus",
      "ssm:UpdateInstanceAssociationStatus",
      "ssm:UpdateInstanceInformation",
    ]

    resources = ["*"]
  }

  statement {
    sid    = "AllowEC2Messages"
    effect = "Allow"

    actions = [
      "ec2messages:AcknowledgeMessage",
      "ec2messages:DeleteMessage",
      "ec2messages:FailMessage",
      "ec2messages:GetEndpoint",
      "ec2messages:GetMessages",
      "ec2messages:SendReply",
    ]

    resources = ["*"]
  }

  statement = {
    sid    = "AllowSSMMessages"
    effect = "Allow"

    actions = [
      "ssmmessages:CreateControlChannel",
      "ssmmessages:CreateDataChannel",
      "ssmmessages:OpenControlChannel",
      "ssmmessages:OpenDataChannel",
    ]

    resources = ["*"]
  }

  statement = {
    sid       = "AllowCloudWatchPutMetrics"
    effect    = "Allow"
    actions   = ["cloudwatch:PutMetricData"]
    resources = ["*"]
  }

  statement = {
    sid       = "AllowEC2DescribeInstanceStatus"
    effect    = "Allow"
    actions   = ["ec2:DescribeInstanceStatus"]
    resources = ["*"]
  }

  statement = {
    sid    = "AllowS3Logging"
    effect = "Allow"

    actions = [
      "s3:AbortMultipartUpload",
      "s3:GetBucketLocation",
      "s3:GetEncryptionConfiguration",
      "s3:ListBucket",
      "s3:ListBucketMultipartUploads",
      "s3:ListMultipartUploadParts",
      "s3:PutObject",
    ]

    resources = [
      "${aws_s3_bucket.this.arn}",
      "${aws_s3_bucket.this.arn}/*",
    ]
  }
}

data "aws_iam_policy_document" "s3_bucket" {
  statement = {
    sid    = "DenyDeleteExceptFromSuperAdmin"
    effect = "Deny"

    principals = {
      type        = "*"
      identifiers = ["*"]
    }

    actions = [
      "s3:DeleteBucket",
      "s3:DeleteObject",
      "s3:DeleteObjectVersion",
    ]

    resources = [
      "arn:aws:s3:::${local.s3_bucket_name}/*",
      "arn:aws:s3:::${local.s3_bucket_name}",
    ]

    condition = {
      test     = "StringNotLike"
      variable = "aws:userId"

      values = [
        "${data.aws_iam_role.super_admin.id}:*", #SuperAdminRoleId
      ]
    }
  }
}

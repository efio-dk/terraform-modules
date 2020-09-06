resource "aws_iam_policy" "deploy" {
  name        = "deploy-to-${var.domain}"
  path        = var.iam_policy_path
  description = "grants permissions for deploying to ${var.domain}"
  policy      = data.aws_iam_policy_document.deploy.json
}

data "aws_iam_policy_document" "deploy" {
  statement {
    actions = [
      "s3:AbortMultipartUpload",
      "s3:DeleteObject",
      "s3:GetObject",
      "s3:GetObjectAcl",
      "s3:PutObject",
      "s3:PutObjectAcl"
    ]

    resources = [
      "${aws_s3_bucket.website_content.arn}/*",
    ]
  }

  statement {
    actions = [
      "s3:ListBucket",
    ]

    resources = [
      aws_s3_bucket.website_content.arn,
    ]
  }

  statement {
    actions = [
      "cloudfront:CreateInvalidation",
    ]

    resources = [
      aws_cloudfront_distribution.s3_distribution.arn,
      "${aws_cloudfront_distribution.s3_distribution.arn}/*",
    ]
  }
}

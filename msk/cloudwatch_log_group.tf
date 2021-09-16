# data "aws_iam_policy_document" "msk-log-publishing-policy" {
#   statement {
#     actions = [
#       "logs:CreateLogStream",
#       "logs:PutLogEvents",
#       "logs:PutLogEventsBatch",
#     ]

#     resources = ["arn:aws:logs:*"]

#     principals {
#       identifiers = ["msk.amazonaws.com"]
#       type        = "Service"
#     }
#   }
# }

# resource "aws_cloudwatch_log_resource_policy" "msk-log-publishing-policy" {
#   policy_document = data.aws_iam_policy_document.msk-log-publishing-policy.json
#   policy_name     = "msk-log-publishing-policy-${local.name}"
# }

resource "aws_cloudwatch_log_group" "msk_logs" {
  name = "${local.name}-msk-logs"
  retention_in_days = "30"
  kms_key_id = aws_kms_key.msk_rest_key.arn

  tags = local.tags
}

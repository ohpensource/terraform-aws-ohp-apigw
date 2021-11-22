resource "aws_cloudwatch_log_group" "default" {
  name              = "/aws/apigateway/${var.api_name}"
  retention_in_days = var.cloudwatch_logs_retention_in_days
  tags              = var.tags
}

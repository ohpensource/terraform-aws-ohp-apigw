resource "aws_cloudwatch_log_group" "main" {
  name              = "/aws/apigateway/${var.name}"
  retention_in_days = 3
  tags              = var.tags
}

output "base_url" {
  value = "${aws_api_gateway_deployment.api.invoke_url}${var.environment}"
}
output "id" {
  value = aws_api_gateway_rest_api.api.id
}

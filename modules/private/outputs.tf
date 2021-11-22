output "apigateway_rest_api_id" {
  description = "The API identifier"
  value       = element(concat(aws_api_gateway_rest_api.default.*.id, [""]), 0)
}

output "apigateway_rest_api_arn" {
  description = "The ARN of the API"
  value       = element(concat(aws_api_gateway_rest_api.default.*.arn, [""]), 0)
}

output "apigateway_rest_api_execution_arn" {
  description = "The ARN prefix to be used in an aws_lambda_permission's source_arn attribute or in an aws_iam_policy to authorize access to the @connections API."
  value       = element(concat(aws_api_gateway_rest_api.default.*.execution_arn, [""]), 0)
}

# default stage
output "apigateway_stage_id" {
  description = "The default stage identifier"
  value       = element(concat(aws_api_gateway_stage.default.*.id, [""]), 0)
}

output "apigateway_stage_arn" {
  description = "The default stage ARN"
  value       = element(concat(aws_api_gateway_stage.default.*.arn, [""]), 0)
}

output "apigateway_stage_execution_arn" {
  description = "The ARN prefix to be used in an aws_lambda_permission's source_arn attribute or in an aws_iam_policy to authorize access to the @connections API."
  value       = element(concat(aws_api_gateway_stage.default.*.execution_arn, [""]), 0)
}

output "apigateway_stage_invoke_url" {
  description = "The URL to invoke the API pointing to the stage"
  value       = element(concat(aws_api_gateway_stage.default.*.invoke_url, [""]), 0)
}

output "apigateway_resource_id" {
  description = "Resource identifier"
  value       = tomap({ for k, v in aws_api_gateway_resource.default : k => v.id })
}


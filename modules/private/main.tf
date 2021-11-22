resource "aws_api_gateway_account" "default" {
  cloudwatch_role_arn = aws_iam_role.default.arn
}

resource "aws_api_gateway_rest_api" "default" {
  name        = var.api_name
  description = "an endpoints...."
  endpoint_configuration {
    types = [var.endpoint_configuration]
  }
  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_api_gateway_rest_api_policy" "default" {
  rest_api_id = aws_api_gateway_rest_api.default.id

  policy = data.aws_iam_policy_document.api_policy.json
}

resource "aws_api_gateway_stage" "default" {
  rest_api_id          = aws_api_gateway_rest_api.default.id
  stage_name           = var.api_stage_name
  deployment_id        = aws_api_gateway_deployment.default.id
  xray_tracing_enabled = var.xray_tracing_enabled

  access_log_settings {
    destination_arn = aws_cloudwatch_log_group.default.arn
    format          = jsonencode(local.access_log_settings)
  }
  depends_on = [
    aws_cloudwatch_log_group.default
  ]
  tags = var.tags
}

resource "aws_api_gateway_deployment" "default" {
  rest_api_id = aws_api_gateway_rest_api.default.id
  description = "Rest Api Deployment"
  triggers = {
    redeployment = timestamp()
  }
  lifecycle {
    create_before_destroy = true
  }
  depends_on = [
    aws_api_gateway_method.default
  ]
}

resource "aws_api_gateway_resource" "default" {
  for_each    = var.apigw_config
  rest_api_id = aws_api_gateway_rest_api.default.id
  parent_id   = aws_api_gateway_rest_api.default.root_resource_id
  path_part   = each.value.path
  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_api_gateway_method" "default" {
  for_each      = var.apigw_config
  http_method   = each.value.method
  resource_id   = aws_api_gateway_resource.default[each.key].id
  rest_api_id   = aws_api_gateway_rest_api.default.id
  authorization = var.authorization
}

resource "aws_api_gateway_integration" "default" {
  for_each                = var.apigw_config
  resource_id             = aws_api_gateway_resource.default[each.key].id
  rest_api_id             = aws_api_gateway_rest_api.default.id
  http_method             = aws_api_gateway_method.default[each.key].http_method
  integration_http_method = "POST"
  type                    = each.value.integration_type
  uri                     = each.value.integration_arn
}

resource "aws_lambda_permission" "api" {
  for_each      = var.apigw_config
  statement_id  = "AllowAPIGatewayInvoke"
  action        = "lambda:InvokeFunction"
  function_name = each.value.name
  principal     = "apigateway.amazonaws.com"
  source_arn    = "${aws_api_gateway_rest_api.default.execution_arn}/*/*/*"
}

# Custom domain name
resource "aws_api_gateway_domain_name" "main" {
  domain_name              = "${var.name}.${var.dns_zone}"
  regional_certificate_arn = var.wildcard_arn
  security_policy          = var.security_policy

  endpoint_configuration {
    types = [var.endpoint_configuration]
  }

  mutual_tls_authentication {
    truststore_uri = "s3://${aws_s3_bucket.main.id}/${aws_s3_bucket_object.cert.id}"
  }
}

# Rest API
resource "aws_api_gateway_rest_api" "main" {
  name = var.name

  endpoint_configuration {
    types = [var.endpoint_configuration]
  }
  disable_execute_api_endpoint = true
}

resource "aws_api_gateway_rest_api_policy" "main" {
  rest_api_id = aws_api_gateway_rest_api.main.id

  policy = var.api_resource_policy == null ? data.aws_iam_policy_document.api_policy.json : var.api_resource_policy

}

resource "aws_api_gateway_stage" "main" {
  rest_api_id          = aws_api_gateway_rest_api.main.id
  stage_name           = var.api_stage_name
  deployment_id        = aws_api_gateway_deployment.main.id
  xray_tracing_enabled = var.xray_tracing_enabled

  access_log_settings {
    destination_arn = aws_cloudwatch_log_group.main.arn
    format          = jsonencode(local.access_log_settings)
  }
  depends_on = [
    aws_cloudwatch_log_group.main
  ]
  tags = var.tags
}

resource "aws_api_gateway_deployment" "main" {
  rest_api_id = aws_api_gateway_rest_api.main.id
  description = "Rest Api Deployment"
  triggers = {
    redeployment = timestamp()
  }
  lifecycle {
    create_before_destroy = true
  }
  depends_on = [
    aws_api_gateway_method.ping
  ]
}

resource "aws_api_gateway_base_path_mapping" "main" {
  api_id      = aws_api_gateway_rest_api.main.id
  stage_name  = aws_api_gateway_stage.main.stage_name
  domain_name = aws_api_gateway_domain_name.main.domain_name
  # base_path   = var.base_path
}

resource "aws_api_gateway_resource" "ping" {
  rest_api_id = aws_api_gateway_rest_api.main.id
  parent_id   = aws_api_gateway_rest_api.main.root_resource_id
  path_part   = "ping"
}
resource "aws_api_gateway_method" "ping" {
  rest_api_id   = aws_api_gateway_rest_api.main.id
  resource_id   = aws_api_gateway_resource.ping.id
  http_method   = "GET"
  authorization = "NONE"
  lifecycle {
    ignore_changes = [http_method, authorization]
  }
}

resource "aws_api_gateway_integration" "ping" {
  http_method = aws_api_gateway_method.ping.http_method
  resource_id = aws_api_gateway_resource.ping.id
  rest_api_id = aws_api_gateway_rest_api.main.id
  type        = "MOCK"
  lifecycle {
    ignore_changes = all
  }
}

resource "aws_api_gateway_method_response" "response_200" {
  rest_api_id = aws_api_gateway_rest_api.main.id
  resource_id = aws_api_gateway_resource.ping.id
  http_method = aws_api_gateway_method.mpingain.http_method
  status_code = 200
  response_models = {
    "application/json" = aws_api_gateway_model.empty.name
  }

  depends_on = [
    aws_api_gateway_integration.main

  ]
}

resource "aws_api_gateway_integration_response" "main" {
  rest_api_id = data.aws_api_gateway_rest_api.main.id
  resource_id = aws_api_gateway_resource.ping.id
  http_method = aws_api_gateway_method.ping.http_method
  status_code = aws_api_gateway_method_response.response_200.status_code

  response_templates = {
    "application/json" = ""
  }

  depends_on = [
    aws_api_gateway_integration.ping,
    aws_api_gateway_method_response.response_200
  ]
}

resource "aws_api_gateway_model" "empty" {
  rest_api_id  = data.aws_api_gateway_rest_api.main.id
  name         = "Empty"
  content_type = "application/json"

  schema = <<EOF
{
  "$schema": "http://json-schema.org/draft-04/schema#",
  "title" : "Empty Schema",
  "type" : "object"
}
EOF
}

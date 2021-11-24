# Terraform Module - API Gateway (Private)

## Usage

<!--- BEGIN_TF_DOCS --->
### Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 3.0 |

### Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 3.0 |

### Modules

No modules.

### Resources

| Name | Type |
|------|------|
| [aws_api_gateway_account.default](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/api_gateway_account) | resource |
| [aws_api_gateway_deployment.default](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/api_gateway_deployment) | resource |
| [aws_api_gateway_integration.default](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/api_gateway_integration) | resource |
| [aws_api_gateway_method.default](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/api_gateway_method) | resource |
| [aws_api_gateway_resource.default](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/api_gateway_resource) | resource |
| [aws_api_gateway_rest_api.default](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/api_gateway_rest_api) | resource |
| [aws_api_gateway_rest_api_policy.default](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/api_gateway_rest_api_policy) | resource |
| [aws_api_gateway_stage.default](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/api_gateway_stage) | resource |
| [aws_cloudwatch_log_group.default](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_log_group) | resource |
| [aws_iam_role.default](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role_policy.cloudwatch](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy) | resource |
| [aws_lambda_permission.api](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lambda_permission) | resource |
| [aws_caller_identity.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity) | data source |
| [aws_iam_policy_document.api_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.assume_role_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.cw_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_region.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/region) | data source |

### Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_api_name"></a> [api\_name](#input\_api\_name) | n/a | `string` | n/a | yes |
| <a name="input_api_stage_name"></a> [api\_stage\_name](#input\_api\_stage\_name) | n/a | `string` | n/a | yes |
| <a name="input_apigw_config"></a> [apigw\_config](#input\_apigw\_config) | n/a | <pre>map(object({<br>    name             = string<br>    path             = string<br>    method           = string<br>    integration_type = string<br>    integration_arn  = string<br>  }))</pre> | n/a | yes |
| <a name="input_authorization"></a> [authorization](#input\_authorization) | n/a | `string` | `"NONE"` | no |
| <a name="input_cloudwatch_logs_retention_in_days"></a> [cloudwatch\_logs\_retention\_in\_days](#input\_cloudwatch\_logs\_retention\_in\_days) | n/a | `number` | `3` | no |
| <a name="input_endpoint_configuration"></a> [endpoint\_configuration](#input\_endpoint\_configuration) | n/a | `string` | `"REGIONAL"` | no |
| <a name="input_region_id"></a> [region\_id](#input\_region\_id) | variable "service\_name" { type = string } variable "service\_suffix" { type = string } variable "project\_name" { type = string } | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | n/a | `map(any)` | n/a | yes |
| <a name="input_xray_tracing_enabled"></a> [xray\_tracing\_enabled](#input\_xray\_tracing\_enabled) | n/a | `bool` | `false` | no |

### Outputs

| Name | Description |
|------|-------------|
| <a name="output_apigateway_resource_id"></a> [apigateway\_resource\_id](#output\_apigateway\_resource\_id) | Resource identifier |
| <a name="output_apigateway_rest_api_arn"></a> [apigateway\_rest\_api\_arn](#output\_apigateway\_rest\_api\_arn) | The ARN of the API |
| <a name="output_apigateway_rest_api_execution_arn"></a> [apigateway\_rest\_api\_execution\_arn](#output\_apigateway\_rest\_api\_execution\_arn) | The ARN prefix to be used in an aws\_lambda\_permission's source\_arn attribute or in an aws\_iam\_policy to authorize access to the @connections API. |
| <a name="output_apigateway_rest_api_id"></a> [apigateway\_rest\_api\_id](#output\_apigateway\_rest\_api\_id) | The API identifier |
| <a name="output_apigateway_stage_arn"></a> [apigateway\_stage\_arn](#output\_apigateway\_stage\_arn) | The default stage ARN |
| <a name="output_apigateway_stage_execution_arn"></a> [apigateway\_stage\_execution\_arn](#output\_apigateway\_stage\_execution\_arn) | The ARN prefix to be used in an aws\_lambda\_permission's source\_arn attribute or in an aws\_iam\_policy to authorize access to the @connections API. |
| <a name="output_apigateway_stage_id"></a> [apigateway\_stage\_id](#output\_apigateway\_stage\_id) | The default stage identifier |
| <a name="output_apigateway_stage_invoke_url"></a> [apigateway\_stage\_invoke\_url](#output\_apigateway\_stage\_invoke\_url) | The URL to invoke the API pointing to the stage |

<!--- END_TF_DOCS --->
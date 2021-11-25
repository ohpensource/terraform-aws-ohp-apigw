# Terraform Module - Proxy+ Lambda

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
| [aws_api_gateway_deployment.api](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/api_gateway_deployment) | resource |
| [aws_api_gateway_integration.lambda](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/api_gateway_integration) | resource |
| [aws_api_gateway_integration.lambda_root](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/api_gateway_integration) | resource |
| [aws_api_gateway_method.proxy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/api_gateway_method) | resource |
| [aws_api_gateway_method.proxy_root](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/api_gateway_method) | resource |
| [aws_api_gateway_resource.proxy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/api_gateway_resource) | resource |
| [aws_api_gateway_rest_api.api](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/api_gateway_rest_api) | resource |
| [aws_api_gateway_stage.api](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/api_gateway_stage) | resource |
| [aws_lambda_permission.api](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lambda_permission) | resource |

### Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_apigw_proxy_path_part"></a> [apigw\_proxy\_path\_part](#input\_apigw\_proxy\_path\_part) | n/a | `string` | `"{proxy+}"` | no |
| <a name="input_authorization"></a> [authorization](#input\_authorization) | n/a | `string` | `"NONE"` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | (Mandatory) environment in which the deployment happen: dev, tst, int, acc, prd | `string` | n/a | yes |
| <a name="input_http_method"></a> [http\_method](#input\_http\_method) | n/a | `string` | `"ANY"` | no |
| <a name="input_integration_http_method"></a> [integration\_http\_method](#input\_integration\_http\_method) | n/a | `string` | `"POST"` | no |
| <a name="input_integration_type"></a> [integration\_type](#input\_integration\_type) | n/a | `string` | `"AWS_PROXY"` | no |
| <a name="input_lambda_function_name"></a> [lambda\_function\_name](#input\_lambda\_function\_name) | (Mandatory) Lambda function name. | `string` | n/a | yes |
| <a name="input_lambda_invoke_arn"></a> [lambda\_invoke\_arn](#input\_lambda\_invoke\_arn) | (Mandatory) Lambda invoke arn to use in the apigw integration. | `string` | n/a | yes |
| <a name="input_prefix_name"></a> [prefix\_name](#input\_prefix\_name) | (Mandatory) Name that will be used as PREFIX for all resources. | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | (Mandatory) default tags for your resources. | `map(any)` | n/a | yes |

### Outputs

| Name | Description |
|------|-------------|
| <a name="output_base_url"></a> [base\_url](#output\_base\_url) | n/a |
| <a name="output_id"></a> [id](#output\_id) | n/a |

<!--- END_TF_DOCS --->
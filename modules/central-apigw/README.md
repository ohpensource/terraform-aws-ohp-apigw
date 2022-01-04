# Terraform Module - API Gateway (Central)

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

| Name | Source | Version |
|------|--------|---------|
| <a name="module_waf"></a> [waf](#module\_waf) | ../waf | n/a |

### Resources

| Name | Type |
|------|------|
| [aws_api_gateway_base_path_mapping.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/api_gateway_base_path_mapping) | resource |
| [aws_api_gateway_deployment.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/api_gateway_deployment) | resource |
| [aws_api_gateway_domain_name.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/api_gateway_domain_name) | resource |
| [aws_api_gateway_integration.ping](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/api_gateway_integration) | resource |
| [aws_api_gateway_integration_response.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/api_gateway_integration_response) | resource |
| [aws_api_gateway_method.ping](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/api_gateway_method) | resource |
| [aws_api_gateway_method_response.response_200](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/api_gateway_method_response) | resource |
| [aws_api_gateway_model.empty](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/api_gateway_model) | resource |
| [aws_api_gateway_resource.ping](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/api_gateway_resource) | resource |
| [aws_api_gateway_rest_api.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/api_gateway_rest_api) | resource |
| [aws_api_gateway_rest_api_policy.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/api_gateway_rest_api_policy) | resource |
| [aws_api_gateway_stage.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/api_gateway_stage) | resource |
| [aws_cloudwatch_log_group.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_log_group) | resource |
| [aws_iam_role.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role_policy.cloudwatch](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy) | resource |
| [aws_s3_bucket.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket) | resource |
| [aws_s3_bucket_object.cert](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_object) | resource |
| [aws_caller_identity.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity) | data source |
| [aws_iam_policy_document.api_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.assume_role_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.cw_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_region.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/region) | data source |

### Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_account_id"></a> [account\_id](#input\_account\_id) | aws account id to deploy | `string` | n/a | yes |
| <a name="input_api_resource_policy"></a> [api\_resource\_policy](#input\_api\_resource\_policy) | JSON formatted policy document that controls access to the API Gateway | `string` | `null` | no |
| <a name="input_api_stage_name"></a> [api\_stage\_name](#input\_api\_stage\_name) | n/a | `string` | n/a | yes |
| <a name="input_certificate_path"></a> [certificate\_path](#input\_certificate\_path) | n/a | `string` | n/a | yes |
| <a name="input_certificate_s3_key"></a> [certificate\_s3\_key](#input\_certificate\_s3\_key) | n/a | `string` | n/a | yes |
| <a name="input_dns_zone"></a> [dns\_zone](#input\_dns\_zone) | n/a | `string` | n/a | yes |
| <a name="input_endpoint_configuration"></a> [endpoint\_configuration](#input\_endpoint\_configuration) | n/a | `string` | `"REGIONAL"` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | n/a | `string` | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | n/a | `string` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | n/a | `string` | n/a | yes |
| <a name="input_security_policy"></a> [security\_policy](#input\_security\_policy) | n/a | `string` | `"TLS_1_2"` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | n/a | `map(any)` | n/a | yes |
| <a name="input_waf_allowed_ips"></a> [waf\_allowed\_ips](#input\_waf\_allowed\_ips) | n/a | `list(any)` | n/a | yes |
| <a name="input_wildcard_arn"></a> [wildcard\_arn](#input\_wildcard\_arn) | n/a | `string` | n/a | yes |
| <a name="input_xray_tracing_enabled"></a> [xray\_tracing\_enabled](#input\_xray\_tracing\_enabled) | n/a | `bool` | `false` | no |

### Outputs

| Name | Description |
|------|-------------|
| <a name="output_certid"></a> [certid](#output\_certid) | n/a |

<!--- END_TF_DOCS --->
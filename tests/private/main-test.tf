variable "group" {
  description = "only variable to group resources under the same prefix"
  type        = string
}

locals {
  name        = "ohp-api-${var.group}"
  account_id  = "215333367418"
  region      = "eu-west-1"
  environment = "int"

  tfm_x_acc_role_name = "xops-tfm-adm-x-acc-role"
  tfm_deploy_role_arn = "arn:aws:iam::${local.account_id}:role/${local.tfm_x_acc_role_name}-${local.environment}"
}

terraform {
  required_version = "~>0.14"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~>3.0"
    }
    local = {
      source  = "hashicorp/local"
      version = "~>2.0"
    }
  }
}

provider "aws" {
  region              = local.region
  allowed_account_ids = [local.account_id]
  assume_role {
    role_arn     = local.tfm_deploy_role_arn
    session_name = "terraform"
  }
}

module "private-api" {
  source         = "../../modules/private"
  api_name       = "test_api"
  api_stage_name = "dev"
  apigw_config = {
    lambda1 = {
      name             = "testFunc"
      path             = "path1"
      method           = "GET"
      integration_type = "AWS_PROXY"
      integration_arn  = "arn:aws:apigateway:${local.region}:lambda:path/2015-03-31/functions/arn:aws:lambda:${local.region}:${local.account_id}:function:testFunc/invocations"
    }
    lambda2 = {
      name             = "testFunc2"
      path             = "path2"
      method           = "PUT"
      integration_type = "AWS_PROXY"
      integration_arn  = "arn:aws:apigateway:eu-west-1:lambda:path/2015-03-31/functions/arn:aws:lambda:eu-west-1:720578572654:function:testFunc2/invocations"
    }
  }
  region_id = local.region
  tags = {
    Iac          = "terraform"
    IacRepo      = "none"
    Team         = "lanz"
    Stage        = local.environment
    Client       = "ohp"
    Service      = "apigw"
    ServiceGroup = "apigw-demo"
  }
}

# data "aws_route53_zone" "main" {
#   name         = local.dns_zone
#   private_zone = false
# }
# resource "aws_route53_record" "main" {
#   name    = module.apigw.domain_name
#   type    = "A"
#   zone_id = data.aws_route53_zone.main.zone_id

#   alias {
#     evaluate_target_health = true
#     name                   = module.apigw.regional_domain_name
#     zone_id                = module.apigw.regional_zone_id
#   }
# }

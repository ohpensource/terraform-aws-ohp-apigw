variable "group" {
  description = "only variable to group resources under the same prefix"
  type        = string
}

locals {
  name        = "ohp-api-${var.group}"
  account_id  = "215333367418"
  region      = "eu-west-1"
  environment = "int"

  dns_zone        = "infra.dev.ohpen.tech"
  wildcard_arn    = "arn:aws:acm:eu-west-1:215333367418:certificate/dfd2b59c-e7d3-489f-8af9-ac4119708296"
  waf_allowed_ips = ["92.109.81.211/32"]

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

module "apigw" {
  source = "../../modules/central-apigw"

  certificate_path   = "${path.root}/certs/apigw.pem"
  environment        = local.environment
  api_stage_name     = local.environment
  wildcard_arn       = local.wildcard_arn
  account_id         = local.account_id
  name               = local.name
  region             = local.region
  dns_zone           = local.dns_zone
  waf_allowed_ips    = local.waf_allowed_ips
  certificate_s3_key = "${local.name}.pem"
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

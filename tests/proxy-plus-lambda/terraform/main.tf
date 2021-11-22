locals {
  aws_region                = "eu-west-1"
  prefix_name               = "prefix-"
  tags                      = { "tag-1" = "tag-1-value" }
  tfm_x_acc_role_name       = "xops-tfm-adm-x-acc-role"
  aws_account_id            = "061211638568"
  environment               = "dev"
  tfm_deploy_role_arn       = "arn:aws:iam::${local.aws_account_id}:role/${local.tfm_x_acc_role_name}-${local.environment}"
  lambda_artifact_file_name = "../proxy-plus-lambda.zip"
}

terraform {
  required_version = "~>0.15"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~>3.0"
    }
  }
}

provider "aws" {
  region = local.aws_region
  assume_role {
    role_arn     = local.tfm_deploy_role_arn
    session_name = "terraform"
  }
}

resource "aws_lambda_function" "lambda" {
  function_name = "${local.prefix_name}-lambda"
  filename      = local.lambda_artifact_file_name
  handler       = "src/main.handler"
  runtime       = "nodejs14.x"
  role          = aws_iam_role.lambda_role.arn
}

resource "aws_iam_role" "lambda_role" {
  name = "${local.prefix_name}-iam"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "lambda.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}

module "proxy_plus_lambda_apigw" {
  source               = "../../../modules/proxy-plus-lambda"
  tags                 = local.tags
  prefix_name          = local.prefix_name
  lambda_invoke_arn    = aws_lambda_function.lambda.invoke_arn
  lambda_function_name = aws_lambda_function.lambda.function_name
  environment          = local.environment
}

provider "aws" {
  region = "us-east-1"
}

module "iam" {
  source           = "./modules/iam-role"
  lambda_role_name = "ec2-fghj-role"
}

module "start_lambda" {
  source           = "./modules/lambda-function"
  function_name    = "StartEC2Instances"
  handler_file     = "${path.module}/start_lambda.py"
  handler_name     = "start_lambda.lambda_handler"
  role_arn         = module.iam.lambda_role_arn
  environment_vars = {
    INSTANCE_IDS = "ami-0953476d60561c955"
  }
}

module "stop_lambda" {
  source           = "./modules/lambda-function"
  function_name    = "StopEC2Instances"
  handler_file     = "${path.module}/stop_lambda.py"
  handler_name     = "stop_lambda.lambda_handler"
  role_arn         = module.iam.lambda_role_arn
  environment_vars = {
    INSTANCE_IDS = "ami-0953476d60561c955"
  }
}

module "start_schedule" {
  source              = "./modules/cloudWatch-event"
  rule_name           = "StartEC2InstancesRule"
  schedule_expr       = "cron(0 18 ? * MON-FRI *)" 
  lambda_function_arn = module.start_lambda.lambda_role_arn
}

module "stop_schedule" {
  source              = "./modules/cloudWatch-event"
  rule_name           = "StopEC2InstancesRule"
  schedule_expr       =  "cron(0 18 ? * MON-FRI *)" 
  lambda_function_arn = module.stop_lambda.lambda_role_arn
}
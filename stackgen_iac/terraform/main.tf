module "stackgen_03c2edf1-ac0e-54d1-a642-8c8fb05c0aaf" {
  source              = "./modules/aws_s3_bucket"
  bucket              = "my-notification-bucket-987654"
  force_destroy       = false
  object_lock_enabled = false
  tags = {
    Environment = "dev"
    Name        = "my-notification-bucket"
  }
}

module "stackgen_069608fa-6b89-556a-a918-670e72528d50" {
  source                = "./modules/aws_iam_role"
  assume_role_policy    = "{\"Version\":\"2012-10-17\",\"Statement\":[{\"Effect\":\"Allow\",\"Principal\":{\"Service\":\"lambda.amazonaws.com\"},\"Action\":\"sts:AssumeRole\"}]}"
  description           = null
  force_detach_policies = true
  inline_policy         = []
  max_session_duration  = null
  name                  = "s3-put-printer-exec-role"
  path                  = null
  permissions_boundary  = null
  tags = {
    Name = "s3-put-printer-exec-role"
  }
}

module "stackgen_322303f6-1922-5e15-a2a3-65325cadd317" {
  source      = "./modules/aws_s3_bucket_notification"
  bucket      = module.stackgen_03c2edf1-ac0e-54d1-a642-8c8fb05c0aaf.id
  eventbridge = null
  lambda_function = [{
    events              = ["s3:ObjectCreated:Put"]
    filter_prefix       = ""
    filter_suffix       = ""
    id                  = "tf-s3-lambda-put-trigger"
    lambda_function_arn = "arn:aws:lambda:us-east-1:123456789012:function:s3-put-printer"
  }]
  queue = []
  topic = []
}

module "stackgen_49dd1f20-ed71-5883-bb0e-c3be548d27f4" {
  source                  = "./modules/aws_lambda_function"
  architectures           = ["x86_64"]
  code_signing_config_arn = "arn:aws:lambda:us-east-1:123456789012:code-signing-config:csc-0abc123def456789a"
  dead_letter_config      = []
  description             = "Triggered on S3 PUT - prints All good"
  environment             = []
  ephemeral_storage = [{
    size = 512
  }]
  file_system_config                 = []
  filename                           = "lambda_function.zip"
  function_name                      = "s3-put-printer"
  handler                            = "index.handler"
  image_config                       = []
  image_uri                          = null
  kms_key_arn                        = null
  layers                             = []
  logging_config                     = []
  memory_size                        = 128
  package_type                       = "Zip"
  publish                            = false
  replace_security_groups_on_destroy = null
  replacement_security_group_ids     = var.replacement_security_group_ids
  reserved_concurrent_executions     = -1
  role                               = module.stackgen_069608fa-6b89-556a-a918-670e72528d50.arn
  runtime                            = "python3.11"
  s3_bucket                          = null
  s3_key                             = null
  skip_destroy                       = null
  snap_start                         = []
  source_code_hash                   = "xyz789abc123=="
  tags = {
    Environment = "dev"
    Name        = "s3-put-printer"
  }
  timeout  = 30
  timeouts = null
  tracing_config = [{
    mode = "Active"
  }]
  vpc_config = []
}

module "stackgen_62638578-7e1f-5fb5-8727-3cd289e8ef22" {
  source                 = "./modules/aws_lambda_permission"
  action                 = "lambda:InvokeFunction"
  function_name          = module.stackgen_49dd1f20-ed71-5883-bb0e-c3be548d27f4.function_name
  function_url_auth_type = null
  principal              = "s3.amazonaws.com"
  qualifier              = null
  source_account         = null
  source_arn             = module.stackgen_03c2edf1-ac0e-54d1-a642-8c8fb05c0aaf.arn
}

module "stackgen_aafd2e98-f3c0-509c-b0f4-66db97bf0964" {
  source                  = "./modules/aws_s3_bucket_public_access_block"
  block_public_acls       = true
  block_public_policy     = true
  bucket                  = module.stackgen_03c2edf1-ac0e-54d1-a642-8c8fb05c0aaf.bucket
  ignore_public_acls      = true
  restrict_public_buckets = true
}

module "stackgen_c8724b32-a75b-5940-b5b3-d43c4a6c97e2" {
  source            = "./modules/aws_cloudwatch_log_group"
  name              = "/aws/lambda/s3-put-printer"
  retention_in_days = 14
  tags = {
    Name = "s3-put-printer-logs"
  }
}

module "stackgen_e2703edd-ab65-5ebf-82ac-0d12a910437e" {
  source     = "./modules/aws_iam_role_policy_attachment"
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
  role       = module.stackgen_069608fa-6b89-556a-a918-670e72528d50.name
}

module "stackgen_fd6713aa-64fe-5346-bcbc-c25968672b69" {
  source = "./modules/aws_s3_bucket_versioning"
  bucket = module.stackgen_03c2edf1-ac0e-54d1-a642-8c8fb05c0aaf.bucket
  mfa    = ""
  versioning_configuration = [{
    mfa_delete = "Enabled"
    status     = "Enabled"
  }]
}


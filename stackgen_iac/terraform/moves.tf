moved {
  from = aws_s3_bucket.main
  to   = module.stackgen_03c2edf1-ac0e-54d1-a642-8c8fb05c0aaf.aws_s3_bucket.this
}

moved {
  from = aws_s3_bucket_notification.put_trigger
  to   = module.stackgen_322303f6-1922-5e15-a2a3-65325cadd317.aws_s3_bucket_notification.this
}

moved {
  from = aws_lambda_function.s3_put_printer
  to   = module.stackgen_49dd1f20-ed71-5883-bb0e-c3be548d27f4.aws_lambda_function.this
}

moved {
  from = aws_cloudwatch_log_group.lambda_logs
  to   = module.stackgen_c8724b32-a75b-5940-b5b3-d43c4a6c97e2.aws_cloudwatch_log_group.this
}

moved {
  from = aws_iam_role.lambda_exec_role
  to   = module.stackgen_069608fa-6b89-556a-a918-670e72528d50.aws_iam_role.this
}

moved {
  from = aws_iam_role_policy_attachment.lambda_basic_execution
  to   = module.stackgen_e2703edd-ab65-5ebf-82ac-0d12a910437e.aws_iam_role_policy_attachment.this
}

moved {
  from = aws_lambda_permission.allow_s3_invoke
  to   = module.stackgen_62638578-7e1f-5fb5-8727-3cd289e8ef22.aws_lambda_permission.this
}

moved {
  from = aws_s3_bucket_public_access_block.main
  to   = module.stackgen_aafd2e98-f3c0-509c-b0f4-66db97bf0964.aws_s3_bucket_public_access_block.this
}

moved {
  from = aws_s3_bucket_versioning.main
  to   = module.stackgen_fd6713aa-64fe-5346-bcbc-c25968672b69.aws_s3_bucket_versioning.this
}


################################################################################


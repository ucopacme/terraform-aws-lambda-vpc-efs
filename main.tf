 resource "aws_lambda_function" "this" {
    count = var.enabled ? 1 : 0
    filename = var.filename
    source_code_hash = var.source_code_hash
    function_name = var.function_name
    role          = var.role
    handler       = var.handler
    runtime       = var.runtime
    timeout       = var.timeout
    description   = var.description
    tags          = var.tags
    vpc_config {
      subnet_ids         = var.subnet_ids
      security_group_ids = var.security_group_ids
    }
    file_system_config {
      local_mount_path = var.file_system_local_mount_path
      arn              = var.file_system_access_point_arn
    }
  }

resource "aws_lambda_permission" "test" {
  statement_id  = "AllowS3Invoke"
  action        = "lambda:InvokeFunction"
  function_name = join("", aws_lambda_function.this.*.function_name)
  principal     = "s3.amazonaws.com"
  source_arn    = var.s3_bucket_id
}

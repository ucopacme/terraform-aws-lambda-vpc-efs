# terraform-aws-lambda-vpc-efs
Lambda function integrated with VPC and EFS





-->

Terraform module to provision AWS [`Lambda function with EFS and VPC integration`]



## Introduction

The module will create:

*  Lambda function integrated with VPC and EFS


## Usage
1. Create main.tf config file, copy/past the following configuration.



```hcl

#
# 

# make sure you deploy the security group before creating ec2 instance, ec2 instance depends on the security group.


data "archive_file" "DataSource" {
  type        = "zip"
  source_dir  = "qa_scripts"
  output_path = "outputs/qa.py"
}

module "lambda_qa" {
  source                       = "git::https://git@github.com/ucopacme/terraform-aws-lambda-vpc-efs.git//"
  role                         = join("", module.iam-role.iam_role_arn)
  filename                     = data.archive_file.DataSource.output_path
  source_code_hash             = data.archive_file.DataSource.output_base64sha256
  description                  = "Lambda Function to move S3 data to EFS"
  function_name                = local.function_name
  runtime                      = local.runtime
  handler                      = local.handler
  subnet_ids                   = [local.data_subnets[0], local.data_subnets[1]]
  security_group_ids           = [module.sg.id]
  s3_bucket_id                 = module.s3.bucket_arn
  file_system_local_mount_path = local.file_system_local_mount_path
  file_system_access_point_arn = local.file_system_access_point_arn
  tags = {
    "ucop:application" = local.application
    "ucop:createdBy"   = local.createdBy
    "ucop:enviroment"  = local.environment
    "ucop:group"       = local.group
    "ucop:source"      = local.source
  }

}

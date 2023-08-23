variable "enabled" {
  default     = true
  description = "Set to `false` to prevent the module from creating any resources"
  type        = bool
}
variable "role" {
  type = string
  description = "(optional) describe your variable"
  default = ""
}


variable "function_name" {
  default = ""
}

variable "handler" {
  default = "lambda"
}

variable "description" {
  default = ""
}

variable "runtime" {
  type = string
  default = ""
}
variable "s3_bucket_id" {
  type = string
  default = ""
}
variable "source_code_hash" {
  type = string
  default = ""
}

variable "filename" {
  type = string
  default = ""
}
variable "subnet_ids" {
  type = list(string)
  default = null
}
variable "security_group_ids" {
  type = list(string)
  default = null
}

variable "file_system_local_mount_path" {
  type = string
  default = ""
}
variable "file_system_access_point_arn" {
  type = string
  default = ""
}
variable "tags" {
  type = map
  default = {}

}
variable "timeout" {
  type = string
  description = "(optional) describe your variable"
  default = "420"
}

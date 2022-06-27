variable "aws_region" {
  type        = string
  description = ""
  default     = "sa-east-1"
}

variable "aws_profile" {
  type        = string
  description = ""
  default     = "devops.noob"
}

variable "aws_account_id" {
  type        = number
  description = ""
  default     = account id
}

variable "service_name" {
  type        = string
  description = ""
  default     = "autoscaling-app"
}

variable "instance_type" {
  type        = string
  description = ""
  default     = "t3.micro"
}

variable "instance_key_name" {
  type        = string
  description = ""
  default     = "dev-key-admin-sp"
}

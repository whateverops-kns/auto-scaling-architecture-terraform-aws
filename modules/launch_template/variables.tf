variable "launch_template_name" {
  type        = string
  description = "Name of the Launch Template"
}

variable "ami_id" {
  type        = string
  description = "ID of the AMI"
}

variable "environment" {
  type        = string
  description = "Name of the Environment"
}

variable "key_name" {
  type        = string
  description = "Private Key Name"
}

variable "security_group_id" {
  type        = string
  description = "App Secuity Group ID"
}

variable "instance_type" {
  type        = string
  description = "Type of the Instance"
}

variable "user-data" {
  type = string
  description = "User Data"
}
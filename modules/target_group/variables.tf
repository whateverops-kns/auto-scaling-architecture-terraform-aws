variable "vpc_id" {
  type        = string
  description = "ID of the VPC"
}

variable "environment" {
  type        = string
  description = "Name of the Environment"
}

variable "target_group_name" {
  type        = string
  description = "Name of the Target Group"
}
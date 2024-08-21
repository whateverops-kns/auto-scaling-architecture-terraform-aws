variable "app_security_group_name" {
  type        = string
  description = "Name of the App Security Group"
}

variable "alb_security_group_name" {
  type        = string
  description = "Name of the ALB Security Group"
}

variable "environment" {
  type        = string
  description = "Name of the Environment"
}

variable "vpc_id" {
  type        = string
  description = "ID of the VPC"
}
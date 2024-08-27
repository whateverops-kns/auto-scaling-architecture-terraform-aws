variable "region" {
  type        = string
  description = "AWS Region"
}

variable "environment" {
  type        = string
  description = "Name of the Environment"
}

variable "vpc_name" {
  type        = string
  description = "Name of the VPC"
}

variable "cidr_range" {
  type        = string
  description = "CIDR Range"
  default     = "10.0.0.0/16"
}

variable "azs" {
  type        = set(string)
  description = "List of AZs"
  default     = ["us-east-1a", "us-east-1b"]
}

variable "private_subnets" {
  type        = set(string)
  description = "List of Private Subnets"
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "public_subnets" {
  type        = set(string)
  description = "List of Public Subnets"
  default     = ["10.0.101.0/24", "10.0.102.0/24"]

}

variable "launch_template_name" {
  type = string
}

variable "app_security_group_name" {
  type = string
}

variable "alb_security_group_name" {
  type = string
}

variable "ami_id" {
  type = string
}


variable "key_name" {
  type = string
}



variable "launch_template_instance_type" {
  type        = string
  description = "Type of the Instance for Launch Template"
}

variable "target_group_name" {
  type = string
}

variable "load_balancer_name" {
  type = string
}

variable "auto_scaling_group_name" {
  type = string
}

variable "iam_instance_profile_name" {
  type        = string
}

variable "ec2_iam_data" {
  type = map(string)
  default = {
    iam_role_name   = "EC2CodeDeployIAMRole"
    iam_policy_name = "EC2CodeDeployIAMPolicy"
  }
}
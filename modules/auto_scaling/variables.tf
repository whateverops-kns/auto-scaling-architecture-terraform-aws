variable "environment" {
  type        = string
  description = "Name of the Environment"
}


variable "auto_scaling_group_name" {
  type        = string
  description = "Name of the Auto Scaing Group"
}

variable "auto_scaling_max_size" {
  type        = number
  description = "Scaling Group Max Size"
}


variable "auto_scaling_min_size" {
  type        = number
  description = "Scaling Group Max Size"
}

variable "auto_scaling_desired_capacity" {
  type        = number
  description = "Scaling Group desired capacity"
}

variable "launch_template_id" {
  type        = string
  description = "ID of the Launch Template"
}

variable "vpc_zone_identifier" {
  type        = set(string)
  description = "Subnets to Launch Auto Scaling Group"
}

variable "load_balancer_name" {
  type        = string
  description = "Name of the LB"
}

variable "target_group_arn" {
  type        = string
  description = "ARN of the Target Group"
}
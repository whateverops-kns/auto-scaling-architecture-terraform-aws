variable "environment" {
  type        = string
  description = "Name of the Environment"
}

variable "load_balancer_name" {
  type        = string
  description = "Name of the Load Balancer"
}

variable "load_balancer_sg_ids" {
  type        = set(string)
  description = "List for LB Security Group Ids"
}

variable "load_balancer_subnet_ids" {
  type        = set(string)
  description = "List of LB Subnet Ids"
}

variable "target_group_arn" {
  type = string
  description = "ARN of Target Group"
}
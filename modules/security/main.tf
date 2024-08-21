locals {
  app_sg_name = "${var.environment}-${var.app_security_group_name}"
  alb_sg_name = "${var.environment}-${var.alb_security_group_name}"
}


resource "aws_security_group" "app_sg" {
  name = local.app_sg_name

  description = "Allow TLS inbound traffic and all outbound traffic to App"

  vpc_id = var.vpc_id

}

resource "aws_vpc_security_group_ingress_rule" "allow_http_app_sg" {
  security_group_id = aws_security_group.app_sg.id
  cidr_ipv4         = data.aws_vpc.this.cidr_block
  from_port         = 80
  ip_protocol       = "tcp"
  to_port           = 80
}

resource "aws_vpc_security_group_ingress_rule" "allow_ssh_app_sg" {
  security_group_id = aws_security_group.app_sg.id
  cidr_ipv4         = data.aws_vpc.this.cidr_block
  from_port         = 22
  ip_protocol       = "tcp"
  to_port           = 22
}

resource "aws_vpc_security_group_egress_rule" "allow_all_traffic_ipv4_app_sg" {
  security_group_id = aws_security_group.app_sg.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1" # semantically equivalent to all ports
}


resource "aws_security_group" "alb_sg" {
  name = local.alb_sg_name

  description = "Allow TLS inbound traffic and all outbound traffic to ALB"

  vpc_id = var.vpc_id
}

resource "aws_vpc_security_group_ingress_rule" "allow_all_alb_sg" {
  security_group_id = aws_security_group.alb_sg.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1"
}

resource "aws_vpc_security_group_egress_rule" "allow_all_traffic_ipv4_alb_sg" {
  security_group_id = aws_security_group.alb_sg.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1" # semantically equivalent to all ports
}
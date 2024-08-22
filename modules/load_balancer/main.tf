locals {
  load_balancer_name = "${var.environment}-${var.load_balancer_name}"
}


resource "aws_lb" "this" {
  name               = local.load_balancer_name
  internal           = false
  load_balancer_type = "application"
  security_groups    = var.load_balancer_sg_ids
  subnets            = var.load_balancer_subnet_ids
}

resource "aws_lb_listener" "this" {
  load_balancer_arn = aws_lb.this.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = var.target_group_arn
  }
}

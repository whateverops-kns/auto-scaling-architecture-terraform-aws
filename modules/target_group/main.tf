locals {
  target_group_name = "${var.environment}-${var.target_group_name}"
}

resource "aws_lb_target_group" "this" {
  name     = local.target_group_name
  port     = 80
  protocol = "HTTP"
  vpc_id   = data.aws_vpc.this.id
}

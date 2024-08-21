locals {
  auto_scaling_group_name = "${var.environment}-${var.auto_scaling_group_name}"
}

resource "aws_autoscaling_group" "this" {
  name                      = local.auto_scaling_group_name
  max_size                  = var.auto_scaling_max_size
  min_size                  = var.auto_scaling_min_size
  desired_capacity          = var.auto_scaling_desired_capacity
  health_check_grace_period = 300
  health_check_type         = "ELB"


  force_delete = true

  vpc_zone_identifier = var.vpc_zone_identifier

  launch_template {
    id      = var.launch_template_id
    version = "$Latest"
  }


}


# resource "aws_autoscaling_attachment" "this" {
#   autoscaling_group_name = aws_autoscaling_group.this.id
#   elb                    = var.load_balancer_id
# }

resource "aws_autoscaling_attachment" "target_group_attachment" {
  autoscaling_group_name = aws_autoscaling_group.this.id
  lb_target_group_arn = var.target_group_arn
}


locals {
  name = "${var.environment}-${var.launch_template_name}"
}

resource "aws_iam_instance_profile" "this" {
  name = var.iam_instance_profile_name
  role = var.iam_role_name
}


resource "aws_launch_template" "this" {

  name = local.name

  image_id = var.ami_id

  key_name = data.aws_key_pair.this.key_name

  vpc_security_group_ids = [var.security_group_id]

  instance_type = var.instance_type

  update_default_version = true

  iam_instance_profile {
    name = aws_iam_instance_profile.this.name
  }

  block_device_mappings {
    device_name = "/dev/sdf"

    ebs {
      volume_size = 8
    }
  }

  user_data = var.user-data


}

resource "aws_efs_file_system" "wp-app-efs" {
  creation_token = "wp-app"
}

resource "aws_efs_mount_target" "wp-app-efs-tgt-a" {
  file_system_id  = aws_efs_file_system.wp-app-efs.id
  subnet_id       = var.internal_subnets[0]
  security_groups = var.vpc_app_secgroups
}

resource "aws_efs_mount_target" "wp-app-efs-tgt-b" {
  file_system_id  = aws_efs_file_system.wp-app-efs.id
  subnet_id       = var.internal_subnets[1]
  security_groups = var.vpc_app_secgroups
}

resource "aws_efs_access_point" "wp-app-efs-ap" {
  file_system_id = aws_efs_file_system.wp-app-efs.id
}

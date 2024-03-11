resource "aws_efs_file_system" "wp-app-efs" {
  creation_token = "wp-app"
}

resource "aws_efs_mount_target" "wp-app-efs-tgt-a" {
  file_system_id = aws_efs_file_system.wp-app-efs.id
  subnet_id      = var.internal_subnets[0]
}

resource "aws_efs_mount_target" "wp-app-efs-tgt-b" {
  file_system_id = aws_efs_file_system.wp-app-efs.id
  subnet_id      = var.internal_subnets[1]
}

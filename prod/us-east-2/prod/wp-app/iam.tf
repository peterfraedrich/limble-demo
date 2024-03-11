resource "aws_iam_role" "wp-app-ecs-role" {
  name = "wp-app-ecs-role"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "ecs-tasks.amazonaws.com"
        }
      },
    ]
  })
}

resource "aws_iam_policy" "wp-app-ecs-policy" {
  name   = "wp-app-ecs-policy"
  policy = <<EOF
{
	"Version": "2012-10-17",
	"Statement": [
		{
			"Sid": "Statement1",
			"Effect": "Allow",
			"Action": [
				"secretsmanager:DescribeSecret",
				"secretsmanager:GetRandomPassword",
				"secretsmanager:GetResourcePolicy",
				"secretsmanager:GetSecretValue",
				"secretsmanager:ListSecretVersionIds",
				"secretsmanager:BatchGetSecretValue",
				"secretsmanager:ListSecrets"
			],
			"Resource": "*"
		},
		{
			"Sid": "Statement2",
			"Effect": "Allow",
			"Action": [
				"cloudwatch:*"
			],
			"Resource": "*"
		},
    {
      "Sid": "Statement3",
			"Effect": "Allow",
			"Action": [
				"application-autoscaling:*",
        "ecs:DescribeServices",
        "ecs:UpdateService"
			],
			"Resource": "*"
    }
	]
}
EOF
}

resource "aws_iam_role_policy_attachment" "wp-app-ecs-attachment" {
  role       = aws_iam_role.wp-app-ecs-role.name
  policy_arn = aws_iam_policy.wp-app-ecs-policy.arn
}

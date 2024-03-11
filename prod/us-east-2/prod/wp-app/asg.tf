resource "aws_appautoscaling_target" "wp-app-asg" {
  max_capacity       = 5
  min_capacity       = 1
  resource_id        = "service/${aws_ecs_cluster.wp-app-cluster.name}/${aws_ecs_service.wp-app-service.name}"
  scalable_dimension = "ecs:service:DesiredCount"
  service_namespace  = "ecs"
}

resource "aws_appautoscaling_policy" "wp-app-asg-rule-mem" {
  name               = "wp-app-mem"
  policy_type        = "TargetTrackingScaling"
  resource_id        = aws_appautoscaling_target.wp-app-asg.id
  scalable_dimension = aws_appautoscaling_target.wp-app-asg.scalable_dimension
  service_namespace  = aws_appautoscaling_target.wp-app-asg.service_namespace

  target_tracking_scaling_policy_configuration {
    predefined_metric_specification {
      predefined_metric_type = "ECSServiceAverageMemoryUtilization"
    }

    target_value = 80
  }
}

resource "aws_appautoscaling_policy" "wp-app-asg-rule-cpu" {
  name               = "wp-app-cpu"
  policy_type        = "TargetTrackingScaling"
  resource_id        = aws_appautoscaling_target.wp-app-asg.resource_id
  scalable_dimension = aws_appautoscaling_target.wp-app-asg.scalable_dimension
  service_namespace  = aws_appautoscaling_target.wp-app-asg.service_namespace

  target_tracking_scaling_policy_configuration {
    predefined_metric_specification {
      predefined_metric_type = "ECSServiceAverageCPUUtilization"
    }

    target_value = 80
  }
}

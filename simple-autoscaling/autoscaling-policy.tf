# Scale up
resource "aws_autoscaling_policy" "example-cpu-scaleup" {
  name                   = "example-cpu-policy-scaleup"
  autoscaling_group_name = "${aws_autoscaling_group.example.name}"
  adjustment_type        = "ChangeInCapacity"
  scaling_adjustment     = "1"
  cooldown               = "300"
  policy_type            = "SimpleScaling"
}

# Scale up
resource "aws_cloudwatch_metric_alarm" "example-cpu-scaleup" {
  alarm_name          = "example-cpu-scaleup"
  alarm_description   = "example-cpu-scaleup"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "2"
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = "120"
  statistic           = "Average"
  threshold           = "30"

  dimensions = {
    "AutoScalingGroupName" = "${aws_autoscaling_group.example.name}"
  }

  actions_enabled = true
  alarm_actions   = ["${aws_autoscaling_policy.example-cpu-scaleup.arn}"]
}

# Scale down
resource "aws_autoscaling_policy" "example-cpu-scaledown" {
  name                   = "example-cpu-scaledown"
  autoscaling_group_name = "${aws_autoscaling_group.example.name}"
  adjustment_type        = "ChangeInCapacity"
  scaling_adjustment     = "-1"
  cooldown               = "300"
  policy_type            = "SimpleScaling"
}

# Scale down
resource "aws_cloudwatch_metric_alarm" "example-cpu-scaledown" {
  alarm_name          = "example-cpu-scaledown"
  alarm_description   = "example-cpu-scaledown"
  comparison_operator = "LessThanOrEqualToThreshold"
  evaluation_periods  = "2"
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = "120"
  statistic           = "Average"
  threshold           = "5"

  dimensions = {
    "AutoScalingGroupName" = "${aws_autoscaling_group.example.name}"
  }

  actions_enabled = true
  alarm_actions   = ["${aws_autoscaling_policy.example-cpu-scaledown.arn}"]
}

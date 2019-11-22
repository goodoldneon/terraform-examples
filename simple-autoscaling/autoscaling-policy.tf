# Scaleup policy
# Start 1 instance.
resource "aws_autoscaling_policy" "example-cpu-scaleup" {
  name                   = "example-cpu-policy-scaleup"
  autoscaling_group_name = "${aws_autoscaling_group.example.name}"
  adjustment_type        = "ChangeInCapacity"
  policy_type            = "SimpleScaling"

  # How long to wait before next scaling activity
  cooldown = 30

  scaling_adjustment = 1
}

# Scaleup alarm
# Trigger when CPU% is >= 30% for 1 60-second period.
resource "aws_cloudwatch_metric_alarm" "example-cpu-scaleup" {
  alarm_name          = "example-cpu-scaleup"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = 1
  metric_name         = "CPUUtilization"

  # Monitor EC2 instances in CloudWatch.
  namespace = "AWS/EC2"

  period            = 60
  statistic         = "Average"
  threshold         = 30
  alarm_actions     = ["${aws_autoscaling_policy.example-cpu-scaleup.arn}"]
  alarm_description = "example-cpu-scaleup"

  dimensions = {
    "AutoScalingGroupName" = "${aws_autoscaling_group.example.name}"
  }
}

# Scaledown policy
# Terminate 1 instance.
resource "aws_autoscaling_policy" "example-cpu-scaledown" {
  name                   = "example-cpu-scaledown"
  autoscaling_group_name = "${aws_autoscaling_group.example.name}"
  adjustment_type        = "ChangeInCapacity"
  policy_type            = "SimpleScaling"

  # How long to wait before next scaling activity
  cooldown = 30

  scaling_adjustment = -1
}

# Scaledown policy
# Trigger when CPU% is <= 5% for 1 60-second period.
resource "aws_cloudwatch_metric_alarm" "example-cpu-scaledown" {
  alarm_name          = "example-cpu-scaledown"
  comparison_operator = "LessThanOrEqualToThreshold"
  evaluation_periods  = 1
  metric_name         = "CPUUtilization"

  # Monitor EC2 instances in CloudWatch.
  namespace = "AWS/EC2"

  period            = 60
  statistic         = "Average"
  threshold         = 5
  alarm_actions     = ["${aws_autoscaling_policy.example-cpu-scaledown.arn}"]
  alarm_description = "example-cpu-scaledown"

  dimensions = {
    "AutoScalingGroupName" = "${aws_autoscaling_group.example.name}"
  }
}

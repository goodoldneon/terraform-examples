resource "aws_autoscaling_group" "web_asg" {
  launch_configuration = "${aws_launch_configuration.web.id}"
  availability_zones   = "${data.aws_availability_zones.all.names}"
  min_size             = 2
  max_size             = 10
  load_balancers       = ["${aws_elb.web.name}"]
  health_check_type    = "ELB"

  lifecycle {
    create_before_destroy = true
  }

  tag {
    key                 = "Name"
    value               = "web_asg"
    propagate_at_launch = true
  }
}

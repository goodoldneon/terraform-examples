resource "aws_autoscaling_group" "example" {
  name_prefix          = "example-"
  max_size             = 10
  min_size             = 2
  availability_zones   = "${data.aws_availability_zones.all.names}"
  launch_configuration = "${aws_launch_configuration.example.id}"
  health_check_type    = "ELB"
  load_balancers       = ["${aws_elb.example.name}"]
}

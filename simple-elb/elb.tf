resource "aws_elb" "example" {
  name               = "example"
  availability_zones = "${data.aws_availability_zones.all.names}"
  security_groups    = ["${aws_security_group.elb.id}"]

  listener {
    instance_port     = 8080
    instance_protocol = "http"
    lb_port           = 80
    lb_protocol       = "http"
  }

  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 2
    target              = "HTTP:8080/"
    interval            = 30
    timeout             = 3
  }
}

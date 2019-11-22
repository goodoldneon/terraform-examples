# EC2 instance that the ASG will start
resource "aws_launch_configuration" "example" {
  name_prefix     = "example-"
  image_id        = "${lookup(var.amis, var.region)}"
  instance_type   = "t2.micro"
  key_name        = "${aws_key_pair.example.key_name}"
  security_groups = ["${aws_security_group.allow-ssh.id}"]
}

resource "aws_autoscaling_group" "example" {
  name_prefix               = "example-"
  max_size                  = 2
  min_size                  = 1
  vpc_zone_identifier       = "${aws_subnet.public.*.id}"
  launch_configuration      = "${aws_launch_configuration.example.name}"
  health_check_type         = "EC2"

  # Allow deletion without draining instances.
  force_delete              = true
}

resource "aws_launch_configuration" "example" {
  name_prefix     = "terraform-lc-"
  image_id        = "${lookup(var.amis, var.region)}"
  instance_type   = "t2.micro"
  key_name        = "${aws_key_pair.example.key_name}"
  security_groups = ["${aws_security_group.allow-ssh.id}"]
}

resource "aws_autoscaling_group" "example" {
  name                      = "example"
  # vpc_zone_identifier       = ["${aws_subnet.main-public-1.id}", "${aws_subnet.main-public-2.id}"]
  vpc_zone_identifier       = "${aws_subnet.public.id}"
  launch_configuration      = "${aws_launch_configuration.example.name}"
  min_size                  = 1
  max_size                  = 2
  health_check_grace_period = 300
  health_check_type         = "EC2"
  force_delete              = true

  tag {
    key                 = "Name"
    value               = "ec2 instance"
    propagate_at_launch = true
  }
}

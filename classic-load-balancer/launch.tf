resource "aws_launch_configuration" "web" {
  name_prefix     = "terraform-lc-"
  image_id        = "${lookup(var.amis, var.region)}"
  instance_type   = "t2.micro"
  security_groups = ["${aws_security_group.web.id}"]

  user_data = <<-EOF
              #!/bin/bash
              hostname -I > index.html
              nohup busybox httpd -f -p 8080 &
              EOF

  lifecycle {
    create_before_destroy = true
  }
}

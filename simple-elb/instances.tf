resource "aws_launch_configuration" "example" {
  name_prefix     = "example-"
  image_id        = "${lookup(var.amis, var.region)}"
  instance_type   = "t2.micro"
  security_groups = ["${aws_security_group.instance.id}"]

  # Display IP address as page content
  user_data = <<-EOF
              #!/bin/bash
              hostname -I > index.html
              nohup busybox httpd -f -p 8080 &
              EOF
}

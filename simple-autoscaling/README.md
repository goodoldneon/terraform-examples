## Overview

- Autoscale based on CPU:
  - Add an instance if CPU >= 30% for 60 seconds.
  - Remove an instance if CPU <= 5% for 60 seconds.

## Before You Start

- AWS CLI is configured.
- Terraform is installed.
- Have an SSH key in `~/.ssh/id_rsa`.
- You've run `terraform init` in this folder.

## Instructions

1. Run `terraform apply` to provision AWS.
1. Browse to EC2 in your AWS console. Copy the IP address for the EC2 instance.
1. Run `ssh ubuntu@<instance-ip>` to SSH into the instance.
1. Run `sudo apt-get install stress` to install `stress`.
1. Run `stress --cpu 2 timeout 300` to add CPU load.
1. Browse to CloudWatch in your AWS console. You should eventually see the `example-cpu-scaleup` alarm.
1. Browse to EC2 in your AWS console. You should eventually see the 2nd EC2 instance.
1. Stop `stress` in the 1st EC2 instance.
1. Browse to CloudWatch in your AWS console. You should eventually see the `example-cpu-scaledown` alarm.
1. Browse to EC2 in your AWS console. The 2nd EC2 instance should eventually terminate.

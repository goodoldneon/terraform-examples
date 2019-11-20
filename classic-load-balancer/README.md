## Overview

An Elastic Load Balancer which creates one instance per availability zone in a region.

## Instructions

1. Before you start.
   - AWS CLI is configured.
   - Terraform is installed.
   - Have an SSH key in `~/.ssh/id_rsa`.
   - Run `terraform init`.
1. Run `terraform apply` to provision AWS.
1. Once it's done, you should see an outputs:
   - `elb_dns_name` -- Public DNS
1. In a browser, paste `elb_dns_name`.
1. You should see the private IP address of an instance. Refreshing the page should show the private IP address of the other instance.

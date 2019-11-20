## Overview

Can only SSH into the private instance via the bastion.

- Instances
  - Bastion -- On a public subnet
  - Private -- On a private subnet
- Users
  - foo -- An admin

## Instructions

1. Before you start.
   - AWS CLI is configured.
   - Terraform is installed.
   - Have an SSH key in `~/.ssh/id_rsa`.
1. Run `terraform apply` to provision AWS.
1. Once it's done, you should see two outputs:
   - `bastion_public_ip` -- Public IP address for the bastion instance.
   - `private_ip` -- Private IP address for the private instance.
1. Run `ssh ubuntu@<bastion_public_ip> -o "proxycommand ssh -W %h:%p ubuntu@<private_ip>"` to SSH into the private instance.
   - Replace `<bastion_public_ip>` and `<private_ip>` with the actual IP addresses.
1. You should be inside the private instance.

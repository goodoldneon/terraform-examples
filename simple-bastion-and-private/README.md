## Overview

Can only SSH into the private instance via the bastion.

- Instances
  - Bastion -- On a public subnet
  - Private -- On a private subnet
- Users
  - foo -- An admin

## Before You Start

- AWS CLI is configured.
- Terraform is installed.
- Have an SSH key in `~/.ssh/id_rsa`.
- You've run `terraform init` in this folder.

## Instructions

1. Run `terraform apply` to provision AWS.
1. Once it's done, you should see two outputs:
   - `bastion_public_ip` -- Public IP address for the bastion instance.
   - `private_ip` -- Private IP address for the private instance.
1. Set the outputs to env vars:
   - `BASTION_IP=<bastion_public_ip>`
   - `PRIVATE_IP=<private_ip>`
1. Run `ssh ubuntu@$PRIVATE_IP -o "proxycommand ssh -W %h:%p ubuntu@${BASTION_IP}"` to SSH into the private instance.
1. You should be inside the private instance.

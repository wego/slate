# Wego Infrastructure

## Overview

https://geeks.wego.com/infrastructure-as-a-code-iac-we-go-fully-automated/

## Build and Release

Our build and release process is automated using Jenkins and Ansible.

For each service, we have two separate deployment pipelines - one for autoscaling new instances, and the other for performing rolling updates across all instances.

Taking `place-services` as example, we will have:

1. Jenkins job `place-services-deploy` and Ansible playbook `place-services-deploy.yml` to only deploy instances spawned by the autoscaler. This job is triggered when a new instance is launched by the autoscaling process.

2. Jenkins job `place-services-deploy-all` and Ansible playbook `place-services-deploy-all.yml` to deploy all instances. This job is triggered manually or by GitHub web hook, and it will perform updates on the instances one by one.

We also have jobs to run configuration updates across all metasearch/microservices instances:

1. `metasearch-configure`

2. `micro-services-configure`

## Upgrading Kong

As Kong upgrades usually have breaking changes, it is recommended to upgrade Kong using blue-green deployment.

1. Modify the Ansible playbook according to Kong's [upgrade notes](https://github.com/Kong/kong/blob/master/UPGRADE.md) for the respective version
    - Make sure the green Kong is pointing to its own RDS instance so as to avoid schema conflicts with the blue Kong's RDS instance, this can be configured in `settings-staging.yml` or `settings-production.yml`
2. Build AMI using Packer and [update AMI of green Kong](https://github.com/wego/metacloud/blob/master/terraform/kong-production/terraform.tfvars#L48) in the Terraform config file
3. During Terraform apply, the green Kong may or may not run. If it doesn't run, troubleshoot by inspecting Kong's process logs using `journalctl -u kong`
4. Assuming green Kong is running, test each endpoint to make sure they are working fine
5. Forward 10% of traffic to green Kong, monitor the CloudWatch metrics on green Kong's ELB for any anomalies in Requests Count and HTTP 4XXs Count
    - There could be a spike in the number of 4XXs during traffic forwarding. This is expected as it mostly comprised of 403 responses to bots' requests since green Kong's response cache is mostly empty. If Kong is returning a cached response to bots, the response code will be 304
6. Assuming the metrics are looking good, forward the remaining traffic to green Kong
7. Since green Kong is receiving 100% traffic now, upgrade blue Kong using the same steps from 2-6
8. At this point, blue Kong is upgraded and is receiving 100% traffic, we do Terraform apply again to update green Kong to use blue Kong's AMI so that they are sharing the same RDS instance
9. Remove green Kong's RDS instance since it is only used for blue-green deployment

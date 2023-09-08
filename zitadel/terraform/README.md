# Automation for Zitadel Configuration
This document provides steps on how to create the configuration required on Zitadel using the scripts provided.
Scripts create all required configuration such as organization, project, roles, applications, etc.

The idea is to use the same set of scripts to configure any Zitadel instance (local, dev, prod, etc).

## Preparation before run

1. Install/Setup Zitadel instance
2. Terraform provider version 1.5.2 and above
3. Credential file local-token.json (located in the same directory as main.tf)
   * Operation reference the chapter 'Add Service User and Get Credential File' in [zitadel/README.md](../README.md#Add Service User and Get Credential File)

## Run Scripts

* Connection to remote (testbed) Zitadel instance usage configuration file: testbed.tfvars.
* Connection to local Zitadel instance using configuration file: local.tfvars.
* There are two token types for authorization with a default value of 'OpaqueToken' and another value of 'JWT'. Better performance with type 'JWT', safer with type 'OpaqueToken'.
  * Update the default value of the variable `auth_token_type` in file [variables.tf](./variables.tf) with 'JWT' to improve performance of authorization.
* Config SMTP to enable function 'User Registration'.
   * Operation reference the chapter 'Config SMTP to Enable User Registration' in [zitadel/README.md](../README.md#Add Admin User for Xpanse).

Example of connecting to a remote Zitadel instance
```shell
 terraform init
 terraform plan -var-file=environments/testbed.tfvars
 terraform apply -auto-approve -var-file=environments/testbed.tfvars
```

> Note: Due to an open bug in Zitadel-Terraform-Provider, we are not able to change branding icons. This must be done manually for now.
> Operation reference the chapter 'Manual Configuration on Console' in [zitadel/README.md](../README.md#Manual Configuration on Console)

## Get Consumer Details

Get the output of the applications created by the above scripts. This is needed for configuring the consuming applications.
```shell
terraform output
```

## Remove configuration

All added configuration can be removed using the below command.

```shell
terraform destroy -auto-approve -var-file=environments/testbed.tfvars
```

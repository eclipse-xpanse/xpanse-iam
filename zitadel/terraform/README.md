### Automation for Zitadel Configuration
This document provides steps on how to create the configuration required on Zitadel using the scripts provided.
Scripts creates all required configuration such as organization, project, roles, applications, etc.

## Preparation before run

1. Install/Setup Zitadel instance
2. Terraform provider version 1.5.2 and above
3. Credential file local-token.json (located in the same directory as main.tf)
   * Log in to the Zitadel management interface and navigate to Users, Click on Service Users to create an user and download the JWT key for the same. 

## Run Scripts

* Connection to remote (testbed) Zitadel instance usage configuration file: testbed.tfvars
* Connect to local Zitadel instance using configuration file: local.tfvars

Example of connecting to a remote Zitadel instance
```ssh
 terraform init
 terraform plan -var-file=environments/testbed.tfvars -var-file=environments/environment.tfvars
 terraform apply -var-file=environments/testbed.tfvars -var-file=environments/environment.tfvars
```

> Note: Due a open bug in Zitadel-Terraform-Provider, we are not able to change branding icons. This must be done manually for now.


## Get Consumer Details

Get the 'client_id' and 'client_secert' of the applications created by the above scripts. This is needed for configuring the consuming applications. 
   * `client_id`s can be directly obtained from the below command
     
     ```ssh
      terraform output -json
     ```
   * `client_secret` is sensitive data and hence not logged in the Terraform output. It must be hence obtained from Zitadel UI using admin user. 
      * Log in to the Zitadel management interface, navigate to Applications under the project, 
       and enter the application_ API, click on the Actions button in the top-right corner, 
       and then Regenerate Client Secret

## Remove configuration

All added configuration can be removed using the below command.

```ssh
terraform destroy -var-file=environments/testbed.tfvars -var-file=environments/environment.tfvars
```

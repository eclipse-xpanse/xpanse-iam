This terraform script will create an organization called eclipse-xpanse for you. There is a project called
eclipse-xpanse under the organization. The three applications under the project are xpanse-api,xpanse-ui,and swagger-ui.
The three roles of the project are admin,csp,and user.

## Preparation before run

1. Install/Setup Zitadel instance
2. Terraform provider version 1.5.2 and above
3. Credential file local-token.json (located in the same directory as main.tf)
   * Log in to the Zitadel management interface and navigate to Users,Click on Service Users to get

## Run

* Connection to remote Zitadel instance usage configuration file: testbed.tfvars

* Connect to local Zitadel instance using configuration file: local.tfvars


Example of connecting to a remote Zitadel instance
1. terraform init
2. terraform plan -var-file=environments/testbed.tfvars -var-file=environments/environment.tfvars
3. terraform apply -var-file=environments/testbed.tfvars -var-file=environments/environment.tfvars
4. get the 'client_id' and 'client_secert' of the applications
   * get the client_id of the applications
      * terraform output -json
   * get the client_scert of the application_api
      * Log in to the Zitadel management interface, navigate to Applications under the project, 
       and enter the application_ API, click on the Actions button in the upper right corner, 
       and then Regenerate Client Secret
5. terraform destroy -var-file=environments/testbed.tfvars -var-file=environments/environment.tfvars
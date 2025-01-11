# Local Development Applications of Xpanse with Local Service of Zitadel

This document will describe how to use docker to build a local service of Zitadel.

Clone project [xpanse-iam](https://github.com/eclipse-xpanse/xpanse-iam.git) from remote to workspace in local machine.
Then enter the root path.

```shell
git clone https://github.com/eclipse-xpanse/xpanse-iam.git
cd xpanse-iam/zitadel/local
 ```

## Deploy Local Service of Zitadel

Before deploying the local service of Zitadel, please install and start the Docker and Docker Compose service in the
local machine. Then start the local service of Zitadel using the below command:

```shell
docker compose up -d --pull always
 ```

The below display appears to indicate that the service has started normally. 
This step can take around 2 minutes since the database container must sync the changes from 

```shell
 ✔ Network run_zitadel-dev  Created                                                                                                                                                                                                                                                                            0.4s 
 ✔ Container run-db-1       Healthy                                                                                                                                                                                                                                                                           10.1s 
 ✔ Container run-zitadel-1  Started  
```

Now you can open favorite internet browser and navigate to http://localhost:8088/ui/console. This is the default IAM
admin users login:

* username: zitadel-admin@zitadel.localhost
* password: Zitadel@123

Other application users can be found [here](../../terraform/environments/local.tfvars).




# Build Zitadel Dev Docker Images

To enhance the developer experience, we prepare the Zitadel development docker images with all necessary configurations.
The developer will have to simply start these application and database docker containers and
then the environment is ready to use without any additional configuration.

## Image Build Job

The GitHub action [build-dev-images](../../../.github/workflows/build-zitadel-dev-images.yml) builds the necessary
images
and uploads it to the GitHub packages and also uploads all configuration details to action artifacts.

> Images will always be simply built with 'latest' tag.

## Configure Client Systems

Whenever this job is executed, the images generated will contain new information for all clients.
Hence, it is necessary for the developer to also update the following files whenever a new image is created
and also inform the team that the latest images must be pulled.

- [xpanse UI auth config](https://github.com/eclipse-xpanse/xpanse-ui/blob/main/.env.zitadel-local)
- [xpanse app auth config](https://github.com/eclipse-xpanse/xpanse/blob/main/runtime/src/main/resources/application-zitadel.properties)

## Building Images Locally

If necessary to build the images locally, then the following steps must be followed.

```shell
docker build -t custom-pg-db:latest .
docker compose up -d
```

Wait for the server to be up and the service account key to be generated under `machinekey` folder.
Then copy the service account key to `terraform` folder and then apply changes.

> [!CAUTION]
> If there are any existing terraform state files in the folder, they must be removed before running.

```shell
cd ../../terraform
cp ../local/build/machinekey/zitadel-admin-sa.json .
terraform apply -var-file=environments/local.tfvars -auto-approve
```
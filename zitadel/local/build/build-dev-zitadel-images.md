# Build Zitadel Dev Docker Images

To enhance developer experience, we prepare the Zitadel development docker images with all necessary configurations. 
The developer will have to simply start these application and database docker containers and 
then the environment is ready to use without any additional configuration. 

## Image Build Job

The GitHub action [build-dev-images](../../../.github/workflows/build-zitadel-dev-images.yml) builds the necessary images 
and uploads it to the GitHub packages and also uploads all configuration details to action artifacts.

> Images will be always simply built with 'latest' tag. 

## Configure Client Systems

Whenever this job is executed, the images generated will contain new information for all clients. 
Hence, it is necessary for the developer to also update the following files whenever a new image is created 
and also inform team that the latest images must be pulled. 

- [xpanse UI auth config](https://github.com/eclipse-xpanse/xpanse-ui/blob/main/.env.zitadel-local)
- [xpanse app auth config](https://github.com/eclipse-xpanse/xpanse/blob/main/runtime/src/main/resources/application-zitadel.properties)
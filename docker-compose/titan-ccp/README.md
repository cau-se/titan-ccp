# Titan Control Center: Docker Compose Deployment

This directory contains Docker Compose configuration files for the Titan Control Center. Basic knowledge of Docker
Compose is required.

*Please not that while easy to install and run, Docker Compose is likely to give you a rough time when you have to
manage different configurations and perform custom adjustments. Thus, for more production-like deployments, we highly
recommend using the [Kubernetes deployment](/kubernetes).*

Our Docker Compose deployment uses [multiple compose files](https://docs.docker.com/compose/extends/#multiple-compose-files).
While all default configuration is defined in `docker-compose.yml`, deployment-dependend adjustments are defined in the
`docker-compose.<deployment>.yml` files. For just having a quick look into the Titan Control Center, we suggest to
start with `docker-compose.demo.yml`. An overview of the already provided deployment options is shown below.

## Start up

**To make life a little bit simpler, we suggest to rename your selected Docker Compose adjustment from
`docker-compose.<deployment>.yml` to `docker-compose.override.yml` or
[create a corresponding symlink](https://stackoverflow.com/a/1951752/4121056).**

To start up the entire Titan Control Center, execute `docker-compose up -d`. This will start up all the microservices along
with their corresponding databases etc. Depended on your selected deployment option, you may now be able to access the
frontend via your web browser or produce or consumer messages from Kafka. More information is provided below.

If you dont't want to rename your selected file or create the symlink, you can also replace all Docker Commands with
`docker-compose -f docker-compose.yml docker-compose.<deployment>.yml <command>`.

## Shutdown

Shutdown everything with `docker-compose down`.

## Provided Deployment Options

We provide the following deployment options. For custom deployments, the following options may also serve a as a basis.

### Titan Control Center Production

`docker-compose.prod.yml` deploys the Titan Control Center in its base configuration with access to the web-based user
interface via `http://localhost:80` and the central messaging system Kafka `http://localhost:19092`. Note that you
won't be able to see any visualizations in the user interface until you feed in some sensor data. See our
[documentation](/docs) for information on how to integrate sensors.

### Titan Control Center Show Case

`docker-compose.demo.yml` deploys a show case of the Titan Control Center with some simulated sensors. The web-based
user interface can be accessed via `http://localhost:80`. It may take a while until the user interface is showing
something. This deployment does not allow for any re-configuration in the user interface and does not allow to
integrate additional sensors.

### Titan Control Center Development

`docker-compose.dev.yml` can be used developing with the Titan Control Center. It exposes all ports of 3rd party
components such as databases, messaging system, etc at the host system. Run `docker-compose ps` to see the specific
ports. Depending on the component you are developing on, you may want to expose additional ports of the individual
microservices, disable services or include simulated data from the demo.

## Troubleshooting

**The Frontend can not be reached from the web browser or returns an error code:** Make sure that all containers are
running via `docker-compose ps`.

**Docker containers are exiting shortly after start:** Currently, this happens frequently on machines with limited
resources. Normally, it should simply be sufficient to restart the exited containers by running
`docker-compose up -d <failed-service-name>`, potentially multiple times. Afterwards, a restart of the frontend might
be required. To shorten this procedure: First make sure all external services (e.g. databases, Kafka etc.) are running,
then all microservices and finally start the frontend.

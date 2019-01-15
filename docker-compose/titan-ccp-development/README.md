# Docker Compose Development Environment

Kafka advertised host name has to be set appropriately via `KAFKA_ADVERTISED_HOST_NAME`.
On Linux it is likely that this is the IP address of your `docker0` network. For
more information see [wurstmeisters wiki](https://github.com/wurstmeister/kafka-docker/wiki/Connectivity).

Run everything with `docker-compose up -d`, shutdown everything with `docker-compose down`.
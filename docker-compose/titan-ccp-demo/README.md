# Docker Compose Demo

To run the demo execute `docker-compose up -d`. This will start up all the microservices along with their corresponding
databases etc. After everything is up and running, you can access the frontend via `http://localhost:8185`.

Shutdown everything with `docker-compose down`.

## Troubleshooting

**Docker containers are exiting shortly after start:** Currently, this happens frequently on machines with limited resources.
Normally, it should simply be sufficient to restart the exited containers by running `docker-compose up -d <failed-service-name>`,
potentially multiple times. To shorten this procedure: First make sure all external services (e.g. databases, Kafka etc.)
are running, then all microservices and finally start the frontend.

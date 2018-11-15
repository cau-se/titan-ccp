The start up procedure for the live demo is currently a bit hacky:

1. Update IP address for `KAFKA_ADVERTISED_HOST_NAME` in `docker-compose.yml`
2. Run `docker-compose up -d`
3. Wait a minute and run `docker-compose restart titan-ccp-aggregation`
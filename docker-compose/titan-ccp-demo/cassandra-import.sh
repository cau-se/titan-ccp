#!/bin/bash

# Import Cassandra schema
docker-compose exec -T cassandra cqlsh -e "$(cat schema.cql)"

# Import Cassandra data
cat activepowerrecord.csv | docker-compose exec -T cassandra cqlsh -k titanccp -e "COPY activepowerrecord FROM STDIN WITH INGESTRATE=50000;"
cat aggregatedactivepowerrecord.csv | docker-compose exec -T cassandra cqlsh -k titanccp -e "COPY aggregatedactivepowerrecord FROM STDIN WITH INGESTRATE=50000;"
cat dayofweekactivepowerrecord.csv | docker-compose exec -T cassandra cqlsh -k titanccp -e "COPY dayofweekactivepowerrecord FROM STDIN WITH INGESTRATE=50000;"
cat hourofdayactivepowerrecord.csv | docker-compose exec -T cassandra cqlsh -k titanccp -e "COPY hourofdayactivepowerrecord FROM STDIN WITH INGESTRATE=50000;"
cat hourofweekactivepowerrecord.csv | docker-compose exec -T cassandra cqlsh -k titanccp -e "COPY hourofweekactivepowerrecord FROM STDIN WITH INGESTRATE=50000;"
cat onedayaggregation.csv | docker-compose exec -T cassandra cqlsh -k titanccp -e "COPY onedayaggregation FROM STDIN WITH INGESTRATE=50000;"
cat onehouraggregation.csv | docker-compose exec -T cassandra cqlsh -k titanccp -e "COPY onehouraggregation FROM STDIN WITH INGESTRATE=50000;"
cat onehouraggregation.csv | docker-compose exec -T cassandra cqlsh -k titanccp -e "COPY oneminaggregation FROM STDIN WITH INGESTRATE=50000;"

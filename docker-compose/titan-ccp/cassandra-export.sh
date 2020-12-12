#!/bin/bash

# Export Cassandra schema
docker-compose exec cassandra cqlsh -e "DESC KEYSPACE titanccp" > schema.cql

# Export Cassandra tables
docker-compose exec cassandra cqlsh -k titanccp -e "COPY activepowerrecord TO STDOUT;" > activepowerrecord.csv
docker-compose exec cassandra cqlsh -k titanccp -e "COPY aggregatedactivepowerrecord TO STDOUT;" > aggregatedactivepowerrecord.csv
docker-compose exec cassandra cqlsh -k titanccp -e "COPY onedayaggregation TO STDOUT;" > onedayaggregation.csv
docker-compose exec cassandra cqlsh -k titanccp -e "COPY onehouraggregation TO STDOUT;" > onehouraggregation.csv
docker-compose exec cassandra cqlsh -k titanccp -e "COPY oneminaggregation TO STDOUT;" > oneminaggregation.csv
docker-compose exec cassandra cqlsh -k titanccp -e "COPY hourofdayactivepowerrecord TO STDOUT;" > hourofdayactivepowerrecord.csv
docker-compose exec cassandra cqlsh -k titanccp -e "COPY hourofweekactivepowerrecord TO STDOUT;" > hourofweekactivepowerrecord.csv
docker-compose exec cassandra cqlsh -k titanccp -e "COPY dayofweekactivepowerrecord TO STDOUT;" > dayofweekactivepowerrecord.csv

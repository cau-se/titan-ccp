#!/bin/bash

kubectl exec cassandra-0 -- cqlsh -k titanccp -e "COPY activepowerrecord TO STDOUT;" > ibak-records_$(date +%F_%R).csv
kubectl exec cassandra-0 -- cqlsh -k titanccp -e "COPY aggregatedactivepowerrecord TO STDOUT;" > ibak-aggr-records_$(date +%F_%R).csv
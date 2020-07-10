# Titan Control Center

This directory contains all configuration files to run the Titan Control Center in Kubernetes.

**Tested with**:

- Kubernetes Client Version: v1.18.1
- Kubernetes Server Version: v1.14.10-gke.36

The following components are required to start the Control Center.
First, Kafka and the databases should be started. Afterwards the respective microservices can be executed.

## A Kafka cluster

One possible way to set up a Kafka cluster is via [Confluent's Helm Charts](https://github.com/confluentinc/cp-helm-charts).
For using these Helm charts and conjuction with the Prometheus Operator (see
below), we provide a [patch](https://github.com/SoerenHenning/cp-helm-charts)
for these helm charts. Note that this patch is only required for observation and
not for the actual benchmark execution and evaluation.

### Our patched Confluent Helm Charts

To use our patched Confluent Helm Charts clone the
[chart's repsoitory](https://github.com/SoerenHenning/cp-helm-charts). We also
provide a [default configuration](infrastructure/kafka/values.yaml). If you do
not want to deploy 10 Kafka and 3 Zookeeper instances, alter the configuration
file accordingly. To install Confluent's Kafka and use the configuration:

```sh
helm install my-confluent <path-to-cp-helm-charts> -f kafka-values.yaml
```

#### Install Kafka-Client

```sh
kubectl apply -f <path-to-cp-helm-charts>/examples/kafka-client.yaml
```

You need to create all required topics:

```sh
kubectl exec kafka-client -- bash -c "kafka-topics --zookeeper my-confluent-cp-zookeeper:2181 --create --topic hourofweek --partitions 3 --replication-factor 1; kafka-topics --zookeeper my-confluent-cp-zookeeper:2181 --create --topic hourofday --partitions 3 --replication-factor 1; kafka-topics --zookeeper my-confluent-cp-zookeeper:2181 --create --topic dayofweek --partitions 3 --replication-factor 1; kafka-topics --zookeeper my-confluent-cp-zookeeper:2181 --create --topic aggregation-feedback --partitions 3 --replication-factor 1; kafka-topics --zookeeper my-confluent-cp-zookeeper:2181 --create --topic input --partitions 3 --replication-factor 1; kafka-topics --zookeeper my-confluent-cp-zookeeper:2181 --create --topic configuration --partitions 1 --replication-factor 1; kafka-topics --zookeeper my-confluent-cp-zookeeper:2181 --create --topic output --partitions 3 --replication-factor 1"
```

## MongoDB

One possible way to setup MongoDB is via [Bitnami Helm Chart](https://github.com/bitnami/charts/tree/master/bitnami/mongodb). For this Helm Chart wie provide a [Konfiguration File](mongo-db-values.yaml).

Add Repository:

```sh
helm repo add bitnami https://charts.bitnami.com/bitnami
```

Install MongoDB via Helm (please note: chart version is required):

```sh
helm  install mongo bitnami/mongodb -f mongo-db-values.yaml --version 7.8.10
```

## Cassandra

Create a Cassandra Database:

```sh
kubectl apply -f cassandra/
```

## The History Microservice

Create the History Mircoservice:

```sh
kubectl apply -f titan-ccp-history/
```

## The Sensor Management Microservice

Create the Sensor Management Mircoservice:

```sh
kubectl apply -f titan-ccp-sensor-management/
```

## The Stats Microservice

Create the Statistics Microservice:

```sh
kubectl apply -f titan-ccp-stats/
```

## The Aggregation Mircoservice

Create the Aggregation Service:

```sh
kubectl apply -f titan-ccp-aggregation
```

## The Titan Flow Raritan

Create the Raritan Flow:

```sh
kubectl apply -f titan-flow-raritan/
```

## The Raritan Simulator

```sh
kubectl apply -f titan-ccp-raritan-simulator/
```

## The Titan Control Center Frontend

Create the Frontend:

```sh
kubectl apply -f titan-ccp-frontend/
```

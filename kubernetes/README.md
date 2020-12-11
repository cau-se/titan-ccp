# Titan Control Center: Kubernetes Deployment

This directory contains all configuration files to deploy the Titan Control Center in Kubernetes.

## Installation of external dependencies

The Titan Control Center depends on some external software systems, which should be installed first in your cluster.

### The Kafka cluster

Kafka is used by the Titan Control Center by all microservices for their communication. Kafka (along with the required systems ZooKeeper and Schema Registry) can be installed via Helm and [Confluent's Helm Charts](https://github.com/confluentinc/cp-helm-charts). We provide a [default configuration](infrastructure/kafka/values.yaml).

To install Confluent's Kafka with our suggested configuration run:

```sh
helm repo add confluentinc https://confluentinc.github.io/cp-helm-charts/
helm repo update
helm install kafka confluentinc/cp-helm-charts -f kafka-values.yaml
```

Required Kafka topics are created with:

```sh
kubectl apply -f kafka-topic-creator.yaml
```

### MongoDB

The Sensor Management microservice required a MongoDB installation. It can be installed via Helm and the [Bitnami MongoDB Helm Chart](https://github.com/bitnami/charts/tree/master/bitnami/mongodb). We provide a [configuration file](mongo-db-values.yaml).

Add Bitnami repository and install MongoDB (please note: chart version is required):

```sh
helm repo add bitnami https://charts.bitnami.com/bitnami
helm install mongo bitnami/mongodb -f mongo-db-values.yaml --version 7.8.10
```

### Cassandra

Cassandra is used by the Stats and by the History microservice. Data stored in theses services is exclusive to the corresponding microservice. With these introductions, we only use installation for both services. However, both services could also use their own Cassandra installation.

Cassandra is installed with:

```sh
kubectl apply -f cassandra/
```


## Deployment of the Titan Control Center microservices

The microservices of the Titan Control Center including its visualization are deplyoed with:

```sh
kubectl apply -f titan-ccp-history/
kubectl apply -f titan-ccp-sensor-management/
kubectl apply -f titan-ccp-stats/
kubectl apply -f titan-ccp-aggregation
kubectl apply -f titan-ccp-frontend/
```


## Deployment of demo sensors

We provide a demo setup with a couple of simulated sensors. It can be deployed with:

```sh
kubectl apply -f titan-flow-raritan/
kubectl apply -f titan-ccp-raritan-simulator/
```

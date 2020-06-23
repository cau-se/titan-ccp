# Deployment

## Helm Charts

We used Helm Charts to deploy some required components:

### A Kafka cluster

One possible way to set up a Kafka cluster is via [Confluent's Helm Charts](https://github.com/confluentinc/cp-helm-charts).
For using these Helm charts and conjuction with the Prometheus Operator (see
below), we provide a [patch](https://github.com/SoerenHenning/cp-helm-charts)
for these helm charts. Note that this patch is only required for observation and
not for the actual benchmark execution and evaluation.

#### Our patched Confluent Helm Charts

To use our patched Confluent Helm Charts clone the
[chart's repsoitory](https://github.com/SoerenHenning/cp-helm-charts). We also
provide a [default configuration](infrastructure/kafka/values.yaml). If you do
not want to deploy 10 Kafka and 3 Zookeeper instances, alter the configuration
file accordingly. To install Confluent's Kafka and use the configuration:

```sh
helm install my-confluent <path-to-cp-helm-charts> -f kafka-values.yaml
```

### MongoDB

We use Helm to deploy MongoDB:

Add Repository:

```sh
helm repo add bitnami https://charts.bitnami.com/bitnami
```

Install the Chart:

```sh
helm  install mongo bitnami/mongodb -f mongo-db-values.yaml
```

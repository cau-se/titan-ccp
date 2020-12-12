
# Titan Control Center: Documentation

Welcome to the Titan Control Center Documentation!

This document provides installation and usage descriptions for users, developers and operators.

## General Project Description

As part of the [Titan research project on Industrial DevOps](https://www.industrial-devops.org/en), the Titan Control
Center emerged as a platform for industrial big data analytics. Building upon a scalable and extensible architecture,
the Titan Control Center analyzes and visualizes data streams from Internet of Things sensors in industrial production.
Supported types of analytics include aggregations, correlation, forecasting, and anomaly detection. The Titan Control
Center integrates seamless with the [Titan Flow Engine](https://www.industrial-devops.org/en) and, thus, supports
Industrial DevOps adoption.

## Architecture Overview

The Titan Control Center is implemented as an event-driven microservice architecture. The microservices communicate
with each other in a publish-subscribe fashion and most of them employ techniques from big data stream processing. For
communication among services, Apache Kafka is used. More details on the architecture can found in our publications:

* [A scalable architecture for power consumption monitoring in industrial production environments](https://arxiv.org/pdf/1907.01046.pdf).
* [Goals and Measures for Analyzing Power Consumption Data in Manufacturing Enterprises](https://arxiv.org/pdf/2009.10369.pdf)

## Installation and Deployment

Before deploying the Titan Control Center, simply clone this repository or download one of our
[releases](https://github.com/cau-se/titan-ccp/releases). We provide deployment declarations for Docker Compose and
Kubernetes. While Docker Compose is a good fit having a quick look into the software, we highly recommend using
Kubernetes for more serious deployments. Instructions for both options are located next to their corresponding
declarations:

* [Deploying the Titan Control Center with Docker Compose](../docker-compose/titan-ccp)
* [Deploying the Titan Control Center with Kubernetes](../kubernetes)

## Integrating Sensors

After deploying the Titan Control Center, the next step you probably want to take is integrating your sensors, such
that you analyze or visualize them.

The easiest way to integrate sensor data is using the [Titan Flow Engine](https://www.industrial-devops.org/en). It is
a low-code platform, which allows domain experts to model industrial data flows in a graphical modeling language. The
Titan Flow Engine provides read-to-use *bricks* (data processing components) for transferring data packets to the Titan
Control Center. Likewise, it provides components for reading analytics results from the Control Center and further
process them with the Flow Engine.

In addition, data can also be integrated directly via Kafka. In this case, you have to use [Confluent Schema Registry](https://docs.confluent.io/platform/current/schema-registry/index.html)
along with Kafka and use the [Avro schema located in our commons project](https://github.com/cau-se/titan-ccp-common/blob/master/src-gen/main/avro/titan/ccp/model/records/ActivePowerRecord.avsc).

## Usage

There a basically two ways of interacting with the Titan Control Center:

### Using the web-based visualization

The Titan Control Center comes with a single-page application visualizing analytics results and allowing for detailed
inspection of sensor data. It is structured in four subpages, which can be accessed via the left-hand side panel. 

* The **Dashboard** page provides an information dashboard, containing several visual components, which show, among
others, seasonal (e.g., daily or weekly) pattern, histograms, and the composition of aggregated data.

* The **Sensor Details** page is similar to the dashboard, but provides information at sensor-level or for groups of
sensors.

* The **Comparison** page provides a graphical tool for correlating time series data of multiple data sources. Time
series can be arranged in multiple plots with synchronized time domains and allow analyzing certain points in time in
detail.

* The **Sensor Management** page allows to arrange sensors into groups and groups of groups via drag-and-drop. Note
that for accessing sensor from the Dashboard or Sensor Details page, it first to be added to a group.

More details can be found in the [Titan Control Center frontend repository](https://github.com/cau-se/titan-ccp-frontend).
A public show case is provided at http://samoa.se.informatik.uni-kiel.de:8185.


### Consuming messages for further processing

The Titan Control Center can also be used as a platform for custom industrial big data analytics tasks. This can be
done by implementing you own microservice, which subscribes to the data streams of other microservices, and deploying
it along with the rest of the Titan Control Center.

Imagine, for example, you designed a novel approach for forecasting electrical power consumption. To evaluate it with
continuous sensor data, you would only have to package your software in a Docker container and you would automatically
be able to also apply it to streams of aggregated data. Also, you would not have to care about data integration or
other parts of the system as the Titan Control Center would handle that for you.

## Development

Development instructions for individual microservices can be found in their corresponding repositories. For
interacting with other microservices and depended systems during development, we suggest using the
[Docker Compose](../docker-compose) files.

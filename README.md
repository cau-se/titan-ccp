# Titan Control Center

The [Titan Control Center](https://ieeexplore.ieee.org/abstract/document/8822045)
is a scalable and extensible analytics platform for [Industrial DevOps](https://industrial-devops.org/en).
It analyzes and visualizes data streams from Internet of Things (IIoT) sensors
(e.g. electrical power consumption) in industrial production.

This repository contains necessary infrastructure for deploying the Titan Control Center with
[Docker Compose](docker-compose/titan-ccp) or in a [cloud environment operated by Kubernetes](kubernetes).

The Titan Control Center is designed in a microservice-based architecture augmented by big data
and stream processing techniques. The individual software components of the Titan Control Center are located in separate Git repositories:

* **[History](https://github.com/cau-se/titan-ccp-history)** The *History* microservice
* **[Aggregation](https://github.com/cau-se/titan-ccp-aggregation)** The *Aggregation* microservice
* **[Statistics](https://github.com/cau-se/titan-ccp-stats)** The *Statistics* microservice
* **[Sensor Management](https://github.com/cau-se/titan-ccp-sensor-management)** The *Sensor Management* microservice
* **[Visualization](https://github.com/cau-se/titan-ccp-frontend)** Web-based *Visualization* and the corresponding API gateway
* **[Common](https://github.com/cau-se/titan-ccp-common)** Library code and record definitions to be used by all microservices
* **[Titan Platform](https://doc.industrial-devops.org/titanPlatform/)** The *Titan Platform*, which is used for data stream aggregation and further interpretation

## Getting Started

Before deploying the Titan Control Center, simply clone this repository or download one of our
[releases](https://github.com/cau-se/titan-ccp/releases). We provide deployment declarations for Docker Compose and
Kubernetes. While Docker Compose is a good fit having a quick look into the software, we highly recommend using
Kubernetes for more serious deployments. Instructions for both options can be found in their corresponding directories:

* [Deploying the Titan Control Center with Docker Compose](docker-compose/titan-ccp)
* [Deploying the Titan Control Center with Kubernetes](kubernetes)

## Documentation

The documentation of the Titan Control Center can be found in the [docs](docs) folder. It includes generel usage
instructions for users, developers and operators.

## Reference

Please cite the Titan Control Center as follows:

> S. Henning, W. Hasselbring, *The Titan Control Center for Industrial DevOps analytics research*, Software Impacts 7 (2021), DOI: [10.1016/j.simpa.2020.100050](https://doi.org/10.1016/j.simpa.2020.100050).

BibTeX:

```bibtex
@article{Henning2021,
    title = {The Titan Control Center for Industrial DevOps analytics research},
    journal = {Software Impacts},
    volume = {7},
    pages = {100050},
    year = {2021},
    doi = {10.1016/j.simpa.2020.100050},
    author = {Sören Henning and Wilhelm Hasselbring},
}
```

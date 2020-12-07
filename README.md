# Titan Control Center

The [Titan Control Center](https://ieeexplore.ieee.org/abstract/document/8822045)
is a scalable and extensible analytics platform for [Industrial DevOps](https://industrial-devops.org/).
It analyzes and visualizes data streams from Internet of Things (IIoT) sensors
(e.g. electrical power consumption) in industrial production.

The Titan Control Center is designed in a microservice-based architecture augmented by big data
and stream processing techniques. This repository contains necessary infrastructure to deploy the
Titan Control Center. It's individual components are located in separate Git repositories:

* **[History](https://github.com/cau-se/titan-ccp-history)** The *History* microservice
* **[Aggregation](https://github.com/cau-se/titan-ccp-aggregation)** The *Aggregation* microservice
* **[Statistics](https://github.com/cau-se/titan-ccp-stats)** The *Statistics* microservice
* **[Sensor Management](https://github.com/cau-se/titan-ccp-sensor-management)** The *Sensor Management* microservice
* **[Visualization](https://github.com/cau-se/titan-ccp-frontend)** Web-based *Visualization* and the corresponding backend
* **[Common](https://github.com/cau-se/titan-ccp-common)** Library code and record definitions to be used by all microservices
* **[Titan Platform](https://doc.industrial-devops.org/titanPlatform/)** The *Titan Platform*, which is used for data stream aggregation and further interpretation

## Titan Control Center - Deployment

This repository contains declarations for deploying the Titan Control Center with [Docker Compose](docker-compose)
or in a [cloud environment operated by Kubernetes](kubernetes).

## Reference

Please cite the Titan Control Center as follows:

S. Henning, W. Hasselbring and A. Möbius, *A Scalable Architecture for Power Consumption Monitoring in Industrial Production Environments*, 2019 IEEE International Conference on Fog Computing (ICFC), Prague, Czech Republic, 2019, pp. 124-133.
DOI: [10.1109/ICFC.2019.00024](https://doi.org/10.1109/ICFC.2019.00024).

BibTeX:

````bibtex
@inproceedings{Hasselbring2019,
    author={Wilhelm Hasselbring and S{\"o}ren Henning and Armin M{\"o}bius},
    booktitle={2019 IEEE International Conference on Fog Computing (ICFC)},
    title={A Scalable Architecture for Power Consumption Monitoring in Industrial Production Environments},
    year={2019},
    pages={124-133},
    doi={10.1109/ICFC.2019.00024}, 
    month={June}
}
````

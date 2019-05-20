
# Titan CCP

The Titan Control Center Prototype (CCP) is a
scalable monitoring infrastructure for [Industrial DevOps](https://industrial-devops.org/).
It allows to monitor, analyze and visualize the electrical power consumption of
devices and machines in industrial production environments such as factories.

The Titan CCP is designed in a microservice-based architecture augmented by big data
and stream processing techniques. The individual software components are located in separate
Git repositories:

* **[History](https://github.com/cau-se/titan-ccp-history)** The *History* microservice
* **[Record Bridge](https://github.com/cau-se/titan-ccp-record-bridge)** The *Record Bridge* framework, microservices and related projects
* **[Configuration](https://github.com/cau-se/titan-ccp-configuration)** The *Configuration* microservice
* **[Statistics](https://github.com/cau-se/titan-ccp-stats)** The *Statistics* microservice
* **[Visualization](https://github.com/cau-se/titan-ccp-frontend)** Web-based *Visualization* and the corresponding backend
* **[Common](https://github.com/cau-se/titan-ccp-common)** Library code and record definitions to be used by all microservices

# Titan CCP - Deployment

This repository contains declarations for deploying the Titan CCP on a Kubernetes
cluster or with Docker Compose.

# Reference

Please cite the Industrial DevOps approach, the Titan Project and Titan Control Center as follows:

W. Hasselbring et al., Industrial DevOps 2019 IEEE International Conference on Software Architecture Companion (ICSA-C), Hamburg, Germany, 2019, pp. 123-126.
DOI: [10.1109/ICSA-C.2019.00029](https://doi.org/10.1109/ICSA-C.2019.00029).

BibTeX:

````bibtex
@inproceedings{Hasselbring2019,
    author={Wilhelm Hasselbring and S{\"o}ren Henning and Bj{\"o}rn  Latte and Armin M{\"o}bius and Thomas Richter and Stefan Schalk and Maik Wojcieszak},
    booktitle={2019 IEEE International Conference on Software Architecture Companion (ICSA-C)},
    title={Industrial DevOps},
    year={2019},
    pages={123-126},
    doi={10.1109/ICSA-C.2019.00029}, 
    month={March}
}
````
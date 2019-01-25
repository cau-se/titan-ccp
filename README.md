
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
* **[Visualization](https://github.com/cau-se/titan-ccp-frontend)** Web-based *Visualization* and the corresponding backend
* **[Common](https://github.com/cau-se/titan-ccp-common)** Library code and record definitions to be used by all microservices

# Titan CCP - Deployment

This repository contains declarations for deploying the Titan CCP on a Kubernetes
cluster or with Docker Compose.
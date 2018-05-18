## Set up on Minikube

The following gives an example on how to start a one-node Kafka **cluster** in Minikube.

First of all, ensure `kubectl` and `minikube` are installed and minikube is started.

````
kubectl apply -f ./configure/minikube-storageclass-broker.yml
kubectl apply -f ./configure/minikube-storageclass-zookeeper.yml
kubectl apply -f ./rbac-namespace-default
kubectl apply -f ./zookeeper
kubectl apply -f ./kafka
kubectl apply -f ./outside-services
minikube service -n kafka outside-0
````

Now a new browser tab should open on something like `192.168.178.145:32400`. (This is no HTTP so an error will be displayed.)
This ip:port pair can now be used to access Kafka.
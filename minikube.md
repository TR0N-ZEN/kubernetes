
```
minikube profile list
|----------|------------|---------|----------------|------|---------|---------|-------|--------|
| Profile  | VM Driver  | Runtime |       IP       | Port | Version | Status  | Nodes | Active |
|----------|------------|---------|----------------|------|---------|---------|-------|--------|
| minibox  | virtualbox | crio    | 192.168.59.101 | 8443 | v1.25.3 | Running |     3 |        |
| minikube | virtualbox | docker  | 192.168.59.100 | 8443 | v1.25.3 | Running |     1 | *      |
|----------|------------|---------|----------------|------|---------|---------|-------|--------|

# The active marker indicates the target cluster profile of the minikube command line tool,  
# also known as its context. The target cluster can be set to minibox with the following command:
  minikube profile minibox

# The target cluster can be set to the default minikube with one of the following commands:
  minikube profile minikube
  minikube profile default


  minikube addons list
  minikube addons enable metrics-server
  minikube addons enable dashboard
  minikube addons list
  minikube dashboard
  minikube dashboard --url

# forward api server to localhost:8001
  kubectl proxy

  curl http://localhost:8001/

# for more run
  minikube --help

  minikube start [-p minibox]
  minikube node list [-p minibox]
  minikube [-p minibox] ip [-n <NODENAME>]
  minikube stop [-p minibox]
  minikube delete [-p minibox]

```

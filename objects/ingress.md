An ingress describes routing roules which are executed by an ingress controller.  

An Ingress Controller is also known as Controllers, Ingress Proxy, Service Proxy, Reverse Proxy, etc.

In order to ensure that the ingress controller is watching its corresponding ingress resource,  
the ingress resource definition manifest needs to include an ingress class name, such  
as spec.ingressClassName: nginx and optionally one or several annotations specific to  
the desired controller, such as  
nginx.ingress.kubernetes.io/service-upstream: "true" (for an nginx ingress controller)

enable ingress controller addon in minikube `minikube addons enable ingress`

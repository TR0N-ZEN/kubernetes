```
# assume you have a deployment named "frontend"
# with the pod having its "containerPort" set to "5000"
# the following command creates a service in style

kubectl create service clusterip frontend \
  --tcp=80:5000 --dry-run=client -o yaml \
| sed 's/name: frontend/name: frontend-svc/g' \
| kubectl apply -f -


# next two lines list the service and associated endpoints of
# the service named "frontend-svc"

kubectl get service,endpoints frontend-svc
kubectl get svc,ep frontend-svc
```

traffic policies https://kubernetes.io/docs/reference/networking/virtual-ips/#traffic-policies

service discovery: if an active service with name "x" exists, the following environment variables  
  are created on starting pods on the same node, if the services already exists at that time:  

environment variables:
  + X_SERVICE_HOST=<ipv4-address>
  + X_SERVICE_PORT=<portnumber>
  + X_PORT=tcp://<ipv4-address>:<portnumber>
  + X_PORT_<portnumber>_TCP_PROTO=tcp
  + X_PORT_<portnumber>_TCP_PORT=<portnumber>
  + X_PORT_<portnumber>_TCP_ADDR=<portnumber>

dns:
each service creation causes a dns record for most dns addons which has the format
`<servicename>.<namespacename>.svc.cluster.local`,  
services in the same namespace can find each other just by their `<servicename>`
services from other namespaces will find it via `<servicename>.<namespace>` or the fully qualified
domain name (fqdn)


types:

+ ClusterIP: gets ip used inside the cluster
+ NodePort: a high port (30000-32767) is randomly or explicitly assigned  
            connecting to any worker node on the mentioned port the traffic gets redirected  
            to the mapped to pod on one of the nodes that is currently assigned to
+ LoadBalancer: NodePort and ClusterIP are automtically created and an external loadbalacer will  
                route them  
                service exposed on a static port on each worker node  
+ ExteralIP: traffic ingressed into the cluster with the ExternalIP (as destination IP) on the  
             service port, gets routed to one of the services enpoints
             cluster administrator has to configure the routing which maps the ExternalIP address to one of the nodes
+ ExternalName: returns CNAME record of an externally (outside the cluster) configured service



you can forward ports of pods, services and pods of a deployment e.g. via:  

+ `kubectl port-forward deploy/frontend 8080:5000`
+ `kubectl port-forward frontend-77cbdf6f79-qsdts 8080:5000`
+ `kubectl port-forward svc/frontend-svc 8080:80`
+ `kubectl port-forward <object> <external-port>:<internal-port>`

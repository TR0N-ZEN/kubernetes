for kubernetes objects in detail read https://kubernetes.io/docs/concepts/

**namespace**s isolate/partition kubernetes entities into parts  
  which are from a kubernetes view to be managed seperately  
  which does not mean pods in different namespaces can't communicate but  
  e.g. that they are not using the same *config map*s, *secret*s though  
`kubectl get namespace` lists all namespaces  
`kubectl create namespace konoha_ns` creates a namespace  

**configmap**s of a namespace can point to an address in another  
namespace thus contacting *service*s in other namespaces.  
Access and resource limitation works via namespaces.  

**volume**s and *node*s are not namespaced.  

**ingress**es map uris (domain name + protocol + port + path; spec.-host.*protocol*.paths.-backend, where *protocol* is the used protocol for the connection between the ingress and the service)  
to services (by the services name and port)
`kubectl get ingress`
`kubectl describe ingress xxxx`

for something that comes close to the hints of a language server  
https://kubernetes.io/docs/reference/generated/kubernetes-api/v1.30/#container-v1-core


```asciiart



       ┌────────────────────────────┐
       │        ingress             │
       ├────────────────────────────┤
       │metadata                    │
       │  name                      │
       │spec                        │
       │  rules                     │
       │   - host                   │
       │     protocol               │
       │        paths               │
       │        - my_subdir         │
       │            serviceName ────┼──┐
       │            servicePort ────┼┐ │
       └────────────────────────────┘│ │
                                   ┌─┘ ▼
                                   │ ┌─────────────────┐
                                   │ │    service      │
                                   │ │─────────────────│
                                   │ │spec             │
       ┌─────────────────────┐     │ │  ports          │
       │     deployment      │     │ │    - protocol   │
       ├─────────────────────┤     └►│      port       │
       │metadata             │       │      targetPort─┼───────────────────────────────┐
       │  labels─────────────┼───────┼─►selector       │                               │
       │  name               │       └─────────────────┘                               │
       │  namespace          │                                                         │
       │spec                 │           sets number of      ┌──────────┐              │
       │  replicas───────────┼──────────────────────────────►│replicaset│              │
       │  template───────────┼───────────────────────┐       └─────┬────┘              │
       └─┬────────────────┬──┘                       │             │ has one or more   │
         │                │                          │             │                   │
         │references      │references                │             ▼                   │
         │                │                          │ describes ┌───┐                 │
         ▼                ▼                          └──────────►│pod│◄────────────────┘
   ┌──────────┐       ┌─────────────┐                            └─┬─┘
   │  secret  │       │  configmap  │                              │
   ├──────────┤       ├─────────────┤                              │ has one or more
   │metadata  │       │metadata     │                              │
   │name      │       │  name       │                              ▼
   │data      │       │  namespace  │                          ┌─────────┐
   └──────────┘       └─────────────┘                          │container│
                                                               └─────────┘

```

---

for a test environment on one machine I use [minikube](https://minikube.sigs.k8s.io/docs/start/?arch=%2Flinux%2Fx86-64%2Fstable%2Fbinary+download)

getting kubernetes on my servers I would use [kubeadm](https://kubernetes.io/docs/setup/production-environment/tools/kubeadm/install-kubeadm/)

---

command cache:


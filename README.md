for kubernetes objects in detail read

+ https://trainingportal.linuxfoundation.org/learn/course/introduction-to-kubernetes
+ https://kubernetes.io/docs/concepts/



## objects

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

for something that comes close to the hints of a language server  
https://kubernetes.io/docs/reference/generated/kubernetes-api/v1.30/#container-v1-core

```asciiart

                 pod                   service                     secret
                  ▲
                  │
                  │has one or more                                 configmap
                  │
              replicaset
                  ▲                                                volume
                  │
                  │has
                  │
               deployment                             daemonset

```



## components

```asciiart
# text listed in a box is a listing of so called "node agents"
     ┌─────────────┐
     │control plane│
     ├─────────────┴────────────────────────────┐
     │    ┌────┐                                │
     │    │node│                                │
     │    ├────┴───────────────────────────┐    │
     │    │   api-server ◄─────────────────┼────┼───────┐
     │    │   controller-manager           │    │       │
     │    │   scheduler                    │    │       │
     │    │   etcd                         │    │       │
     │    │   kubelet                      │    │       │
     │    │   kubeproxy                    │    │       │
     │    │   container runtime            │    │       │
     │    │   addons                       │    │       │
     │    └────────────────────────────────┘    │       │
     └──────────────────────────────────────────┘       │
                                                        │
                           ┌────┐                       │
                           │node│                       │
                           ├────┴────────────────────┐  │
                           │   kubelet───────────────┼──┤
                           │   kubeproxy─────────────┼──┘
                           │   container runtime     │
                           │   addons                │
                           └─────────────────────────┘
```


---

for a test environment on one machine I use [minikube](https://minikube.sigs.k8s.io/docs/start/?arch=%2Flinux%2Fx86-64%2Fstable%2Fbinary+download)

getting kubernetes on my servers I would use [kubeadm](https://kubernetes.io/docs/setup/production-environment/tools/kubeadm/install-kubeadm/)

---

command cache:


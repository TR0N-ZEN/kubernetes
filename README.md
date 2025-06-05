To create a cluster you can skim and decide on these websites

+ https://kubernetes.io/docs/tasks/tools/
+ https://kubernetes.io/docs/setup/production-environment/tools/
+ https://docs.k3s.io/

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

To interact with a cluster type `kubectl --help` in your shell
or https://kubernetes.io/docs/reference/kubectl/ in your browser
read and experiment with what you think you understood.


Kubernetes self-disclosure about kubernetes concepts
https://kubernetes.io/docs/concepts/. To learn more about a specific thing such
as a *pod* you can visit
  https://kubernetes.io/docs/reference/generated/kubernetes-api/v1.30/#pod-v1-core
or type
  `kubectl explain pod` into your shell if you have `kubectl` installed
(and a connection to a cluster).
You can use the command
  `kubectl explain deployment.spec`
to get explainations of what the attribute *spec* in a
deployment is for.
The command can be used in the manner
  `kubectl explain OBJECT[.ATTRIBUTE]*`
to get explainations, where the part `[.ATTRIBUTE]*`
means, that nested attributes can be queried for explainations like
  `kubectl explain deployment.spec.template`.


A drawn, abstract example of how the concepts materialize if you deploy a webserver like apache via
a kubernetes deployment.

```asciiart
                                     ┌─────────────────┐
                                     │    service      │
                                     │─────────────────│
                                     │spec             │
                                     │  ports          │
                                     │    - protocol   │
       ┌─────────────────────┐       │      port       │
       │     deployment      │       │      targetPort─┼───────────────────────────────┐                ┌────────────────┐
       ├─────────────────────┤       │      nodePort   │◄──────────────────────────────┼────────────────┤client (browser)│
       │metadata             │   ┌───┼─►selector       │                               │                └────────────────┘
       │  labels─────────────┼───┘   └─────────────────┘                               │
       │  name               │                                                         │
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

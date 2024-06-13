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

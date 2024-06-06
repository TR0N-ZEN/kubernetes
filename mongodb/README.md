```asciiart
 ┌─────────────────────┐   ┌────────────────────────────┐  ┌──────────────────────┐
 │    gatewayClass     │   │         gateway            │  │      HTTPRoute       │
 ├─────────────────────┤   ├────────────────────────────┤  ├──────────────────────┤
 │metadata             │   │metadata                    │  │  metadata            │
 │  name               ├┐  │  name:◄────────────────────┼─┐│    name              │
 │spec                 ││  │spec                        │ ││  spec                │
 │  controllerName:    │└──┼─►gatewayClassName:         │ ││    parentRefs        │
 └─────────────────────┘   │  listeners:                │ └┼────- name:           │
                           │  - name                    │  │    hostnames:        │
                           │    protocol                │  │    - ...             │
                           │    port                    │  │    rules:            │
                           │  ...                       │  │    - ...             │
                           └────────────────────────────┘  │    backendRefs:      │
                                     ┌─────────────────┐   │      -name: ───┐     │
                                     │    service      │◄─┐│       port: ─┐ │     │
                                     │─────────────────│  │└──────────────┼─┼─────┘
                                     │spec             │  └───────────────┼─┘
       ┌─────────────────────┐       │  ports          │                  │
       │     deployment      │       │    - protocol   │                  │
       ├─────────────────────┤       │      port◄──────┼──────────────────┘
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

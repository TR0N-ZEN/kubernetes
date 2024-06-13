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

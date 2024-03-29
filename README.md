```mermaid
graph LR
  subgraph namespace
    direction TB

    subgraph cm["configmap"]
      direction TB
      cm_metadata["metadata"] --> name
      cm_metadata             --> cm_namespace[namespace]
    end
  
    subgraph ser["service"]
      ser_spec[spec] --> selector
      ser_spec[spec] --> ports
    end
    ports -->|"protocol,port-->targetPort"| p
  
    subgraph sec["secret"]
      sec_metadata[metadata]
      sec_name[name]
      sec_data[data]
    end
    d -->|references| sec

    subgraph d["deployment"]
    direction TB
     d_m[metadata]
        d_m --> d_namespace[namespace]
        d_m --> d_name[name]
        d_m --> labels
        d_spec[spec]
        d_spec --> template
        d_spec --> replicas
    end
    template -->|is bluebrpint data for| p
    labels ---|matching| selector
    replicas
      -->|sets number of| r[replicaset]
        -->|has one or more| p[pod]
          -->|has one or more| c[container]
    d -->|references| cm

  end
``` 

**namespace**s isolate/partition kubernetes entities into parts which are from a kubernetes view to be managed seperately  
which does not mean pods in different namespaces can't communicate but   
e.g. that they are not using the same *config map*s, *secret*s though  
*configmap*s of a namespace can point to an address in another namespace thus contacting *service*s in other namespaces.  
Access and resource limitation works via namespaces.  
*Volume*s and *node*s are not namespaced.  
`kubectl get namespace` lists all namespaces  
`kubectl create namespace konoha_ns` or a section in *config map*s create namespaces. 




---

command cache:

>kubectl apply \
>   -f ./service.yaml \
>   -f ./secret.yaml \
>   -f ./deployment.yaml \
>   -f ./configmap.yaml \
>   -f ./mongo-express/service.yaml \
>   -f ./mongo-express/deployment.yaml

>clear; kubectl get all

>kubectl delete deployment mongodb-d mongodb-express-d; \
>kubectl delete configmap mongodb-c; \
>kubectl delete service mongodb-s mongodb-express-s; \
>kubectl delete secret mongodb-sec;

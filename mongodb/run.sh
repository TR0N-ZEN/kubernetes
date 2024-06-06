minikube stop
minikube delete
minikube start
kubectl apply -f https://github.com/kubernetes-sigs/gateway-api/releases/download/v1.1.0/standard-install.yaml
kubectl apply -f ./configmap.yaml -f ./secret.yaml
kubectl apply -f ./service.yaml 
kubectl apply -f ./deployment.yaml 
kubectl apply -f ./mongo-express/service.yaml
kubectl apply -f ./mongo-express/deployment.yaml
kubectl apply -f ./mongo-express/gatewayClass.yaml
kubectl apply -f ./mongo-express/gateway.yaml
kubectl apply -f ./mongo-express/HTTPRoute.yaml

echo 'Close the following plane after all services and deployments are ready.'
case $SHELL in
  '/bin/bash')
    read -n1 -r -s
    ;;
  '/bin/zsh')
    read -k1 -rs
    ;;
  *)
    sleep 8
    ;;
esac

watch --color -d 'kubectl get all; echo ""; kubectl get gateway & echo'

echo 'the standard credentials for the login in the webinterface\n
     according to https://github.com/mongo-express/mongo-express\n
     admin pass'

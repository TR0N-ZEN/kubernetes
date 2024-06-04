minikube stop
minikube delete
minikube start
kubectl apply -f ./configmap.yaml -f ./secret.yaml
kubectl apply -f ./service.yaml 
kubectl apply -f ./deployment.yaml 
kubectl apply -f ./mongo-express/service.yaml
kubectl apply -f ./mongo-express/deployment.yaml

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

watch --color -d kubectl get all

echo 'the standard credentials for the login in the webinterface\n
     according to https://github.com/mongo-express/mongo-express\n
     admin pass'
minikube service mongodb-express-s

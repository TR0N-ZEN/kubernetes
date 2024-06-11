minikube delete
minikube start
kubectl apply -f ./configmap.yaml -f ./secret.yaml
kubectl apply -f ./service.yaml 
kubectl apply -f ./deployment.yaml 
kubectl apply -f ./mongo-express/service.yaml
kubectl apply -f ./mongo-express/deployment.yaml

# deploy an ingress controller
#   the manual way, I do not want to do this
# kubectl apply -f ./mongo-express/ingressClass.yaml
#   the more automatic way
# kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/controller-v1.10.1/deploy/static/provider/baremetal/deploy.yaml
#   the minikube automatic way
minikube addons enable ingress

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

kubectl apply -f ./mongo-express/ingress.yaml



watch --color -d 'kubectl get all; echo ""; kubectl get ingress; echo ""; kubectl get ingressClass'

echo 'the standard credentials for the login in the webinterface\n
     according to https://github.com/mongo-express/mongo-express\n
     admin pass'

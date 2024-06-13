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

watch --color -d '\
  echo "Close the following plane after all services and deployments are ready."; \
  kubectl get all; echo ""; \
  kubectl get ingressClass;'


kubectl apply -f ./mongo-express/ingress.yaml
watch --color -d '\
  echo "Close the plane after all admission pods finished and the controller is running."; \
  kubectl get pods --namespace ingress-nginx'

echo "if the following command returns: 'Unauthorized', everything should be working"
curl --resolve "a.b:80:`minikube ip`" http://a.b/

echo "\n
     add the line \n
        `minikube ip` a.b\n
     to the file /etc/hosts !!!\n
     \n
     execute `xdg-open a.b` which will open your browser and use\n
     the standard credentials for the login in the webinterface\n
     according to https://github.com/mongo-express/mongo-express\n
     admin pass"



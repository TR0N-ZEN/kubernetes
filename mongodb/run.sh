minikube stop
minikube delete
minikube start
kubectl apply -f ./configmap.yaml -f ./secret.yaml
kubectl apply -f ./service.yaml 
kubectl apply -f ./deployment.yaml 
kubectl apply -f ./mongo-express/service.yaml
kubectl apply -f ./mongo-express/deployment.yaml

sleep 5

minikube service mongodb-express-s
watch kubectl get all

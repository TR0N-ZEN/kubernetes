minikube stop
minikube delete
minikube start

# don't know if this is necessary
# kubectl apply -f https://github.com/kubernetes-sigs/gateway-api/releases/download/v1.1.0/standard-install.yaml

# can probably deleted because of next paragraph
# kubectl apply -f https://raw.githubusercontent.com/projectcontour/contour/main/examples/gateway/00-crds.yaml
# kubectl apply -f https://projectcontour.io/quickstart/contour.yaml

# read https://projectcontour.io/docs/main/guides/gateway-api/
kubectl apply -f https://projectcontour.io/quickstart/contour-gateway-provisioner.yaml

kubectl apply -f ./configmap.yaml -f ./secret.yaml
kubectl apply -f ./service.yaml 
kubectl apply -f ./deployment.yaml 
kubectl apply -f ./mongo-express/service.yaml
kubectl apply -f ./mongo-express/deployment.yaml

watch --color -d 'kubectl get all; echo;
echo "Close the following plane after all services and deployments are ready."'

kubectl apply -f ./mongo-express/gatewayClass.yaml

watch --color -d 'kubectl get gatewayClass & echo;
echo "Close the following plane after the gateway ready."'

kubectl apply -f ./mongo-express/gateway.yaml

watch --color -d 'kubectl get gateway & echo;
echo "Close the following plane after the gateway is ready."'

kubectl apply -f ./mongo-express/HTTPRoute.yaml

watch --color -d 'kubectl get httproute & echo;
echo "Close the following plane after the httproute is ready."'

kubectl -n projectcontour port-forward service/envoy-contour 8888:80

curl -i http://a.b:8888

echo 'the standard credentials for the login in the webinterface
at a.b:8888/ in a browser
according to https://github.com/mongo-express/mongo-express
admin pass'

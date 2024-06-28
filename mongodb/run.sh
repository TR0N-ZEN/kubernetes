kubectl apply \
  -f ./configmap.yaml \
  -f ./secret.yaml \
  -f ./service.yaml \
  -f ./deployment.yaml \
  -f ./mongo-express/deployment.yaml
kubectl apply -f ./configmap.yaml -f ./secret.yaml
kubectl apply -f ./service.yaml 
kubectl apply -f ./deployment.yaml 
kubectl apply -f ./mongo-express/service.yaml
kubectl apply -f ./mongo-express/deployment.yaml

watch --color -d 'kubectl get pods; kubectl get services;'

if [ $1 -eq 'ingress' ]; then
  kubectl apply \
    -f ./mongo-express/service.yaml \
    -f ./mongo-express/ingress.yaml
  watch --color -d 'kubectl get service; kubectl get ingress;'
fi
if [ $1 -eq 'nodePort.service' ]; then
  kubectl apply \
    -f ./mongo-express/nodePort.service.yaml
  watch --color -d 'kubectl get service;'
fi
if [ $1 -eq 'gateway' ]; then
  # don't know if this is necessary
  # kubectl apply -f https://github.com/kubernetes-sigs/gateway-api/releases/download/v1.1.0/standard-install.yaml

  # can probably deleted because of next paragraph
  # kubectl apply -f https://raw.githubusercontent.com/projectcontour/contour/main/examples/gateway/00-crds.yaml
  # kubectl apply -f https://projectcontour.io/quickstart/contour.yaml

  # read https://projectcontour.io/docs/main/guides/gateway-api/
  kubectl apply -f https://projectcontour.io/quickstart/contour-gateway-provisioner.yaml

  kubectl apply \
    -f ./mongo-express/service.yaml \
    -f ./mongo-express/gatewayClass.yaml \
    -f ./mongo-express/gateway.yaml \
    -f ./mongo-express/HTTPRoute.yaml
  watch --color -d 'kubectl get all; echo ""; kubectl get gateway & echo'
fi

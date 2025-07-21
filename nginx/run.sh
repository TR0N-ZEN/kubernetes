kubectl apply \
  -f ./service.yaml \
  -f ./deployment.yaml

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

watch --color -d 'kubectl get pods; kubectl get services;'


if [ $1 -eq 'ingress' ]; then
  kubectl apply \
    -f ./service.yaml \
    -f ./ingress.yaml
  watch --color -d 'kubectl get service; kubectl get ingress;'
fi
if [ $1 -eq 'nodePort.service' ]; then
  kubectl apply \
    -f ./nodePort.service.yaml
  watch --color -d 'kubectl get service;'
fi

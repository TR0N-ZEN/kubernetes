minikube delete
minikube start
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

watch --color -d 'kubectl get pods -n ingress-nginx'


for item in 'service' 'ingress' 'deployment'; do
  kubectl apply -f $item.yaml
done;

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

watch --color -d 'kubectl get pods; kubectl get services; kubectl get ingress'

curl `minikube ip`

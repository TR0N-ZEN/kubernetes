helm repo add jetstack https://charts.jetstack.io --force-update
sudo kubectl create namespace cert-manager

# helm -n cert-manager uninstall cert-manager

helm install \
  cert-manager jetstack/cert-manager \
  --namespace cert-manager \
  --version v1.17.0 \
  --set crds.enabled=true \
  --set disableAutoApproval=false \
  --set 'extraArgs={--acme-http01-solver-nameservers=8.8.8.8:53\,1.1.1.1:53}'

sudo kubectl apply -f ClusterIssuer.01.yaml

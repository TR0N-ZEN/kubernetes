
helm repo add jetstack https://charts.jetstack.io --force-update

# version 1.16.3 does note work
helm install \
  cert-manager jetstack/cert-manager \
  --namespace cert-manager \
  --create-namespace \
  --version v1.16.3 \
  --set crds.enabled=true \
  --set prometheus.enabled=false \
  --set disableAutoApproval=true

# version 1.12.0 works
#   tested with kubernetes/tmp/webserver.ingress.yaml
helm install \
  cert-manager \
  jetstack/cert-manager \
  --namespace cert-manager \
  --version v1.12.0 \
  --set installCRDs=true \
  --set disableAutoApproval=true

# helm -n cert-manager uninstall cert-manager

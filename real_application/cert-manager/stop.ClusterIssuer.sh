sudo kubectl delete ClusterIssuer letsencrypt-prod
helm -n cert-manager uninstall cert-manager
sudo kubectl delete namespace cert-manager
sudo kubectl delete crd \
  issuers.cert-manager.io \
  clusterissuers.cert-manager.io \
  certificates.cert-manager.io \
  certificaterequests.cert-manager.io \
  orders.acme.cert-manager.io \
  challenges.acme.cert-manager.io


can force pods to be distributed to specific (e.g. all) nodes

typically used for running log collectors for monitoring

```
kubectl apply -f fluentd-ds.yaml --record
kubectl get daemonsets
kubectl get ds -o wide
kubectl get ds fluentd-agent -o yaml
kubectl get ds fluentd-agent -o json
kubectl describe ds fluentd-agent
kubectl rollout status ds fluentd-agent
kubectl rollout history ds fluentd-agent
kubectl rollout history ds fluentd-agent --revision=1
kubectl set image ds fluentd-agent fluentd=quay.io/fluentd_elasticsearch/fluentd:v4.6.2 --record
kubectl rollout history ds fluentd-agent --revision=2
kubectl rollout undo ds fluentd-agent --to-revision=1
kubectl get all -l k8s-app=fluentd-agent -o wide
kubectl delete ds fluentd-agent
kubectl get ds,po -l k8s-app=fluentd-agent
```

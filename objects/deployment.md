```
# create a deployment template
  kubectl create deployment nginx-deployment \
    --image=nginx:1.20.2 \
    --port=80 \
    --replicas=3 \
    --dry-run=client \
    -o yaml \
    > nginx-deploy.yaml

```

changing the

+ image
+ container port
+ volumes
+ mounts

trigger a new **revision**/ a rolling update

when a rolling update is finished the replica set representing the old state is scaled to zero  
and the one representing the new state is scaled to what is set in the deployment

the deployment keeps the previous state aka revision saved to be able to rollback


```
kubectl apply -f nginx-deploy.yaml --record
kubectl get deploy -o wide
kubectl scale deploy nginx-deployment --replicas=4
kubectl describe deploy ngingx-deployment
kubectl rollout status deploy nginx-deployment
kubectl rollout history deploy nginx-deployment
kubectl rollout history deploy nginx-deployment --revision=1
kubectl set image deploy ngingx-deployment nginx=nginx:1.21.5 --record
kubectl rollout history deploy nginx-deployment --revision=2
kubectl rollout undo deploy ngingx-deployment --to-revision=1
kubectl get all -l app=nginx -o wide
kubectl delete deploy nginx-deployment
kubectl get deploy,rs,po -l app=nginx
```



curl -ks https://`kubectl get svc frontend -o=jsonpath="{.status.loadBalancer.ingress[0].ip}"`
kubectl explain deployment.spec.replicas
kubectl scale deployment hello --replicas=5
kubectl get pods | grep hello- | wc -l
kubectl scale deployment hello --replicas=3
kubectl get pods | grep hello- | wc -l

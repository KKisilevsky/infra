# Infra repository

Azure https://docs.microsoft.com/ru-ru/azure/developer/terraform/create-k8s-cluster-with-tf-and-aks 

> Для создания аутентификации Service Principal необходимо:
```
az ad sp create-for-rbac --role="Contributor" --scopes="/subscriptions/SUBSCRIPTION_ID"
```

> Для инициализации backend:
```
terraform init \
    -backend-config="storage_account_name=****************" \
    -backend-config="container_name=**********" \
    -backend-config="key=***************" \
    -backend-config="access_key=*************************"
```

echo "$(terraform output kube_config)" > ./azurek8s
export KUBECONFIG=./azurek8s
kubectl get nodes

k8s Web UI 
```
 az aks browse --resource-group myResourceGroup --name myAKSCluster
```


ArgoCD
> Install

kubectl create namespace argocd
kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml
kubectl patch svc argocd-server -n argocd -p '{"spec": {"type": "LoadBalancer"}}'
```
argocd proj create service -d https://kubernetes.default.svc,prod -s https://github.com/KKisilevsky/infra.git
```
argocd proj add-destination redis https://kubernetes.default.svc stage

argocd proj allow-cluster-resource redis "*" "*"

> https://www.browserling.com/tools/bcrypt
```
kubectl -n argocd patch secret argocd-secret \
  -p '{"stringData": {
    "admin.password": "$2a$10$rRyBsGSHK6.uc8fntPwVIuLVHgsAhAX7TcdrqW/RADU0uh7CaChLa",
    "admin.passwordMtime": "'$(date +%FT%T%Z)'"
  }}'
```

argocd login SERVER:PORT


Kubernetes

kubectl create secret generic mssql --from-literal=SA_PASSWORD="*******" -n dev

kubectl port-forward svc/platform -n dev 8070:80

kubectl get nodes -o wide

kubectl exec -i -t aks-ssh-7649d749d-mz8bk -- /bin/bash

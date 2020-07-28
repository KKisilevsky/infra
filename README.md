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

 az aks browse --resource-group myResourceGroup --name myAKSCluster




# Infra repository

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

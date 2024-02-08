**Super_Admin** - .Values.SuperAdminSecret


Чарт не **создает:**

**imagePullSecrets** - .Values.imagePullSecrets


**Security Context Constraints**


нужно добавить Users в ваш SCC. 


Пример 


```
system:serviceaccount:wso2-sandbox:wso2am-pattern-1-svc-account
```


**Namespace** - wso2-sandbox



**ServiceAccounts**- wso2am-pattern-1-svc-account - .Values.integration.settings.serviceAccount
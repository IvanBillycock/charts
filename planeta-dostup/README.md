Чарт не **создает:**

**imagePullSecrets** - .Values.environment.imagePullSecrets


**Security Context Constraints**


нужно добавить Users в ваш SCC. 


Пример 


```
system:serviceaccount:blk:planeta-dostup-redis,system:serviceaccount:blk:planeta-dostup
```


**Namespace** - blk



**ServiceAccounts**- planeta-dostup



**ConfigMap**
```
apiVersion: v1
kind: ConfigMap
metadata:
  name: planeta-init-db
data:
  init.sql: |-
    CREATE USER planeta WITH PASSWORD 'planeta';
    CREATE DATABASE access;
    GRANT ALL ON DATABASE access TO planeta;
    \c access
    CREATE EXTENSION IF NOT EXISTS pgcrypto;
    CREATE EXTENSION IF NOT EXISTS tablefunc;
```



при чистой установке, запустить руками.


скрипты на postgresql в /root
```
# Запускаются скрипты строго после того, как бэк Планеты.Доступа перешел в состояние "ready"
# но непосредственно перед стартом API Gateway, до того,

psql -v ON_ERROR_STOP=1 -h${PG_DB_HOST} -p${PG_DB_PORT} -U${PG_DB_USERNAME} ${PG_DB_NAME} -v"realm_id='ibs'" -v"realm_name='ibs'" -v"username='admin'" -v"password='admin'" -f /opt/planeta/setup/create-realm.sql
psql -v ON_ERROR_STOP=1 -h${PG_DB_HOST} -p${PG_DB_PORT} -U${PG_DB_USERNAME} ${PG_DB_NAME} -v"realm_id='ibs'" -v"realm_name='ibs'" -v"username='admin'" -v"password='admin'" -f /opt/planeta/setup/add-user.sql
```
#!/bin/bash

echo "====Creating Required PVC's"
kubectl apply -f pvc.yaml
echo "=====Creating Secret for Redis====="
kubectl create secret generic cart-redis-pass --from-literal=password=redis
echo ""
echo "======Creating cart service======"
kubectl apply -f cart-redis-total.yaml
kubectl apply -f cart-total.yaml
echo ""
echo "=====Creating Secret for Catalog Mongo====="
kubectl create secret generic catalog-mongo-pass --from-literal=password=mongo
echo ""
echo "=====Creating ConfigMap for catalot service====="
kubectl create -f catalog-db-initdb-configmap.yaml
echo ""
echo "=====Creating Catalog Service====="
kubectl apply -f catalog-db-total.yaml
kubectl apply -f catalog-total.yaml
echo ""
echo "=====Creating Payment Service====="
kubectl apply -f payment-total.yaml
echo ""
echo "=====Creating Order Secret====="
kubectl create secret generic order-postgres-pass --from-literal=password=postgres
echo ""
echo "=====Creating Order Service====="
kubectl apply -f order-db-total.yaml
kubectl apply -f order-total.yaml
echo ""
echo "=====Creating users secret====="
kubectl create secret generic users-mongo-pass --from-literal=password=mongo
kubectl create secret generic users-redis-pass --from-literal=password=redis
echo ""
echo "=====Creating ConfigMap for Users====="
kubectl create -f users-db-initdb-configmap.yaml
echo ""
echo "=====Creating users service====="
kubectl apply -f users-db-total.yaml
kubectl apply -f users-redis-total.yaml
kubectl apply -f users-total.yaml
echo ""
echo "=====Creating Frontend Service====="
kubectl apply -f frontend-total.yaml
kubectl get services -l service=frontend
echo""
echo "====Creating Point-of-Sales Service===="
kubectl apply -f point-of-sales-total.yaml
kubectl get services -l service=pos



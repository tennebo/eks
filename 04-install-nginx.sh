#!/bin/sh

helm repo add ingress-nginx https://kubernetes.github.io/ingress-nginx
helm repo update

kubectl apply -f nginx-namespace.yaml

helm upgrade --install ingress-nginx ingress-nginx/ingress-nginx \
    --namespace ingress-nginx \
    --values values.nginx-ingress.yaml

# Check the status
kubectl --namespace ingress-nginx get services -o wide ingress-nginx-controller

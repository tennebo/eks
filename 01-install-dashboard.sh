#!/bin/sh

# Dashboard
kubectl apply -f https://raw.githubusercontent.com/kubernetes/dashboard/v2.0.5/aio/deploy/recommended.yaml

# Create an eks-admin service account and cluster role binding
kubectl apply -f eks-admin-service-account.yaml

# Get a token to log in to the dashboard with
kubectl -n kube-system describe secret $(kubectl -n kube-system get secret | grep eks-admin | awk '{print $1}')

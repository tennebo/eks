#!/bin/sh

eksctl create cluster -f cluster.yaml --set-kubeconfig-context

kubectl config current-context

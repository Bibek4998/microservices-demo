#!/bin/bash
# Demo script: quick local walkthrough for the capstone project
# 1) Build Docker images for all services
for svc in $(ls -1)
do
  if [ -f "$svc/package.json" ] || [ -f "$svc/requirements.txt" ]; then
    echo "Building $svc..."
    docker build -t local/${svc//\//-}:latest ./$svc || true
  fi
done

# 2) Create kind cluster and apply helm charts
kind create cluster --name capstone-demo || true
for chart in charts/*; do
  if [ -d "$chart" ]; then
    helm install --atomic --wait $(basename $chart) $chart || helm upgrade --install $(basename $chart) $chart
  fi
done

# 3) Show pods
kubectl get pods -A

echo "Demo script finished. Adapt variables in terraform/ before attempting AWS deploy."

#!/bin/bash
kubectl delete -f nextcloud/0500_nextcloud_deployment.yml
docker build -t skymoore/nextcloud-nginx:latest .
docker push skymoore/nextcloud-nginx:latest
kubectl apply -f nextcloud/0500_nextcloud_deployment.yml
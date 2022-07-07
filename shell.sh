#!/bin/bash

pod=$1
container=$2

kubectl exec --stdin --tty $pod -c $container -n nextcloud -- /bin/sh
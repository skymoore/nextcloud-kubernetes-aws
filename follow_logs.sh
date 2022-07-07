#!/bin/bash

pod=$1
container=$2

kubectl logs $pod -c $container -n nextcloud --tail 100 --follow
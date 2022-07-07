# Nextcloud Kubernetes AWS Apache

## Requirements
- eks cluster running in aws
- [aws-ebs-csi-driver](https://docs.aws.amazon.com/eks/latest/userguide/ebs-csi.html) cluster addon installed
- [aws-load-balancer-controller](https://docs.aws.amazon.com/eks/latest/userguide/aws-load-balancer-controller.html) setup in the cluster

#### example terraform eks cluster can be found [here](https://github.com/mskymoore/terraform-eks-cluster)
---

## Info
- branches demonstrating deployments:
  - [apache](https://github.com/mskymoore/nextcloud-kubernetes-aws/tree/apache) uses apache image
  - [nginx](https://github.com/mskymoore/nextcloud-kubernetes-aws/tree/nginx) uses fpm image with nginx webserver
---

## Deploy

1. Populate ```nextcloud/0300_nextcloud_secrets.yml``` using the following command:
    ```bash
    echo -n "SOMESECRET" | base64
    ```
2. Deploy the application
    ```bash
    ./stack.sh create nextcloud
    ```
---

## Update deployment

```bash
./stack.sh apply nextcloud
```
---

## Remove from cluster
```bash
./stack.sh delete nextcloud
```
---

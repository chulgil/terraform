# terraform
Infrastructure As Code


## [Install Kubectl](https://kubernetes.io/docs/tasks/tools/install-kubectl-linux)

```console

# download
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"

# install
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl

# check
kubectl version --client
kubectl version --client --output=yaml


```

## AWS

```console


aws eks --region ap-northeast-2 update-kubeconfig --name my-github-terraform/cloud9/k8s-demo

```
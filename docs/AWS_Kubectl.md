## Kubectl (컨테이너 POD배포)

1. 예제 코드 > daemonset.yaml 배포
   - [daemonset.yml](../configs/k8s-manifests/daemonset.yaml) 

    ```bash
    kubectl create -f demonset.yaml
    ```
   
2. 예제 코드 > deployment.yaml 배포
   - [deployment.yml](../configs/k8s-manifests/deployment.yaml) 

    ```bash
    kubectl create -f deployment.yaml
    ```


3. 정상 배포 확인

    ```bash
    kubectl get ds
    kubectl get deploy
    kubectl get po
    ```

# AWS Kubectl

## Kubectl이란 무엇인가?

Kubectl은 Kubernetes 클러스터와 상호작용하기 위한 커맨드 라인 도구입니다. 이를 통해 클러스터에 애플리케이션을 배포하고, 클러스터 리소스를 관리하며, 로그를 확인하는 등 다양한 작업을 수행할 수 있습니다.

## Kubectl을 사용하는 이유

Kubectl은 Kubernetes 클러스터를 관리하는 데 필수적인 도구입니다. 다음과 같은 이유로 사용합니다:

*   **클러스터 관리**: 클러스터의 상태를 확인하고, 노드, 파드, 서비스 등 다양한 리소스를 관리할 수 있습니다.
*   **애플리케이션 배포 및 관리**: YAML 또는 JSON 파일을 사용하여 애플리케이션을 클러스터에 배포하고, 업데이트하거나 삭제할 수 있습니다.
*   **문제 해결**: 파드 로그를 확인하거나, 리소스의 상세 정보를 얻어 문제를 진단하고 해결할 수 있습니다.

## 컨테이너 POD 배포 예제

1. 예제 코드 > daemonset.yaml 배포
   - [daemonset.yml](../configs/k8s-manifests/daemonset.yaml) 

    ```bash
    kubectl create -f demonset.yaml # daemonset.yaml 파일을 사용하여 DaemonSet 배포
    ```
   
2. 예제 코드 > deployment.yaml 배포
   - [deployment.yml](../configs/k8s-manifests/deployment.yaml) 

    ```bash
    kubectl create -f deployment.yaml # deployment.yaml 파일을 사용하여 Deployment 배포
    ```


3. 정상 배포 확인

    ```bash
    kubectl get ds # DaemonSet 목록 확인
    kubectl get deploy # Deployment 목록 확인
    kubectl get po # Pod 목록 확인
    kubectl get no # 노드 현황 확인
    ```

## 자주 사용하는 Kubectl 명령어

Kubectl은 다양한 명령어를 제공하여 클러스터 관리를 돕습니다. 다음은 자주 사용되는 명령어들입니다.

*   **클러스터 정보 확인**
    ```bash
    kubectl cluster-info # 클러스터 정보 및 서비스 엔드포인트 확인
    kubectl config view # kubeconfig 설정 확인
    ```

*   **리소스 목록 확인**
    ```bash
    kubectl get pods # 현재 네임스페이스의 모든 파드 목록 확인
    kubectl get services # 현재 네임스페이스의 모든 서비스 목록 확인
    kubectl get deployments -n <namespace> # 특정 네임스페이스의 Deployment 목록 확인
    kubectl get all # 현재 네임스페이스의 대부분의 리소스 목록 확인
    ```

*   **리소스 상세 정보 확인**
    ```bash
    kubectl describe pod <pod-name> # 특정 파드의 상세 정보 확인
    kubectl describe service <service-name> # 특정 서비스의 상세 정보 확인
    ```

*   **로그 확인**
    ```bash
    kubectl logs <pod-name> # 특정 파드의 로그 확인
    kubectl logs <pod-name> -c <container-name> # 특정 파드의 특정 컨테이너 로그 확인
    kubectl logs -f <pod-name> # 특정 파드의 로그 실시간 확인 (follow)
    ```

*   **리소스 삭제**
    ```bash
    kubectl delete pod <pod-name> # 특정 파드 삭제
    kubectl delete deployment <deployment-name> # 특정 Deployment 삭제
    kubectl delete -f <file.yaml> # 파일에 정의된 리소스 삭제
    ```

*   **파드 내부 접근**
    ```bash
    kubectl exec -it <pod-name> -- /bin/bash # 특정 파드 내부로 bash 쉘 접속
    ```

*   **리소스 편집**
    ```bash
    kubectl edit deployment <deployment-name> # 특정 Deployment를 에디터로 열어 수정
    ```

이 외에도 다양한 명령어가 있으며, `kubectl --help` 또는 `kubectl <command> --help`를 통해 자세한 정보를 얻을 수 있습니다.

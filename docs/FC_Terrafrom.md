![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-0-full.png)
# **1 개발자를위한Kubernetes 활용소개**

**01 개발자를위한Kubernetes 활용Orientation**


1


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-1-full.png)
##### **Kubernetes란? 01 .**

개발자를위한
Kubernetes 활용
Orientation


쿠버네티스(Kubernetes, 쿠베르네테스, "K8s")는 컨테이너화된애플리케이션의
자동배포, 스케일링등을제공하는 관리시스템으로, 오픈소스기반이다. 원래구글에
의해설계되었고현재리눅스재단에의해관리되고있다. 목적은여러클러스터의
호스트간에애플리케이션 컨테이너의 배치, 스케일링, 운영을 자동화하기위한
플랫폼을제공하기위함이다. 도커를포함하여일련의컨테이너도구들과함께
동작한다.


출처: https://ko.wikipedia.org/wiki/%EC%BF%A0%EB%B2%84%EB%84%A4%ED%8B%B0%EC%8A%A4


2


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-2-full.png)
##### **Kubernetes 공식홈페이지 01 .**

개발자를위한
Kubernetes 활용
Orientation

![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-2-0.png)


**https://kubernetes.io/ko/**


3


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-3-full.png)
##### **개발자를위한Kubernetes 활용컨셉 01 .**

개발자를위한
Kubernetes 활용
Orientation


**1.**
**클라우드인프라기반컨테이너플랫폼환경** **설계** **및** **구축** **수행**


**2.**
**컨테이너플랫폼기반** **개발** **환경구성**


**3.**
**컨테이너플랫폼의안정적인** **운영** **방안마련**


4


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-4-full.png)
##### **개발자를위한Kubernetes 활용파트구성 01 .**

개발자를위한
Kubernetes 활용
Orientation


**1.**
**개발자를위한Kubernetes 활용소개**

**2. Terraform** **EKS**
**을활용한AWS** **생성**

**3. AWS EKS 기본** **Plugin 구성방법**
**4. Kubernetes Manifest 작성을위한** **Helm 활용**

**5.** **GitHub**
**Kubernetes 배포를위한** **와** **활용**
**ArgoCD**

**6. Kubernetes**
**안정성** **강화방법**

**7. Kubernetes Custom**
**관리방법**

**8. Kubernetes 보안** **강화방법**

**9. Kubernetes 트러블슈팅** **방법**

**10.Go** **CLI**
**를활용한Kubernetes** **개발**

**11.**
**Kubernetes 활용** **미니프로젝트** **수행하기**


5


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-5-full.png)
##### **Terraform을활용한AWS EKS 생성 01 .**

개발자를위한
Kubernetes 활용
Orientation


**1. Terraform을활용한AWS EKS 생성** **소개**


**2.**
**실습환경구성을위한AWS 네트워크및EKS 설계**


**3. [실습] AWS 웹콘솔을활용한AWS EKS 생성**


**4. Terraform 소개(Terraformer 포함)**


**5.** **Terraform**
**[실습]** **을활용한AWS EKS 생성**


**6.** **Terraformer**
**[실습]** **를활용한AWS EKS 관리**


6


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-6-full.png)
##### **Terraform, Terraformer 제공사이트 01 .**

개발자를위한
Kubernetes 활용
Orientation


**https://www.terraform.io/**

![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-6-0.png)

![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-6-1.png)


**https://github.com/GoogleCloudPlatform/terraformer**


7


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-7-full.png)
##### **AWS EKS 기본Plugin 구성방법 01 .**

개발자를위한
Kubernetes 활용
Orientation


**1. AWS**
**EKS 기본설정** **방법소개**


**2.**
**[실습] EKS Node 및POD IP 대역분리(Secondray CIDR) 적용**


**3.**
**[실습] AWS ALB Controller를활용한** **생성**
**Ingress ALB**


**4. [실습] AWS ALB Controller를활용한** **Service NLB 생성**


**5.**
**[실습] AWS EBS CSI Driver를활용한** **Block Storage PV 생성**


**6.**
**[실습] AWS EFS CSI Driver를활용한** **File Storage PV 생성**


**7.**
**[실습] Cluster Autoscaler를활용한** **EKS노드오토스케일링**


8


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-8-full.png)
##### **AWS EKS Plugin 제공사이트 01 .**

개발자를위한
Kubernetes 활용
Orientation

![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-8-0.png)


**https://github.com/kubernetes-sigs/aws-load-balancer-controller**

![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-8-1.png)


**https://github.com/kubernetes-sigs/aws-ebs-csi-driver**

![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-8-2.png)


**https://github.com/kubernetes-sigs/aws-efs-csi-driver**


9


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-9-full.png)
##### **Kubernetes Manifest 작성을위한Helm 활용 01 .**

개발자를위한
Kubernetes 활용
Orientation


**1. Kubernetes Manifest 작성** **방법소개**


**2. Kustomize 소개**


**3. [실습] Kustomize을활용한** **Manifest 배포하기**


**4. Helm Charts 소개**


**5. Helm**
**Values 및Template 소개**


**6. [실습] Helm Charts를활용한** **Manifest 배포하기**


10


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-10-full.png)
##### **Kustomize와Helm의제공사이트 01 .**

개발자를위한
Kubernetes 활용
Orientation

![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-10-0.png)

![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-10-1.png)


**https://kustomize.io/** **https://helm.sh/**


11


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-11-full.png)
##### **Kubernetes 배포를위한GitHub와ArgoCD 활용 01 .**

개발자를위한
Kubernetes 활용
Orientation


**1. Git을활용한Kubernetes 배포** **방법소개**


**2. [실습] Github Repository 생성및설정**


**3.**
**Kubernetes 배포도구(** **) 소개**
**ArgoCD, ArgoRollout**


**4.**
**[실습]** **구성**
**ArgoCD**


**5.**
**[실습] ArgoCD를활용한Kubernetes Manifest 배포**


**6.**
**[실습] ArgoRollout 구성**


**7.**
**[실습] Argo Rollout을활용한** **무중단배포**


12


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-12-full.png)
##### **ArgoCD와Argo Rollout의제공사이트 01 .**

개발자를위한
Kubernetes 활용
Orientation

![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-12-0.png)


**https://argo-cd.readthedocs.io/en/stable/**

![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-12-1.png)


**https://argoproj.github.io/argo-rollouts/**


13


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-13-full.png)
##### **Kubernetes 안정성강화방법 01 .**

개발자를위한
Kubernetes 활용
Orientation


**1. Kubernetes 안정성강화** **방법소개**


**2.** **HPA**
**[실습]** **소개및Metrics Server 설치**


**3.**
**[실습] HPA 및** **오토스케일링** **적용**


**4. [실습] Minio 소개및설치**


**5.** **S3**
**[실습] Minio 및AWS** **연결후** **업로드/다운로드** **적용**


**6.** **Velero**
**[실습]** **소개및설치**


**7.**
**[실습] Velero 백업** **적용**


**8. [실습] Velero 복구** **적용**


14


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-14-full.png)
##### **minio와velero의제공사이트 01 .**

개발자를위한
Kubernetes 활용
Orientation

![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-14-0.png)

![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-14-1.png)


**https://min.io/** **https://velero.io/**


15


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-15-full.png)
##### **Kubernetes Custom 관리방법 01 .**

개발자를위한
Kubernetes 활용
Orientation


**1. Kubernetes Custom 관리** **방법소개**


**2.** **CRD**
**Custom Resource Definition(** **) 소개**


**3. Kubernetes**
**소개**
**Operator**


**4.**
**[실습] Kubernetes Operator 적용**


**https://kubernetes.io/ko/docs/concepts/extend-kubernetes/operator/**


16


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-16-full.png)
##### **Kubernetes 보안강화방법 01 .**

개발자를위한
Kubernetes 활용
Orientation


**1. Kubernetes 보안강화** **활용소개**


**2. [실습] kube2iam 소개및설치**


**3. [실습] kube2iam를활용한AWS IAM 기반** **권한관리**


**4. [실습] Falco 소개및설치**


**5.**
**[실습] Falco를활용한** **런타임보안강화**


**6.**
**[실습] OPA Gatekeeper 소개및설치**


**7.**
**[실습] OPA Gatekeeper를활용한** **보안정책관리**


**8.**
**[실습]** **소개및설치**
**cert-manager**


**9.**
**[실습] cert-manager를활용한** **TLS 인증서관리**


**10.** **ACM**

**[실습] AWS** **활용** **TLS 인증서관리**


17


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-17-full.png)
##### **kube2iam, falco, opa, cert-mgr 제공사이트 01 .**

개발자를위한
Kubernetes 활용
Orientation

![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-17-1.png)


**https://falco.org/ko/**

![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-17-0.png)
**https://github.com/jtblin/kube2iam**

![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-17-2.png)

![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-17-3.png)


**https://github.com/open-policy-agent/gatekeeper** **https://cert-manager.io/docs/**


18


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-18-full.png)
##### **Kubernetes 트러블슈팅방법 01 .**

개발자를위한
Kubernetes 활용
Orientation


**1. Kubernetes 트러블슈팅** **방법소개**


**2.**
**[실습] Cluster 로깅** **및이슈사례조치방법**


**3.**
**[실습] Node 로깅** **및이슈사례조치방법**


**4.**
**[실습] POD 로깅** **및이슈사례조치방법**


**5.**
**[실습] 보안관련로깅** **및이슈사례조치방법**


**6.**
**[실습] DNS 로깅** **및이슈사례조치방법**


**https://kubernetes.io/docs/tasks/debug-application-cluster/troubleshooting/**


19


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-19-full.png)
##### **Go를활용한Kubernetes CLI 개발 01 .**

개발자를위한
Kubernetes 활용
Orientation


**1. Go** **CLI**
**를활용한Kubernetes** **개발소개**


**2. Go언어필수** **문법** **소개**


**3. Kubernetes Custom**
**CLI 설계**


**4.** **API**
**[실습] Kubernetes** **활용** **모듈구현**


**5.**
**[실습] Kubernetes CLI 빌드및실행**


**https://github.com/kubernetes/client-go**


20


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-20-full.png)
##### **Kubernetes 활용미니프로젝트수행하기 01 .**

개발자를위한
Kubernetes 활용
Orientation


**1.**
**Kubernetes 활용미니프로젝트소개**


**2. [실습] CI 환경설정및** **빌드** **준비하기**


**3. [실습] CD 환경설정및** **배포** **준비하기**


**4.** **CI**
**[실습]** **빌드수행및** **컨테이너Push, Helm Charts Push 하기**


**5. [실습] CD 자동** **Trigger 및** **배포/기동상태** **확인하기**


**6.**
**[실습] Canary 배포** **적용및** **무중단버전업데이트** **하기**


21


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-21-full.png)
##### **실습환경구축시과금관련주의사항 01 .**

개발자를위한
Kubernetes 활용
Orientation


**주의사항**

    해당강의의실습은AWS 클라우드의유료서비스를포함하고있습니다.

    AWS 프리티어에서제공하는서비스초과사용분과프리티어에서제공하지않는서비스에서
과금이발생할수있습니다.

    정확한요금은다음의사이트에서확인하시기바랍니다.

**https://aws.amazon.com/ko/pricing/**


**AWS 프리티어미포함서비스**

    대상서비스: AWS EKS (Elastic Kubernetes Service)

    요금산정:

    
    - 1 Cluster x 0.10 USD per hour x 730 hours per month = **73.00 USD**

    - 3 Worker Nodes* x 0.0468 USD per hour x 730 hours per month = **102.492 USD**

     - Worker Node Spec (t3a.medium Type ‒ 2Core CPU, 4GB Mem)
**175.492 USD**
**AWS EKS 총비용(월별) : 73.00 + 102.492 =**


22


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-22-full.png)
### **2 Terraform을활용한AWS EKS 생성**

**01 Terraform을활용한AWS EKS 생성소개**


1


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-23-full.png)
##### **Infrastructure as Code(IaC)란? 01 .**

Terraform을
활용한AWS EKS
생성소개


출처: https://blog.stackpath.com/infrastructure-as-code-explainer/

![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-23-0.png)


2


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-24-full.png)
##### **Terraform이란? 01 .**

Terraform을
활용한AWS EKS
생성소개

![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-24-0.png)


출처: https://learn.hashicorp.com/tutorials/terraform/infrastructure-as-code


3


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-25-full.png)
##### **AWS EKS란? 01 .**

Terraform을
활용한AWS EKS
생성소개

![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-25-0.png)


출처: https://aws.amazon.com/ko/eks/


4


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-26-full.png)
##### **Terraform을활용한AWS EKS 생성챕터소개 01 .**

Terraform을
활용한AWS EKS
생성소개


**1.**
**Terraform을활용한AWS EKS 생성소개**


**2.**
**실습환경구성을위한AWS 네트워크및EKS 설계**


**3. [실습] AWS 웹콘솔을활용한AWS EKS 생성**


**4. Terraform 소개(Terraformer 포함)**


**5.** **Terraform**
**[실습]** **을활용한AWS EKS 생성**


**6.** **Terraformer**
**[실습]** **를활용한AWS EKS 관리**


5


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-27-full.png)
### **2 Terraform을활용한AWS EKS 생성**

**02 실습환경구성을위한AWS 네트워크및EKS 설계**


1


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-28-full.png)
##### **실습환경구성을위한AWS 네트워크및EKS 설계 02 .**

실습환경구성을
위한AWS
네트워크및EKS
설계


**1. VPC**
**생성(Secondary CIDR 포함)**


**2. Subnet 및** **생성**
**Internet Gateway**


**3. Route Table**
**생성**


**4. EKS Cluster 생성**


**5.**
**EKS Node Group 생성**


**6. POD**
**(Container) 배포**


2


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-29-full.png)
##### **AWS 네트워크및EKS 구성도(실습환경) 02 .**

실습환경구성을
위한AWS
네트워크및EKS
설계

Internet


User


AWS Cloud















|Col1|Availability Zone (ap-northeast-2a)|Col3|Col4|Col5|Availability Zone (ap-northeast-2c)|Col7|
|---|---|---|---|---|---|---|
|V|PC (Primary : 172.31.0.0/16, Secondary : 100.31.0.0/<br>Public subnet1 (172.31.0.0/20)<br>EKS Cluster<br>EKS Worker Node<br>POD1<br>(Container)<br>POD2<br>(Container)|PC (Primary : 172.31.0.0/16, Secondary : 100.31.0.0/<br>Public subnet1 (172.31.0.0/20)<br>EKS Cluster<br>EKS Worker Node<br>POD1<br>(Container)<br>POD2<br>(Container)|PC (Primary : 172.31.0.0/16, Secondary : 100.31.0.0/<br>Public subnet1 (172.31.0.0/20)<br>EKS Cluster<br>EKS Worker Node<br>POD1<br>(Container)<br>POD2<br>(Container)|16)<br>Internet gateway<br>Router|Public subnet3 (172.31.32.0/20)<br>EKS Worker Node<br>POD1<br>(Container)<br>POD2<br>(Container)||
|V|PC (Primary : 172.31.0.0/16, Secondary : 100.31.0.0/<br>Public subnet1 (172.31.0.0/20)<br>EKS Cluster<br>EKS Worker Node<br>POD1<br>(Container)<br>POD2<br>(Container)|EKS Cluster<br>EKS Worker Node<br>POD1<br>(Container)<br>POD2<br>(Container)|EKS Cluster<br>EKS Worker Node<br>POD1<br>(Container)<br>POD2<br>(Container)||EKS Worker Node<br>POD1<br>(Container)<br>POD2<br>(Container)|EKS Worker Node<br>POD1<br>(Container)<br>POD2<br>(Container)|
|V|PC (Primary : 172.31.0.0/16, Secondary : 100.31.0.0/<br>Public subnet1 (172.31.0.0/20)<br>EKS Cluster<br>EKS Worker Node<br>POD1<br>(Container)<br>POD2<br>(Container)|EKS Cluster<br>EKS Worker Node<br>POD1<br>(Container)<br>POD2<br>(Container)|EKS Worker Node|EKS Node Group|EKS Worker Node|EKS Worker Node|
|V|PC (Primary : 172.31.0.0/16, Secondary : 100.31.0.0/<br>Public subnet1 (172.31.0.0/20)<br>EKS Cluster<br>EKS Worker Node<br>POD1<br>(Container)<br>POD2<br>(Container)|EKS Cluster<br>EKS Worker Node<br>POD1<br>(Container)<br>POD2<br>(Container)|EKS Worker Node||||
|V|PC (Primary : 172.31.0.0/16, Secondary : 100.31.0.0/<br>Public subnet1 (172.31.0.0/20)<br>EKS Cluster<br>EKS Worker Node<br>POD1<br>(Container)<br>POD2<br>(Container)|EKS Cluster<br>EKS Worker Node<br>POD1<br>(Container)<br>POD2<br>(Container)|EKS Worker Node||||
|V|||||||


3


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-30-full.png)
### **2 Terraform을활용한AWS EKS 생성**

**03 AWS 웹콘솔을활용한AWS EKS 생성**


1


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-31-full.png)
##### **AWS 네트워크및EKS 구성도(실습환경) 03 .**

AWS 웹콘솔을
활용한AWS EKS
생성


Internet


User


AWS Cloud

















|Col1|Availability Zone (ap-northeast-2a)|Col3|Col4|Col5|Availability Zone (ap-northeast-2c)|Col7|
|---|---|---|---|---|---|---|
|V|PC (Primary : 172.31.0.0/16)<br>Public subnet1 (172.31.0.0/20)<br>EKS Cluster<br>EKS Worker Node<br>POD1<br>(Container)<br>POD2<br>(Container)|PC (Primary : 172.31.0.0/16)<br>Public subnet1 (172.31.0.0/20)<br>EKS Cluster<br>EKS Worker Node<br>POD1<br>(Container)<br>POD2<br>(Container)|PC (Primary : 172.31.0.0/16)<br>Public subnet1 (172.31.0.0/20)<br>EKS Cluster<br>EKS Worker Node<br>POD1<br>(Container)<br>POD2<br>(Container)|Internet gateway<br>Router|Public subnet3 (172.31.32.0/20)<br>EKS Worker Node<br>POD1<br>(Container)<br>POD2<br>(Container)||
|V|PC (Primary : 172.31.0.0/16)<br>Public subnet1 (172.31.0.0/20)<br>EKS Cluster<br>EKS Worker Node<br>POD1<br>(Container)<br>POD2<br>(Container)|EKS Cluster<br>EKS Worker Node<br>POD1<br>(Container)<br>POD2<br>(Container)|EKS Cluster<br>EKS Worker Node<br>POD1<br>(Container)<br>POD2<br>(Container)||EKS Worker Node<br>POD1<br>(Container)<br>POD2<br>(Container)|EKS Worker Node<br>POD1<br>(Container)<br>POD2<br>(Container)|
|V|PC (Primary : 172.31.0.0/16)<br>Public subnet1 (172.31.0.0/20)<br>EKS Cluster<br>EKS Worker Node<br>POD1<br>(Container)<br>POD2<br>(Container)|EKS Cluster<br>EKS Worker Node<br>POD1<br>(Container)<br>POD2<br>(Container)|EKS Worker Node|EKS Node Group|EKS Worker Node|EKS Worker Node|
|V|PC (Primary : 172.31.0.0/16)<br>Public subnet1 (172.31.0.0/20)<br>EKS Cluster<br>EKS Worker Node<br>POD1<br>(Container)<br>POD2<br>(Container)|EKS Cluster<br>EKS Worker Node<br>POD1<br>(Container)<br>POD2<br>(Container)|EKS Worker Node||||
|V|PC (Primary : 172.31.0.0/16)<br>Public subnet1 (172.31.0.0/20)<br>EKS Cluster<br>EKS Worker Node<br>POD1<br>(Container)<br>POD2<br>(Container)|EKS Cluster<br>EKS Worker Node<br>POD1<br>(Container)<br>POD2<br>(Container)|EKS Worker Node||||
|V|||||||


2


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-32-full.png)

**사전준비사항**


**1. VPC**
**생성및설정확인**


**2. Subnet 생성확인**


**3.**
**생성확인**
**Internet Gateway**


**4. Route Table 생성확인**


*** 중요사항**


##### **03 .**

AWS 웹콘솔을
활용한AWS EKS
생성




**EKS Cluster 및Nodegroup이실행될대상Subnet에는반드시해당TAG가있어야함**


**- TAG명: kubernetes.io/cluster/<EKS Cluster명>**


**- TAG값: shared**


3


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-33-full.png)

**실습내용**


**순서**


**1.**
**Security Group 생성**


**2. IAM Role 및** **Policy 생성**


**3. EKS Cluster**
**생성**


**4.**
**EKS Node Group 생성**


**5. AWS Configure 및** **Kubeconfig 설정**


**6. POD**
**(Container) 배포**


**실습예제코드경로**


**>**
**Chapter02** **Ch02_03-eks**


4


##### **03 .**

AWS 웹콘솔을
활용한AWS EKS
생성


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-34-full.png)

**IAM Role 및Policy 생성대상‒ EKS Cluster**


**1. IAM Role 생성명**


**test-iam-role-eks-cluster**


**2. Role내적용할Policy 목록**


**-**
**AmazonEKSClusterPolicy**


**-**
**AmazonEKSVPCResourceController**


5


##### **03 .**

AWS 웹콘솔을
활용한AWS EKS
생성


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-35-full.png)

**IAM Role 및Policy 생성대상‒ EKS Node Group**


**1. IAM Role 생성명**


**test-iam-role-eks-nodegroup**


**2. Role내적용할Policy 목록**


**-**
**AmazonEKSWorkerNodePolicy**


**-**
**AmazonEKS_CNI_Policy**


**-**
**AmazonEC2ContainerRegistryReadOnly**


6


##### **03 .**

AWS 웹콘솔을
활용한AWS EKS
생성


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-36-full.png)

**kubectl 설치방법‒ Mac OS**


**1. 파일다운로드**


**$ curl -o kubectl https://amazon-eks.s3.us-west-**


**2.amazonaws.com/1.21.2/2021-07-05/bin/darwin/amd64/kubectl**


**2. 권한적용및파일이동**


**$ chmod +x ./kubectl && mv ./kubectl /usr/local/bin/**


**3. kubectl 동작확인**


**$ kubectl version**


7


##### **03 .**

AWS 웹콘솔을
활용한AWS EKS
생성


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-37-full.png)

**Kubectl 설치방법‒ Linux (Ubuntu)**


**1. 파일다운로드**


**$ curl -o kubectl https://amazon-eks.s3.us-west-**


**2.amazonaws.com/1.21.2/2021-07-05/bin/linux/amd64/kubectl**


**2. 권한적용및파일이동**


**$ chmod +x ./kubectl && mv ./kubectl /usr/local/bin/**


**3. kubectl 동작확인**


**$ kubectl version**


8


##### **03 .**

AWS 웹콘솔을
활용한AWS EKS
생성


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-38-full.png)

**Kubectl 설치방법‒ Windows**


**1. 파일다운로드**


**$ curl -o kubectl.exe https://amazon-eks.s3.us-west-**


##### **03 .**

AWS 웹콘솔을
활용한AWS EKS
생성



**2.amazonaws.com/1.21.2/2021-07-05/bin/windows/amd64/kubectl.exe**


**2. 권한적용및파일이동**


**-**
**bin 파일을실행가능한특정PATH로이동**


**3. kubectl 동작확인**


**$ kubectl version**


9


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-39-full.png)

**명령어모음‒ AWSCLI (EKS 접속)**


**1. AWS 계정Access Key 설정**


**$ aws configure**


**2. Kubectl 사용을위한Kubeconfig 설정**


##### **03 .**

AWS 웹콘솔을
활용한AWS EKS
생성



**$ aws eks update-kubeconfig --region <Region명> --name <EKS명>**


10


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-40-full.png)

**명령어모음‒ Kubectl (컨테이너POD 배포)**


**1. 예제코드> daemonset.yaml 배포**


**$ kubectl create ‒f daemonset.yaml**


**2. 예제코드> deployment.yaml 배포**


**$ kubectl create ‒f deployment.yaml**


**3. 정상배포확인**


**$ kubectl get daemonset**


**$ kubectl get deployment**


**$ kubectl get pods**


11


##### **03 .**

AWS 웹콘솔을
활용한AWS EKS
생성


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-41-full.png)
### **2 Terraform을활용한AWS EKS 생성**

**04 Terraform 소개**


1


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-42-full.png)

**Terraform 소개**


**1.**
**Terraform 소개**


**2.**
**Terraform 설치방법**


**3.**
**Terraform 기본리소스**


**4.**
**Terraform 기본명령어**


##### **04 .**

Terraform 소개



2


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-43-full.png)

**Terraform 소개**


    **참고**


**https://learn.hashicorp.com/tutorials/terraform/infrastructure-as-code**

![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-43-0.png)


3


##### **04 .**

Terraform 소개


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-44-full.png)

**Terraform 설치방법‒ Mac OS**


**설치명령어**


**$ brew tap hashicorp/tapbrew install**


**$ hashicorp/tap/terraform**


4


##### **04 .**

Terraform 소개


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-45-full.png)

**Terraform 설치방법‒ Linux (Ubuntu)**


**설치명령어**


##### **04 .**

Terraform 소개



**$ curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add ‒**


**$ sudo apt-add-repository "deb [arch=amd64]**


**https://apt.releases.hashicorp.com $(lsb_release -cs) main"**


**$ sudo apt-get update && sudo apt-get install terraform**


5


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-46-full.png)

**Terraform 설치방법‒ Windows**


**1. 다음URL에서파일다운로드**


##### **04 .**

Terraform 소개



**https://releases.hashicorp.com/terraform/1.1.5/terraform_1.1.5_windows_amd64.zip**


**2. 압축해제**


**3. terraform 파일을실행가능위치에두고실행**


6


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-47-full.png)

**Terraform 기본리소스‒ Resource**


  **프로비저닝할Resource의오브젝트를기술**


  **각Resource는오직1개의리소스타입만가짐**


  **Resource내에사용가능한변수를설정**


  **예시**


##### **04 .**

Terraform 소개



**https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/eks_cluster**


7


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-48-full.png)

**Terraform 기본리소스‒ Data Source**


  **Provider에서제공하는Resource 정보를가져옴**


  **Terraform에서사용할수있는형태로연결**


  **Filter를통해정보를가져올수도있음**


  **예시**


##### **04 .**

Terraform 소개



**https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/eks_cluster**


8


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-49-full.png)

**Terraform 기본리소스‒ Providers**


  **1000개이상의다양한Provider를제공**


  **Provider를선언해해당인프라에프로비저닝할수있도록설정**


  **참고**


**https://registry.terraform.io/browse/providers**


9


##### **04 .**

Terraform 소개


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-50-full.png)

**Terraform 기본리소스‒ Variables**


  **Terraform의tf파일내에서사용가능한변수를지정**


  **terraform 명령어가실행되는디렉토리내에있는파일에서사용가능**


  **Resource, Data Source, Providers에서모두변수지정해사용가능**


  **참고**


**https://www.terraform.io/language/values/variables**


10


##### **04 .**

Terraform 소개


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-51-full.png)

**Terraform 기본명령어(프로비저닝)**


**1. Terraform 초기화(Init)**


**$ terraform init**


**2. Terraform 프로비저닝코드검증(Dry Run)**


**$ terraform plan**


**3. Terraform 프로비저닝수행(Run)**


**$ terraform apply**


11


##### **04 .**

Terraform 소개


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-52-full.png)

**Terraform 기본명령어(프로비저닝적용삭제)**


**1. Terraform 프로비저닝적용삭제코드검증(Dry Run)**


**$ terraform plan --destroy**


**2. Terraform 프로비저닝적용삭제수행(Run)**


**$ terraform destroy**


12


##### **04 .**

Terraform 소개


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-53-full.png)
### **2 Terraform을활용한AWS EKS 생성**

**05 Terraform을활용한AWS EKS 생성**


1


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-54-full.png)
##### **AWS 네트워크및EKS 구성도(실습환경) 05 .**

Terraform을
활용한AWS EKS
생성


Internet


User


AWS Cloud

















|Col1|Availability Zone (ap-northeast-2a)|Col3|Col4|Col5|Availability Zone (ap-northeast-2c)|Col7|
|---|---|---|---|---|---|---|
|V|PC (Primary : 172.31.0.0/16)<br>Public subnet1 (172.31.0.0/20)<br>EKS Cluster<br>EKS Worker Node<br>POD1<br>(Container)<br>POD2<br>(Container)|PC (Primary : 172.31.0.0/16)<br>Public subnet1 (172.31.0.0/20)<br>EKS Cluster<br>EKS Worker Node<br>POD1<br>(Container)<br>POD2<br>(Container)|PC (Primary : 172.31.0.0/16)<br>Public subnet1 (172.31.0.0/20)<br>EKS Cluster<br>EKS Worker Node<br>POD1<br>(Container)<br>POD2<br>(Container)|Internet gateway<br>Router|Public subnet3 (172.31.32.0/20)<br>EKS Worker Node<br>POD1<br>(Container)<br>POD2<br>(Container)||
|V|PC (Primary : 172.31.0.0/16)<br>Public subnet1 (172.31.0.0/20)<br>EKS Cluster<br>EKS Worker Node<br>POD1<br>(Container)<br>POD2<br>(Container)|EKS Cluster<br>EKS Worker Node<br>POD1<br>(Container)<br>POD2<br>(Container)|EKS Cluster<br>EKS Worker Node<br>POD1<br>(Container)<br>POD2<br>(Container)||EKS Worker Node<br>POD1<br>(Container)<br>POD2<br>(Container)|EKS Worker Node<br>POD1<br>(Container)<br>POD2<br>(Container)|
|V|PC (Primary : 172.31.0.0/16)<br>Public subnet1 (172.31.0.0/20)<br>EKS Cluster<br>EKS Worker Node<br>POD1<br>(Container)<br>POD2<br>(Container)|EKS Cluster<br>EKS Worker Node<br>POD1<br>(Container)<br>POD2<br>(Container)|EKS Worker Node|EKS Node Group|EKS Worker Node|EKS Worker Node|
|V|PC (Primary : 172.31.0.0/16)<br>Public subnet1 (172.31.0.0/20)<br>EKS Cluster<br>EKS Worker Node<br>POD1<br>(Container)<br>POD2<br>(Container)|EKS Cluster<br>EKS Worker Node<br>POD1<br>(Container)<br>POD2<br>(Container)|EKS Worker Node||||
|V|PC (Primary : 172.31.0.0/16)<br>Public subnet1 (172.31.0.0/20)<br>EKS Cluster<br>EKS Worker Node<br>POD1<br>(Container)<br>POD2<br>(Container)|EKS Cluster<br>EKS Worker Node<br>POD1<br>(Container)<br>POD2<br>(Container)|EKS Worker Node||||
|V|||||||


2


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-55-full.png)

**사전준비사항**


**1. VPC**
**생성및설정확인**


**2. Subnet 생성확인**


**3.**
**생성확인**
**Internet Gateway**


**4. Route Table 생성확인**


##### **05 .**

Terraform을
활용한AWS EKS
생성



3


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-56-full.png)

**실습내용**


**순서**


**1.**
**Security Group 생성**


**2. IAM Role 및** **Policy 생성**


**3. EKS Cluster**
**생성**


**4.**
**EKS Node Group 생성**


**5. AWS Configure 및** **Kubeconfig 설정**


**6. POD**
**(Container) 배포**


**실습예제코드경로**


**>**
**Chapter02** **Ch02_05-terraform-eks**


4


##### **05 .**

Terraform을
활용한AWS EKS
생성


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-57-full.png)

**명령어모음‒ Terraform (EKS 생성)**


**1. Terraform 초기화(Init)**


**$ terraform init**


**2. Terraform 프로비저닝코드검증(Dry Run)**


**$ terraform plan**


**3. Terraform 프로비저닝수행(Run)**


**$ terraform apply**


5


##### **05 .**

Terraform을
활용한AWS EKS
생성


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-58-full.png)

**명령어모음‒ AWSCLI (EKS 접속)**


**1. AWS 계정Access Key 설정**


**$ aws configure**


**2. Kubectl 사용을위한Kubeconfig 설정**


##### **05 .**

Terraform을
활용한AWS EKS
생성



**$ aws eks update-kubeconfig --region <Region명> --name <EKS명>**


6


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-59-full.png)

**명령어모음‒ Kubectl (컨테이너POD 배포)**


**1. 예제코드> daemonset.yaml 배포**


**$ kubectl create ‒f daemonset.yaml**


**2. 예제코드> deployment.yaml 배포**


**$ kubectl create ‒f deployment.yaml**


**3. 정상배포확인**


**$ kubectl get ds**


**$ kubectl get deploy**


**$ kubectl get po**


7


##### **05 .**

Terraform을
활용한AWS EKS
생성


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-60-full.png)

**명령어모음‒ Terraform (EKS 삭제)**


**1. Terraform 프로비저닝적용삭제코드검증(Dry Run)**


**$ terraform plan --destroy**


**2. Terraform 프로비저닝적용삭제수행(Run)**


**$ terraform destroy**


8


##### **05 .**

Terraform을
활용한AWS EKS
생성


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-61-full.png)
### **2 Terraform을활용한AWS EKS 생성**

**06 Terraformer를활용한AWS EKS 관리**


1


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-62-full.png)
##### **AWS 네트워크및EKS 구성도(실습환경) 06 .**

Terraformer를
활용한AWS EKS
관리


Internet


User


AWS Cloud





![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-62-0.png)







S3 Bucket
(Terraform State)


DynamoDB
(Terraform Lock)














|Col1|Availability Zone (ap-northeast-2a)|Col3|Col4|Col5|Availability Zone (ap-northeast-2c)|Col7|
|---|---|---|---|---|---|---|
|V|PC (Primary : 172.31.0.0/16)<br>Public subnet1 (172.31.0.0/20)<br>EKS Cluster<br>POD1<br>(Container)<br>POD2<br>(Container)<br>EKS Worker Node|PC (Primary : 172.31.0.0/16)<br>Public subnet1 (172.31.0.0/20)<br>EKS Cluster<br>POD1<br>(Container)<br>POD2<br>(Container)<br>EKS Worker Node|PC (Primary : 172.31.0.0/16)<br>Public subnet1 (172.31.0.0/20)<br>EKS Cluster<br>POD1<br>(Container)<br>POD2<br>(Container)<br>EKS Worker Node|Internet gateway<br>Router|Public subnet3 (172.31.32.0/20)<br><br>POD1<br>(Container)<br>POD2<br>(Container)<br><br>EKS Worker Node||
|V|PC (Primary : 172.31.0.0/16)<br>Public subnet1 (172.31.0.0/20)<br>EKS Cluster<br>POD1<br>(Container)<br>POD2<br>(Container)<br>EKS Worker Node|EKS Cluster<br>POD1<br>(Container)<br>POD2<br>(Container)<br>EKS Worker Node|EKS Cluster<br>POD1<br>(Container)<br>POD2<br>(Container)<br>EKS Worker Node||POD1<br>(Container)<br>POD2<br>(Container)<br><br>EKS Worker Node|POD1<br>(Container)<br>POD2<br>(Container)<br><br>EKS Worker Node|
|V|PC (Primary : 172.31.0.0/16)<br>Public subnet1 (172.31.0.0/20)<br>EKS Cluster<br>POD1<br>(Container)<br>POD2<br>(Container)<br>EKS Worker Node|EKS Cluster<br>POD1<br>(Container)<br>POD2<br>(Container)<br>EKS Worker Node|EKS Worker Node|EKS Node Group1|||
|V|PC (Primary : 172.31.0.0/16)<br>Public subnet1 (172.31.0.0/20)<br>EKS Cluster<br>POD1<br>(Container)<br>POD2<br>(Container)<br>EKS Worker Node|EKS Cluster<br>POD1<br>(Container)<br>POD2<br>(Container)<br>EKS Worker Node|EKS Worker Node||||
|V|PC (Primary : 172.31.0.0/16)<br>Public subnet1 (172.31.0.0/20)<br>EKS Cluster<br>POD1<br>(Container)<br>POD2<br>(Container)<br>EKS Worker Node|EKS Cluster<br>POD1<br>(Container)<br>POD2<br>(Container)<br>EKS Worker Node||EKS Node Group2|EKS Worker Node|EKS Worker Node|
|V|PC (Primary : 172.31.0.0/16)<br>Public subnet1 (172.31.0.0/20)<br>EKS Cluster<br>POD1<br>(Container)<br>POD2<br>(Container)<br>EKS Worker Node|EKS Cluster<br>POD1<br>(Container)<br>POD2<br>(Container)<br>EKS Worker Node|||||
|V|PC (Primary : 172.31.0.0/16)<br>Public subnet1 (172.31.0.0/20)<br>EKS Cluster<br>POD1<br>(Container)<br>POD2<br>(Container)<br>EKS Worker Node|EKS Cluster<br>POD1<br>(Container)<br>POD2<br>(Container)<br>EKS Worker Node|||||
|V||||2|||


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-63-full.png)

**Terraform Backend 소개**

![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-63-0.png)


출처: https://medium.com/clarusway/how-to-use-s3-backend-with-a-locking-feature-in-terraform-to-collaborate-more-efficiently-fa0ea70cf359


3


##### **06 .**

Terraformer를
활용한AWS EKS
관리


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-64-full.png)

**Terraformer 소개**

![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-64-0.png)


출처: https://arivictor.medium.com/turn-your-gcp-project-into-terraform-with-terraformer-cli-eeec36cbe0d8


4


##### **06 .**

Terraformer를
활용한AWS EKS
관리


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-65-full.png)

**사전준비사항**


**1. Terraform으로** **EKS까지** **프로비저닝** **완료**


**2. 로컬PC에서** **Kubectl로** **EKS 접속** **가능한수준까지준비**


**3. 로컬PC에** **Terraformer 설치**


5


##### **06 .**

Terraformer를
활용한AWS EKS
관리


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-66-full.png)

**실습내용**


**순서**


**1. AWS내Terraform Backend 저장소** **생성**


##### **06 .**

Terraformer를
활용한AWS EKS
관리



**2. Terraformer를활용한기존EKS Autoscaling 자원대상IaC 코드추출**


**3.**
**추출IaC 코드를활용한** **2번째EKS NodeGroup 생성및확인**


**4. Terraformer를활용한기존** **AWS 네트워크** **자원대상IaC 코드추출**


**5.**
**추출IaC 코드를활용한** **Terraform 상태및형상파일에저장, 관리**


**실습예제코드경로**


**>**
**Chapter02** **Ch02_06-terraformer-eks**


6


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-67-full.png)

**사전준비- Terraformer 설치방법(Mac OS 및Windows)**


**Mac OS 설치명령어**


**$ brew install terraformer**


**Windows 설치명령어**


**1. 다음URL에서exe 파일다운로드**


**https://github.com/GoogleCloudPlatform/terraformer/releases**


**2. 다운로드한exe 파일을실행가능위치에두고실행**


7


##### **06 .**

Terraformer를
활용한AWS EKS
관리


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-68-full.png)

**Terraformer 설치방법‒ Linux**


**설치명령어**


**$ export PROVIDER={all,google,aws,kubernetes}**


**$ curl -LO**


##### **06 .**

Terraformer를
활용한AWS EKS
관리



**https://github.com/GoogleCloudPlatform/terraformer/releases/download/$(curl -s**


**https://api.github.com/repos/GoogleCloudPlatform/terraformer/releases/latest |**


**grep tag_name | cut -d '"' -f 4)/terraformer-${PROVIDER}-linux-amd64**


**$ chmod +x terraformer-${PROVIDER}-linux-amd64**


**$ sudo mv terraformer-${PROVIDER}-linux-amd64 /usr/local/bin/terraformer**


8


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-69-full.png)

**1. AWS내Terraform Backend 저장소생성**


**1. 로컬에있는Terraform 상태파일을S3 Backend Bucket으로전송**


##### **06 .**

Terraformer를
활용한AWS EKS
관리



**$ aws s3 cp terraform.state s3://<S3 Backend Bucket명>/<저장할파일명>**


**2. Terraform 상태파일내오브젝트현황확인**


**$ terraform state list**


**3. Terraformer로AWS 추출가능한대상확인**


**- 참고링크:**


**https://github.com/GoogleCloudPlatform/terraformer/blob/master/docs/aws.md**


9


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-70-full.png)

**2. Terraformer를활용한기존EKS Autoscaling 자원대상IaC 코드추출**


**1. Terraformer를활용한기존EKS Autoscaling 자원대상IaC 코드추출**


##### **06 .**

Terraformer를
활용한AWS EKS
관리



**$ terraformer import aws --regions=<리전명> --resources=<자원명> --path-pattern=**


**<추출한파일저장디렉토리명>**


**2. 추출된Terraform 상태파일내오브젝트현황확인**


**$ terraform state list**


**3. 추출Terraform 상태파일을기존Terraform Backend 상태파일에Import 방법**


**$ terraform state mv -state-out=<기존Terraform Backend 상태파일저장경로> <추출**


**Terraform Object명> <Import되서저장될Terraform Object명>**


10


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-71-full.png)

**3. 추출IaC 코드를활용한2번째EKS NodeGroup 생성및확인**


**1. 로컬에있는Terraform 상태파일을S3 Backend Bucket으로업로드**


**$ aws s3 cp terraform.state s3://<S3 Backend Bucket명>/<업로드할파일명>**


**2. 초기화전AWS Provider로전환**


##### **06 .**

Terraformer를
활용한AWS EKS
관리



**$ terraform state replace-provider -auto-approve registry.terraform.io/-/aws**


**hashicorp/aws**


**3. 프로비저닝을통한생성및확인**


**$ terraform init**


**$ terraform plan**


**$ terraform apply**


11


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-72-full.png)

**4. Terraformer를활용한기존AWS 네트워크자원대상IaC 코드추출#1**


**1. S3 Backend Bucket에있는Terraform 상태파일을로컬로다운로드**


##### **06 .**

Terraformer를
활용한AWS EKS
관리



**$ aws s3 cp s3://<S3 Backend Bucket명>/<저장된파일명> <로컬의다운로드위치>**


**2. Terraformer를활용한기존EKS Autoscaling 자원대상IaC 코드추출**


**$ terraformer import aws --regions=<리전명> --resources=<자원명> --path-pattern=**


**<추출한파일저장디렉토리명>**


12


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-73-full.png)

**4.**
**Terraformer를활용한기존AWS 네트워크자원대상IaC 코드추출#2**


**3. 추출된Terraform 상태파일내오브젝트현황확인**


**$ terraform state list**


##### **06 .**

Terraformer를
활용한AWS EKS
관리



**4. 추출Terraform 상태파일을기존Terraform Backend 상태파일에Import 방법**


**$ terraform state mv -state-out=<기존Terraform Backend 상태파일저장경로> <추출**


**Terraform Object명> <Import되서저장될Terraform Object명>**


13


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-74-full.png)

**5. 추출IaC 코드를활용한Terraform 상태및형상파일에저장, 관리**


**1. 로컬에있는Terraform 상태파일을S3 Backend Bucket으로업로드**


**$ aws s3 cp terraform.state s3://<S3 Backend Bucket명>/<업로드할파일명>**


**2. 초기화전AWS Provider로전환**


##### **06 .**

Terraformer를
활용한AWS EKS
관리



**$ terraform state replace-provider -auto-approve registry.terraform.io/-/aws**


**hashicorp/aws**


**3. 프로비저닝을통한생성및확인**


**$ terraform init**


**$ terraform plan**


**$ terraform apply**


14


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-75-full.png)
### **3 AWS EKS 기본Plugin 구성방법**

**01 AWS EKS 기본설정방법소개**


1


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-76-full.png)
###### **AWS EKS 기본Plugin 구성방법**

**1.**
**AWS EKS 기본설정방법소개**


**2.**
**[실습] EKS Node 및POD IP 대역분리(Secondary CIDR) 적용**


**3.** **AWS ALB Controller**
**[실습]** **를활용한** **생성**
**Ingress ALB**


**4. [실습] AWS ALB Controller를활용한** **Service NLB 생성**


**5.** **AWS EBS CSI Driver**
**[실습]** **를활용한** **Block Storage PV 생성**


**6.**
**[실습] AWS EFS CSI Driver를활용한** **File Storage PV 생성**


**7. [실습] Cluster Autoscaler를활용한** **EKS노드오토스케일링**


2


##### **01 .**

AWS EKS 기본
설정방법소개


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-77-full.png)

**AWS EKS 기본설정**


##### **01 .**

AWS EKS 기본
설정방법소개



![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-77-0.png)











3


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-78-full.png)

**EKS Node 및POD IP 대역분리(Secondary CIDR) 적용**

![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-78-0.png)


출처: https://www.arhea.net/posts/2020-06-19-amazon-eks-secondary-cidr.html


4


##### **01 .**

AWS EKS 기본
설정방법소개


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-79-full.png)

**AWS ALB Controller를활용한Ingress ALB 생성**

![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-79-0.png)


출처: https://aws.amazon.com/ko/blogs/opensource/kubernetes-ingress-aws-alb-ingress-controller/


5


##### **01 .**

AWS EKS 기본
설정방법소개


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-80-full.png)

**AWS ALB Controller를활용한Service NLB 생성**

![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-80-0.png)


출처: https://medium.com/awesome-cloud/aws-difference-between-application-load-balancer-and-network-load-balancer-cb8b6cd296a4


6


##### **01 .**

AWS EKS 기본
설정방법소개


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-81-full.png)

**AWS EBS CSI Driver를활용한Block Storage PV 생성**

![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-81-0.png)


출처: https://www.inovex.de/de/blog/kubernetes-storage-volume-cloning-ephemeral-inline-volumes-snapshots/


7


##### **01 .**

AWS EKS 기본
설정방법소개


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-82-full.png)

**AWS EFS CSI Driver를활용한File Storage PV 생성**

![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-82-0.png)


출처: https://docs.aws.amazon.com/prescriptive-guidance/latest/patterns/run-stateful-workloads-with
persistent-data-storage-by-using-amazon-efs-on-amazon-eks-with-aws-fargate.html 8


##### **01 .**

AWS EKS 기본
설정방법소개


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-83-full.png)

**Cluster Autoscaler를활용한EKS노드오토스케일링**

![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-83-0.png)


출처: https://aws.github.io/aws-eks-best-practices/cluster-autoscaling/


9


##### **01 .**

AWS EKS 기본
설정방법소개


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-84-full.png)
### **3 AWS EKS 기본Plugin 구성방법**

**02**
**EKS Node 및POD IP 대역분리(Secondary CIDR) 적용**


1


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-85-full.png)
##### **AWS 네트워크및EKS 구성도(VPC Secondary CIDR 적용) 02 .**

EKS Node 및
POD IP 대역
분리(Secondary
CIDR) 적용

Internet


User


AWS Cloud



S3 Bucket
(Terraform State)


DynamoDB
(Terraform Lock)


















|Col1|Availability Zone (ap-northeast-2a)|Col3|Col4|Col5|Col6|Availability Zone (ap-northeast-2c)|Col8|
|---|---|---|---|---|---|---|---|
|V|PC (Primary : 172.31.0.0/16, 100.64.0.0/16)<br>public-subnet-eks-pods-a<br>(100.64.0.0/19)<br>EKS Cluster<br>E<br>E<br>EKS Worker Node<br>public-subnet1 (172.31.0.0/20)<br>EKS<br>POD2<br>(Container)<br>POD1<br>(Container)|PC (Primary : 172.31.0.0/16, 100.64.0.0/16)<br>public-subnet-eks-pods-a<br>(100.64.0.0/19)<br>EKS Cluster<br>E<br>E<br>EKS Worker Node<br>public-subnet1 (172.31.0.0/20)<br>EKS<br>POD2<br>(Container)<br>POD1<br>(Container)|PC (Primary : 172.31.0.0/16, 100.64.0.0/16)<br>public-subnet-eks-pods-a<br>(100.64.0.0/19)<br>EKS Cluster<br>E<br>E<br>EKS Worker Node<br>public-subnet1 (172.31.0.0/20)<br>EKS<br>POD2<br>(Container)<br>POD1<br>(Container)|PC (Primary : 172.31.0.0/16, 100.64.0.0/16)<br>public-subnet-eks-pods-a<br>(100.64.0.0/19)<br>EKS Cluster<br>E<br>E<br>EKS Worker Node<br>public-subnet1 (172.31.0.0/20)<br>EKS<br>POD2<br>(Container)<br>POD1<br>(Container)|Internet gateway|public-subnet-eks-pods-c<br>(100.64.32.0/19)<br>1<br>2<br>EKS Worker Node<br>public-subnet3 (172.31.32.0/20)<br>work<br>POD1<br>(Container)<br>POD2<br>(Container)||
|V|PC (Primary : 172.31.0.0/16, 100.64.0.0/16)<br>public-subnet-eks-pods-a<br>(100.64.0.0/19)<br>EKS Cluster<br>E<br>E<br>EKS Worker Node<br>public-subnet1 (172.31.0.0/20)<br>EKS<br>POD2<br>(Container)<br>POD1<br>(Container)|EKS Cluster<br>E<br>E<br>EKS Worker Node<br>public-subnet1 (172.31.0.0/20)<br>EKS<br>POD2<br>(Container)<br>POD1<br>(Container)|EKS Cluster<br>E<br>E<br>EKS Worker Node<br>public-subnet1 (172.31.0.0/20)<br>EKS<br>POD2<br>(Container)<br>POD1<br>(Container)|EKS Cluster<br>E<br>E<br>EKS Worker Node<br>public-subnet1 (172.31.0.0/20)<br>EKS<br>POD2<br>(Container)<br>POD1<br>(Container)|Router|1<br>2<br>EKS Worker Node<br>public-subnet3 (172.31.32.0/20)<br>work<br>POD1<br>(Container)<br>POD2<br>(Container)|1<br>2<br>EKS Worker Node<br>public-subnet3 (172.31.32.0/20)<br>work<br>POD1<br>(Container)<br>POD2<br>(Container)|
|V|PC (Primary : 172.31.0.0/16, 100.64.0.0/16)<br>public-subnet-eks-pods-a<br>(100.64.0.0/19)<br>EKS Cluster<br>E<br>E<br>EKS Worker Node<br>public-subnet1 (172.31.0.0/20)<br>EKS<br>POD2<br>(Container)<br>POD1<br>(Container)|EKS Cluster<br>E<br>E<br>EKS Worker Node<br>public-subnet1 (172.31.0.0/20)<br>EKS<br>POD2<br>(Container)<br>POD1<br>(Container)|EKS Cluster<br>E<br>E<br>EKS Worker Node<br>public-subnet1 (172.31.0.0/20)<br>EKS<br>POD2<br>(Container)<br>POD1<br>(Container)|EKS<br>POD2<br>(Container)<br>POD1<br>(Container)|POD Overlay Net|work<br>POD1<br>(Container)<br>POD2<br>(Container)|work<br>POD1<br>(Container)<br>POD2<br>(Container)|
|V|PC (Primary : 172.31.0.0/16, 100.64.0.0/16)<br>public-subnet-eks-pods-a<br>(100.64.0.0/19)<br>EKS Cluster<br>E<br>E<br>EKS Worker Node<br>public-subnet1 (172.31.0.0/20)<br>EKS<br>POD2<br>(Container)<br>POD1<br>(Container)|EKS Cluster<br>E<br>E<br>EKS Worker Node<br>public-subnet1 (172.31.0.0/20)<br>EKS<br>POD2<br>(Container)<br>POD1<br>(Container)|EKS Cluster<br>E<br>E<br>EKS Worker Node<br>public-subnet1 (172.31.0.0/20)<br>EKS<br>POD2<br>(Container)<br>POD1<br>(Container)|EKS<br>POD2<br>(Container)<br>POD1<br>(Container)||||
|V|PC (Primary : 172.31.0.0/16, 100.64.0.0/16)<br>public-subnet-eks-pods-a<br>(100.64.0.0/19)<br>EKS Cluster<br>E<br>E<br>EKS Worker Node<br>public-subnet1 (172.31.0.0/20)<br>EKS<br>POD2<br>(Container)<br>POD1<br>(Container)|EKS Cluster<br>E<br>E<br>EKS Worker Node<br>public-subnet1 (172.31.0.0/20)<br>EKS<br>POD2<br>(Container)<br>POD1<br>(Container)|E<br>EKS Worker Node|E<br>EKS Worker Node|KS Node Group #|1|1|
|V|PC (Primary : 172.31.0.0/16, 100.64.0.0/16)<br>public-subnet-eks-pods-a<br>(100.64.0.0/19)<br>EKS Cluster<br>E<br>E<br>EKS Worker Node<br>public-subnet1 (172.31.0.0/20)<br>EKS<br>POD2<br>(Container)<br>POD1<br>(Container)|EKS Cluster<br>E<br>E<br>EKS Worker Node<br>public-subnet1 (172.31.0.0/20)<br>EKS<br>POD2<br>(Container)<br>POD1<br>(Container)|E<br>EKS Worker Node|E<br>EKS Worker Node||||
|V|PC (Primary : 172.31.0.0/16, 100.64.0.0/16)<br>public-subnet-eks-pods-a<br>(100.64.0.0/19)<br>EKS Cluster<br>E<br>E<br>EKS Worker Node<br>public-subnet1 (172.31.0.0/20)<br>EKS<br>POD2<br>(Container)<br>POD1<br>(Container)|EKS Cluster<br>E<br>E<br>EKS Worker Node<br>public-subnet1 (172.31.0.0/20)<br>EKS<br>POD2<br>(Container)<br>POD1<br>(Container)|E|E|KS Node Group #|2<br>EKS Worker Node|2<br>EKS Worker Node|
|V|PC (Primary : 172.31.0.0/16, 100.64.0.0/16)<br>public-subnet-eks-pods-a<br>(100.64.0.0/19)<br>EKS Cluster<br>E<br>E<br>EKS Worker Node<br>public-subnet1 (172.31.0.0/20)<br>EKS<br>POD2<br>(Container)<br>POD1<br>(Container)|EKS Cluster<br>E<br>E<br>EKS Worker Node<br>public-subnet1 (172.31.0.0/20)<br>EKS<br>POD2<br>(Container)<br>POD1<br>(Container)|E|E||||
|V|||||2|||


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-86-full.png)

**사전준비사항**


**1. 로컬PC에** **Terraform 설치**


**2. Terraform Backend 구성** **완료**


**3. Terraform State에** **VPC, Subnet, IGW, Route 포함** **완료**


**4. Terraform으로** **EKS까지** **프로비저닝** **완료**


##### **02 .**

EKS Node 및
POD IP 대역
분리(Secondary
CIDR) 적용



**5. Terraform State에** **EKS Cluster, Nodegroup, Autoscaling 포함** **완료**


**6.** **Kubectl로**
**로컬PC에서** **EKS 접속** **가능한수준까지준비**


3


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-87-full.png)

**실습내용**


**순서**


**1.**
**VPC에** **Secondary CIDR 추가**


##### **02 .**

EKS Node 및
POD IP 대역
분리(Secondary
CIDR) 적용



**2.**
**Terraform에** **Secondary CIDR Subnet, Route, Security Group 코드** **추가**


**3. Terraform**
**프로비저닝실행** **및확인**


**4.**
**CRD, ENIConfig 및AWS CNI Config 설정**


**5. EKS**
**Node 수동전환** **및POD에Secondary CIDR 대역IP 할당** **확인**


**실습예제코드경로**


**>**
**Chapter03** **Ch03_02-vpc-secondary-cidr**


4


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-88-full.png)

**1. VPC에Secondary CIDR 추가**


**1. AWS Management Console에서추가**


**- AWS 경로: VPC > 작업** **> CIDR 편집** **> 새IPv4 CIDR 추가**


**- 설정내역: 100.64.0.0/16**


5


##### **02 .**

EKS Node 및
POD IP 대역
분리(Secondary
CIDR) 적용


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-89-full.png)

**2. Terraform에Secondary CIDR Subnet, Route, Security Group 코드추가**


**1. Terraform에Secondary CIDR Subnet 설정**


**- 예제코드경로: Ch03_02-vpc-secondary-cidr > terraform-codes > subnet.tf**


**2. Terraform에Secondary CIDR Route Table 설정**


##### **02 .**

EKS Node 및
POD IP 대역
분리(Secondary
CIDR) 적용




**- 예제코드경로: Ch03_02-vpc-secondary-cidr > terraform-codes > route_table.tf**


**3. Terraform에Secondary CIDR Security Group 설정**


**- 예제코드경로: Ch03_02-vpc-secondary-cidr > terraform-codes > security-group.tf**


6


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-90-full.png)

**3. Terraform 프로비저닝실행및확인#1**


**1. 프로비저닝을통한생성및확인**


**$ terraform init**


**$ terraform plan**


**$ terraform apply**


##### **02 .**

EKS Node 및
POD IP 대역
분리(Secondary
CIDR) 적용



7


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-91-full.png)

**3. Terraform 프로비저닝실행및확인#2**


**2. AWS Management Console에서확인**


**- Subnet : VPC >**
**서브넷**


**VPC >**

**- Routing Table :** **라우팅테이블**


**- Security Group : EC2 > 보안그룹**


8


##### **02 .**

EKS Node 및
POD IP 대역
분리(Secondary
CIDR) 적용


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-92-full.png)

**4. CRD, ENIConfig 및AWS CNI Config 설정**


**1. CRD 및ENIConfig를EKS Cluster에배포**


**- 예제코드경로: Ch03_02-vpc-secondary-cidr > k8s-manifests > eni-configs**


**- 배포명령어: kubectl create ‒f .**


**2. AWS CNI Config 설정(EKS)**


##### **02 .**

EKS Node 및
POD IP 대역
분리(Secondary
CIDR) 적용




**- 커스텀CNI 플러그인구성: kubectl set env daemonset aws-node -n kube-system**


**AWS_VPC_K8S_CNI_CUSTOM_NETWORK_CFG=true**


**- Worker Node 식별용ENIConfig Label 추가: kubectl set env daemonset aws-node -n**


**kube-system ENI_CONFIG_LABEL_DEF=failure-domain.beta.kubernetes.io/zone**


9


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-93-full.png)

**5. EKS Node 수동전환및POD에Secondary CIDR 대역IP 할당확인#1**


**1. AWS Management Console에서EKS Node Group 수동전환**


**- Node Group 설정경로: EKS > <EKS명> > 구성** **> 컴퓨팅** **> 노드그룹선택** **> 편집**


**-**
**최대크기및원하는크기를2로변경, 변경후변경사항저장**


**2. 추가Worker Node 생성확인및POD 상태확인명령어(EKS)**


**- Worker Node 생성확인명령어: kubectl get nodes**


**- POD 상태확인명령어: kubectl get pods**


**3. POD Restart 및Scale out 명령어(EKS)**


**- POD Restart 명령어: kubectl rollout restart deploy <Deployment명>**


##### **02 .**

EKS Node 및
POD IP 대역
분리(Secondary
CIDR) 적용




**- POD Scale out 명령어: kubectl scale deploy <Deployment명> --replicas=<증가수량>**


10


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-94-full.png)

**5. EKS Node 수동전환및POD에Secondary CIDR 대역IP 할당확인#2**


**4. POD에Secondary CIDR IP 할당확인명령어(EKS)**


**- POD IP 할당확인명령어: kubectl get pods ‒o wide**


##### **02 .**

EKS Node 및
POD IP 대역
분리(Secondary
CIDR) 적용



**5. AWS Management Console에서EKS Node Group 수동전환마무리작업**


**- Node Group 설정경로: EKS > <EKS명> > 구성** **> 컴퓨팅** **> 노드그룹선택** **> 편집**


**-**
**최대크기및원하는크기를1로변경, 변경후변경사항저장**


**- (여기서Secondary CIDR이인식이안되는초기Worker Node는회수, 삭제됨)**


11


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-95-full.png)
### **3 AWS EKS 기본Plugin 구성방법**

**03**
**AWS ALB Controller를활용한Ingress ALB 생성**


1


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-96-full.png)
##### **AWS 네트워크및EKS 구성도(Ingress ALB 적용) 03 .**

AWS ALB
Controller를
활용한Ingress


Inbound Traffic

ALB 생성



Inbound Traffic



Internet



Outbound Traffic



User



Registry














|AWS Cloud<br>VPC (<br>S3 Bucket<br>(Terraform State)<br>E<br>Cl<br>DynamoDB<br>(Terraform Lock)<br>API Se|Col2|Col3|Availability Zone (ap-northeast-2a)|Col5|Col6|Col7|Availability Zone (ap-northeast-2c)|Col9|Col10|
|---|---|---|---|---|---|---|---|---|---|
|AWS Cloud<br>VPC (<br>E<br>Cl<br>S3 Bucket<br>(Terraform State)<br>DynamoDB<br>(Terraform Lock)<br>API Se|VPC (<br>E<br>Cl<br>API Se|VPC (<br>E<br>Cl<br>API Se|Primary : 172.31.0.0/16)<br>Public subnet1 (172.31.0.0/20)<br>Bastion Server|Primary : 172.31.0.0/16)<br>Public subnet1 (172.31.0.0/20)<br>Bastion Server|Primary : 172.31.0.0/16)<br>Public subnet1 (172.31.0.0/20)<br>Bastion Server|Internet gateway<br>Router|Private subnet3 (172.31.48.0/20)<br>Public subnet3 (172.31.16.0/20)<br>EKS Worker Node<br>POD<br>(Container)<br>NAT gateway<br>POD<br>(Container)|Private subnet3 (172.31.48.0/20)<br>Public subnet3 (172.31.16.0/20)<br>EKS Worker Node<br>POD<br>(Container)<br>NAT gateway<br>POD<br>(Container)||
|AWS Cloud<br>VPC (<br>E<br>Cl<br>S3 Bucket<br>(Terraform State)<br>DynamoDB<br>(Terraform Lock)<br>API Se|VPC (<br>E<br>Cl<br>API Se|VPC (<br>E<br>Cl<br>API Se|Primary : 172.31.0.0/16)<br>Public subnet1 (172.31.0.0/20)<br>Bastion Server|||ALB Listener||||
|AWS Cloud<br>VPC (<br>E<br>Cl<br>S3 Bucket<br>(Terraform State)<br>DynamoDB<br>(Terraform Lock)<br>API Se|VPC (<br>E<br>Cl<br>API Se|VPC (<br>E<br>Cl<br>API Se|Primary : 172.31.0.0/16)<br>Public subnet1 (172.31.0.0/20)<br>Bastion Server|||Application<br>Load Balancer|Application<br>Load Balancer|Application<br>Load Balancer|Application<br>Load Balancer|
|AWS Cloud<br>VPC (<br>E<br>Cl<br>S3 Bucket<br>(Terraform State)<br>DynamoDB<br>(Terraform Lock)<br>API Se|VPC (<br>E<br>Cl<br>API Se|E<br>Cl<br>API Se|KS<br>uster<br><br>Private subnet1 (172.31.32.0/20)<br>EKS Worker Node<br>POD<br>(Container)<br>rver<br>POD<br>(Container)|KS<br>uster<br><br>Private subnet1 (172.31.32.0/20)<br>EKS Worker Node<br>POD<br>(Container)<br>rver<br>POD<br>(Container)|KS<br>uster<br><br>Private subnet1 (172.31.32.0/20)<br>EKS Worker Node<br>POD<br>(Container)<br>rver<br>POD<br>(Container)||Private subnet3 (172.31.48.0/20)<br>EKS Worker Node<br>POD<br>(Container)<br>POD<br>(Container)|Private subnet3 (172.31.48.0/20)<br>EKS Worker Node<br>POD<br>(Container)<br>POD<br>(Container)|Private subnet3 (172.31.48.0/20)<br>EKS Worker Node<br>POD<br>(Container)<br>POD<br>(Container)|
|AWS Cloud<br>VPC (<br>E<br>Cl<br>S3 Bucket<br>(Terraform State)<br>DynamoDB<br>(Terraform Lock)<br>API Se|VPC (<br>E<br>Cl<br>API Se|E<br>Cl<br>API Se|KS<br>uster<br><br>Private subnet1 (172.31.32.0/20)<br>EKS Worker Node<br>POD<br>(Container)<br>rver<br>POD<br>(Container)|POD<br>(Container)<br>POD<br>(Container)|POD<br>(Container)<br>POD<br>(Container)|EKS Namespace<br>Ingress<br>Service|POD<br>(Container)<br>POD<br>(Container)|POD<br>(Container)<br>POD<br>(Container)|POD<br>(Container)<br>POD<br>(Container)|
|AWS Cloud<br>VPC (<br>E<br>Cl<br>S3 Bucket<br>(Terraform State)<br>DynamoDB<br>(Terraform Lock)<br>API Se|VPC (<br>E<br>Cl<br>API Se|E<br>Cl<br>API Se|KS<br>uster<br><br>Private subnet1 (172.31.32.0/20)<br>EKS Worker Node<br>POD<br>(Container)<br>rver<br>POD<br>(Container)|POD<br>(Container)<br>POD<br>(Container)|POD<br>(Container)<br>POD<br>(Container)|||||
|AWS Cloud<br>VPC (<br>E<br>Cl<br>S3 Bucket<br>(Terraform State)<br>DynamoDB<br>(Terraform Lock)<br>API Se|VPC (<br>E<br>Cl<br>API Se|E<br>Cl<br>API Se|KS<br>uster<br><br>Private subnet1 (172.31.32.0/20)<br>EKS Worker Node<br>POD<br>(Container)<br>rver<br>POD<br>(Container)|EKS Worker Node|EKS Worker Node|EKS Node Group1|EKS Worker Node|EKS Worker Node|EKS Worker Node|
|AWS Cloud<br>VPC (<br>E<br>Cl<br>S3 Bucket<br>(Terraform State)<br>DynamoDB<br>(Terraform Lock)<br>API Se|VPC (<br>E<br>Cl<br>API Se|E<br>Cl<br>API Se|KS<br>uster<br><br>Private subnet1 (172.31.32.0/20)<br>EKS Worker Node<br>POD<br>(Container)<br>rver<br>POD<br>(Container)|EKS Worker Node|EKS Worker Node|||||
|||||||||||


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-97-full.png)

**사전준비사항#1**


**1. Terraform Backend 구성**


**- S3 Bucket 및DynamoDB Table 생성**


**2. AWS Network 구성**


**- VPC 1개, Internet Gateway 1개**


**- Public Subnet 2개, Private Subnet 2개**


**- Public Subnet Route Table 2개**


**3. AWS EKS 구성**


**- EKS Cluster 1개, EKS NodeGroup1개(2개Worker Node 생성)**


3


##### **03 .**

AWS ALB
Controller를
활용한Ingress
ALB 생성


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-98-full.png)
##### **사전준비사항#2 03 .**

AWS ALB
Controller를
활용한Ingress
ALB 생성

**4. Terraform에Elastic IP 및NAT Gateway 설정**


**- 코드경로:** **Ch03_03-ingress-alb > terraform-codes > eip.tf**


**Ch03_03-ingress-alb > terraform-codes > nat_gateway.tf**


**5. Terraform에Route Table 설정(Private Subnet 2개)**


**- 코드경로: Ch03_03-ingress-alb > terraform-codes > route_tables.tf**


**Ch03_03-ingress-alb > terraform-codes > route_table_associations.tf**


4


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-99-full.png)

**사전준비시필수적용사항**


**1. 전체Subnet 적용Tag**


**>**
**kubernetes.io/cluster/<EKS Cluster명**

**- Key :**


**- Value : shared**


**2. Public Subnet만적용하는Tag**


**kubernetes.io/role/elb**

**- Key :**


**- Value : 1**


**3. Bastion 접속용Key Pair 생성(.pem)**


**- Key Pair명: test-kp-bastion**


5


##### **03 .**

AWS ALB
Controller를
활용한Ingress
ALB 생성


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-100-full.png)

**실습내용**


**순서**


##### **03 .**

AWS ALB
Controller를
활용한Ingress
ALB 생성



**1.** **Terraform에** **Bastion(EC2), Security Group, IAM Role 코드추가및프로비저닝**


**2.** **Bastion 접속, EKS Kubeconfig 설정, Kubectl로EKS 접속**


**3.** **Namespace 구성및예제** **Deployments 배포(K8s Manifest)**


**4.** **AWS ALB Controller 설치**


**5.** **Ingress Annotation 설정및** **Ingress 배포**


**6.** **Application Load Balancer(ALB) 자동생성확인및** **로컬PC 웹브라우저로접속확인**


**실습예제코드경로**


**>**
**Chapter03** **Ch03_03-ingress-alb**


6


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-101-full.png)
##### **1. Terraform에Bastion(EC2), Security Group, IAM Role 코드추가및프로비저닝 03 .**

AWS ALB
Controller를
활용한Ingress
ALB 생성

**1.1 Terraform에Bastion Server (AWS EC2 VM) 설정**


**- 예제코드경로: Ch03_03-ingress-alb > terraform-codes > ec2.tf**


**1.2 Terraform에Security Group 설정**


**- 예제코드경로: Ch03_03-ingress-alb > terraform-codes > security-groups.tf**


**1.3 Terraform에EC2 VM용IAM Instance Role 설정**


**- 예제코드경로: Ch03_03-ingress-alb > terraform-codes > iam-roles.tf**


7


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-102-full.png)

**2. Bastion 접속, EKS Kubeconfig 설정, Kubectl로EKS 접속**


**2.1 Bastion 접속명령어**


**$ ssh -i <생성한Key pair(.pem)> ubuntu@<Bastion Public DNS 주소>**


**2.2 EKS Kubeconfig 설정**


##### **03 .**

AWS ALB
Controller를
활용한Ingress
ALB 생성



**$ aws eks update-kubeconfig --region <Region명> --name <EKS Cluster명>**


**2.3 Kubectl로EKS 접속**


**$ kubectl get no**


**$ kubectl get po -A**


8


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-103-full.png)

**3. Namespace 구성및예제Deployments 배포(K8s Manifest)**


**3.1 Namespace 구성명령어**


**$ kubectl create namespace test-ingress-alb**


**3.2 예제Deployments 배포**


**- K8s Manifest 경로: Ch03_03-ingress-alb > k8s-manifests**


##### **03 .**

AWS ALB
Controller를
활용한Ingress
ALB 생성




**- K8s Manifest 배포명령어: kubectl create ‒f test-deployment-game.yaml**


9


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-104-full.png)

**4. AWS ALB Controller 설치#1**


**4.1 eksctl 툴설치명령어(리눅스)**


**$ curl --silent --location**


##### **03 .**

AWS ALB
Controller를
활용한Ingress
ALB 생성



**"https://github.com/weaveworks/eksctl/releases/latest/download/eksctl**


**_$(uname -s)_amd64.tar.gz" | tar xz -C /tmp**


**$ sudo mv /tmp/eksctl /usr/local/bin**


**4.2 설치확인**


**$ eksctl version**


10


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-105-full.png)

**4. AWS ALB Controller 설치#2**


**4.3 IAM Policy를Terraform으로생성**


##### **03 .**

AWS ALB
Controller를
활용한Ingress
ALB 생성




**>** **>**

**- IAM Policy 경로: Ch03_03-ingress-alb** **iam-policy** **alb-iam-policy.json**


**- 복사, 붙여넣기경로: Ch03_03-ingress-alb > terraform-codes > iam-roles.tf**


**4.4 terraform 명령어실행**


**$ terraform init**


**$ terraform plan**


**$ terraform apply**


11


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-106-full.png)

**4. AWS ALB Controller 설치#3**


**4.5 IAM Role 및EKS내서비스어카운트생성**


**$ eksctl create iamserviceaccount \**


**--cluster=<EKS Cluster명> \**


**--namespace=kube-system \**


**--name=aws-load-balancer-controller \**


##### **03 .**

AWS ALB
Controller를
활용한Ingress
ALB 생성



**--attach-policy-arn=arn:aws:iam::<AWS 계정ID>:policy/AWSLoadBalancerControllerIAMPolicy \**


**--override-existing-serviceaccounts \**


**--approve**


12


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-107-full.png)

**4. AWS ALB Controller 설치#4**


**4.6 cert-manager 배포**


**- K8s Manifest 경로: Ch03_03-ingress-alb > k8s-manifests**


**- K8s Manifest 배포명령어: kubectl create ‒f cert-manager.yaml**


**4.7 AWS ALB Controller 파일설정및배포**


**- K8s Manifest 경로: Ch03_03-ingress-alb > k8s-manifests**


**- 파일설정위치: alb-controller.yaml > --cluster-name=<EKS Cluster명>**


**- K8s Manifest 배포명령어: kubectl create ‒f alb-controller.yaml**


##### **03 .**

AWS ALB
Controller를
활용한Ingress
ALB 생성




**- 배포확인명령어: kubectl get deploy -n kube-system aws-load-balancer-controller**


13


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-108-full.png)

**5. Ingress Annotation 설정및Ingress 배포#1**


**5.1 Ingress Annotation 설정**


**- K8s Manifest 경로: Ch03_03-ingress-alb > k8s-manifests**


**- 파일설정위치: test-ingress.yaml**


**- Ingress Annotation 설정내역**


annotations:


kubernetes.io/ingress.class: alb


alb.ingress.kubernetes.io/scheme: internet-facing


alb.ingress.kubernetes.io/target-type: ip


##### **03 .**

AWS ALB
Controller를
활용한Ingress
ALB 생성



Public Subnet1 ID>, <Public Subnet2 ID>
alb.ingress.kubernetes.io/subnets: <


14


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-109-full.png)

**5. Ingress Annotation 설정및Ingress 배포#2**


**5.2 Ingress 배포**


**- K8s Manifest 경로: Ch03_03-ingress-alb > k8s-manifests**


**- K8s Manifest 배포명령어: kubectl create ‒f test-ingress.yaml**


15


##### **03 .**

AWS ALB
Controller를
활용한Ingress
ALB 생성


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-110-full.png)

**6. Application Load Balancer 자동생성확인및로컬PC 웹브라우저로접속확인#1**


**6.1 Application Load Balancer(ALB) 자동생성확인**


**EC2 >**

**- AWS Managemgnt Console 확인경로:** **로드밸런서**


**- 확인내용**


*** 유형: application**


*** 체계: internet-facing**


*** IP 주소유형: ipv4**


*** 가용영역: <Public Subnet1 ID>, <Public Subnet2 ID>**


16


##### **03 .**

AWS ALB
Controller를
활용한Ingress
ALB 생성


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-111-full.png)

**6. Application Load Balancer 자동생성확인및로컬PC 웹브라우저로접속확인#2**


**6.2 로컬PC 웹브라우저로접속확인**


**- ALB DNS 주소확인: 로컬PC 웹브라우저에서다음의URL로접속확인**


**>:80**
**http://<ALB DNS 주소확인**


17


##### **03 .**

AWS ALB
Controller를
활용한Ingress
ALB 생성


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-112-full.png)
### **3 AWS EKS 기본Plugin 구성방법**

**04 AWS ALB Controller를활용한Service NLB 생성**


1


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-113-full.png)
##### **AWS 네트워크및EKS 구성도(Service NLB 적용) 04 .**

AWS ALB
Controller를
활용한Service


Inbound Traffic

NLB 생성



Inbound Traffic



Internet



Outbound Traffic



User



Registry














|AWS Cloud<br>VPC (<br>S3 Bucket<br>(Terraform State)<br>E<br>Cl<br>DynamoDB<br>(Terraform Lock)<br>API Se|Col2|Col3|Availability Zone (ap-northeast-2a)|Col5|Col6|Col7|Availability Zone (ap-northeast-2c)|Col9|Col10|
|---|---|---|---|---|---|---|---|---|---|
|AWS Cloud<br>VPC (<br>E<br>Cl<br>S3 Bucket<br>(Terraform State)<br>DynamoDB<br>(Terraform Lock)<br>API Se|VPC (<br>E<br>Cl<br>API Se|VPC (<br>E<br>Cl<br>API Se|Primary : 172.31.0.0/16)<br>Public subnet1 (172.31.0.0/20)<br>Bastion Server|Primary : 172.31.0.0/16)<br>Public subnet1 (172.31.0.0/20)<br>Bastion Server|Primary : 172.31.0.0/16)<br>Public subnet1 (172.31.0.0/20)<br>Bastion Server|Internet gateway<br>Router|Private subnet3 (172.31.48.0/20)<br>Public subnet3 (172.31.16.0/20)<br>EKS Worker Node<br>POD<br>(Container)<br>NAT gateway<br>POD<br>(Container)|Private subnet3 (172.31.48.0/20)<br>Public subnet3 (172.31.16.0/20)<br>EKS Worker Node<br>POD<br>(Container)<br>NAT gateway<br>POD<br>(Container)||
|AWS Cloud<br>VPC (<br>E<br>Cl<br>S3 Bucket<br>(Terraform State)<br>DynamoDB<br>(Terraform Lock)<br>API Se|VPC (<br>E<br>Cl<br>API Se|VPC (<br>E<br>Cl<br>API Se|Primary : 172.31.0.0/16)<br>Public subnet1 (172.31.0.0/20)<br>Bastion Server|||NLB Listener||||
|AWS Cloud<br>VPC (<br>E<br>Cl<br>S3 Bucket<br>(Terraform State)<br>DynamoDB<br>(Terraform Lock)<br>API Se|VPC (<br>E<br>Cl<br>API Se|VPC (<br>E<br>Cl<br>API Se|Primary : 172.31.0.0/16)<br>Public subnet1 (172.31.0.0/20)<br>Bastion Server|||Network<br>Load Balancer|Network<br>Load Balancer|Network<br>Load Balancer|Network<br>Load Balancer|
|AWS Cloud<br>VPC (<br>E<br>Cl<br>S3 Bucket<br>(Terraform State)<br>DynamoDB<br>(Terraform Lock)<br>API Se|VPC (<br>E<br>Cl<br>API Se|E<br>Cl<br>API Se|KS<br>uster<br><br>Private subnet1 (172.31.32.0/20)<br>EKS Worker Node<br>POD<br>(Container)<br>rver<br>POD<br>(Container)|KS<br>uster<br><br>Private subnet1 (172.31.32.0/20)<br>EKS Worker Node<br>POD<br>(Container)<br>rver<br>POD<br>(Container)|KS<br>uster<br><br>Private subnet1 (172.31.32.0/20)<br>EKS Worker Node<br>POD<br>(Container)<br>rver<br>POD<br>(Container)||Private subnet3 (172.31.48.0/20)<br>EKS Worker Node<br>POD<br>(Container)<br>POD<br>(Container)|Private subnet3 (172.31.48.0/20)<br>EKS Worker Node<br>POD<br>(Container)<br>POD<br>(Container)|Private subnet3 (172.31.48.0/20)<br>EKS Worker Node<br>POD<br>(Container)<br>POD<br>(Container)|
|AWS Cloud<br>VPC (<br>E<br>Cl<br>S3 Bucket<br>(Terraform State)<br>DynamoDB<br>(Terraform Lock)<br>API Se|VPC (<br>E<br>Cl<br>API Se|E<br>Cl<br>API Se|KS<br>uster<br><br>Private subnet1 (172.31.32.0/20)<br>EKS Worker Node<br>POD<br>(Container)<br>rver<br>POD<br>(Container)|POD<br>(Container)<br>POD<br>(Container)|POD<br>(Container)<br>POD<br>(Container)|EKS Namespace<br>Service|POD<br>(Container)<br>POD<br>(Container)|POD<br>(Container)<br>POD<br>(Container)|POD<br>(Container)<br>POD<br>(Container)|
|AWS Cloud<br>VPC (<br>E<br>Cl<br>S3 Bucket<br>(Terraform State)<br>DynamoDB<br>(Terraform Lock)<br>API Se|VPC (<br>E<br>Cl<br>API Se|E<br>Cl<br>API Se|KS<br>uster<br><br>Private subnet1 (172.31.32.0/20)<br>EKS Worker Node<br>POD<br>(Container)<br>rver<br>POD<br>(Container)|POD<br>(Container)<br>POD<br>(Container)|POD<br>(Container)<br>POD<br>(Container)|||||
|AWS Cloud<br>VPC (<br>E<br>Cl<br>S3 Bucket<br>(Terraform State)<br>DynamoDB<br>(Terraform Lock)<br>API Se|VPC (<br>E<br>Cl<br>API Se|E<br>Cl<br>API Se|KS<br>uster<br><br>Private subnet1 (172.31.32.0/20)<br>EKS Worker Node<br>POD<br>(Container)<br>rver<br>POD<br>(Container)|EKS Worker Node|EKS Worker Node|EKS Node Group1|EKS Worker Node|EKS Worker Node|EKS Worker Node|
|AWS Cloud<br>VPC (<br>E<br>Cl<br>S3 Bucket<br>(Terraform State)<br>DynamoDB<br>(Terraform Lock)<br>API Se|VPC (<br>E<br>Cl<br>API Se|E<br>Cl<br>API Se|KS<br>uster<br><br>Private subnet1 (172.31.32.0/20)<br>EKS Worker Node<br>POD<br>(Container)<br>rver<br>POD<br>(Container)|EKS Worker Node|EKS Worker Node|||||
|||||||||||


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-114-full.png)

**사전준비사항#1**


**1. Terraform Backend 구성**


**- S3 Bucket 및DynamoDB Table 생성**


**2. AWS Network 구성**


**- VPC 1개, Internet Gateway 1개**


**- Public Subnet 2개, Private Subnet 2개**


**- Public Subnet Route Table 2개**


**- NAT Gateway 1개**


**- Private Subnet Route Table 2개**


3


##### **04 .**

AWS ALB
Controller를
활용한Service
NLB 생성


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-115-full.png)

**사전준비사항#2**


**3. Bastion Server구성**


**- ec2 VM 1개, security group 1개**


**- key-pair 1개, iam role 1개**


**4. AWS EKS 구성**


**- EKS Cluster 1개, EKS NodeGroup1개(2개Worker Node 생성)**


**- Bastion Server에서EKS Kubeconfig 설정**


**- Bastion Server에서EKS 접속**


4


##### **04 .**

AWS ALB
Controller를
활용한Service
NLB 생성


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-116-full.png)

**사전준비사항#3**


**5. AWS ALB Controller 설치**


**- IAM Policy 및서비스어카운트생성**


**- cert-manger 설치**


**- AWS ALB Controller 설치**


5


##### **04 .**

AWS ALB
Controller를
활용한Service
NLB 생성


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-117-full.png)

**실습내용**


**순서**


**1.** **Namespace 구성및예제** **Deployments 배포(K8s Manifest)**


**2.** **Service Annotation 설정및** **Service 배포**


##### **04 .**

AWS ALB
Controller를
활용한Service
NLB 생성



**3.** **Network Load Balancer(NLB) 자동생성확인및** **로컬PC 웹브라우저로접속확인**


**실습예제코드경로**


**>**
**Chapter03** **Ch03_04-service-nlb**


6


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-118-full.png)

**1. Namespace 구성및예제Deployments 배포(K8s Manifest)**


**1.1 Namespace 구성명령어**


**$ kubectl create namespace test-service-nlb**


**1.2 예제Deployments 배포**


**- K8s Manifest 경로: Ch03_04-service-nlb > k8s-manifests**


##### **04 .**

AWS ALB
Controller를
활용한Service
NLB 생성




**- K8s Manifest 배포명령어: kubectl create ‒f test-deployment-nginx.yaml**


7


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-119-full.png)

**2. Service Annotation 설정및Service 배포#1**


**2.1 Service Annotation 설정**


**- K8s Manifest 경로: Ch03_04-service-nlb > k8s-manifests**


**- 파일설정위치: test-service.yaml**


**- Service Annotation 설정내역**


annotations:


service.beta.kubernetes.io/aws-load-balancer-type: external


service.beta.kubernetes.io/aws-load-balancer-nlb-target-type: ip


service.beta.kubernetes.io/aws-load-balancer-scheme: internet-facing


##### **04 .**

AWS ALB
Controller를
활용한Service
NLB 생성



service.beta.kubernetes.io /subnets: <Public Subnet1 ID>, <Public Subnet2 ID>


8


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-120-full.png)

**2. Service Annotation 설정및Service 배포#2**


**2.2 Service 배포**


**- K8s Manifest 경로: Ch03_04-service-nlb > k8s-manifests**


**- K8s Manifest 배포명령어: kubectl create ‒f test-service.yaml**


9


##### **04 .**

AWS ALB
Controller를
활용한Service
NLB 생성


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-121-full.png)

**3. Network Load Balancer 자동생성확인및로컬PC 웹브라우저로접속확인#1**


**3.1 Network Load Balancer(NLB) 자동생성확인**


**EC2 >**

**- AWS Managemgnt Console 확인경로:** **로드밸런서**


**- 확인내용**


*** 유형: network**


*** 체계: internet-facing**


*** IP 주소유형: ipv4**


*** 가용영역: <Public Subnet1 ID>, <Public Subnet2 ID>**


10


##### **04 .**

AWS ALB
Controller를
활용한Service
NLB 생성


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-122-full.png)

**3. Network Load Balancer 자동생성확인및로컬PC 웹브라우저로접속확인#2**


**3.2 로컬PC 웹브라우저로접속확인**


**- NLB DNS 주소확인: 로컬PC 웹브라우저에서다음의URL로접속확인**


**>:80**
**http://<NLB DNS 주소확인**


11


##### **04 .**

AWS ALB
Controller를
활용한Service
NLB 생성


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-123-full.png)
### **3 AWS EKS 기본Plugin 구성방법**

**05**
**AWS EBS CSI Driver를활용한Block Storage PV 생성**


1


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-124-full.png)
##### **AWS 네트워크및EKS 구성도(EBS CSI 및Block PV 적용) 05 .**

AWS EBS CSI
Driver를활용한
Block Storage


Inbound Traffic

PV 생성



Inbound Traffic



Internet



Outbound Traffic









Registry









User














|AWS Cloud<br>VPC (<br>EKS<br>API Server|Col2|Col3|Availability Zone (ap-northeast-2a)|Col5|Col6|Col7|Col8|Availability Zone (ap-northeast-2c)|Col10|
|---|---|---|---|---|---|---|---|---|---|
|AWS Cloud<br>VPC (<br>EKS<br>API Server|VPC (<br>EKS<br>API Server|VPC (<br>EKS<br>API Server|Primary : 172.31.0.0/16)<br>Public subnet1 (172.31.0.0/20)<br>Bastion Server|Primary : 172.31.0.0/16)<br>Public subnet1 (172.31.0.0/20)<br>Bastion Server|Primary : 172.31.0.0/16)<br>Public subnet1 (172.31.0.0/20)<br>Bastion Server|Primary : 172.31.0.0/16)<br>Public subnet1 (172.31.0.0/20)<br>Bastion Server|Internet gateway<br>Router|Private subnet3 (172.31.48.0/20)<br>Public subnet3 (172.31.16.0/20)<br>EKS Worker Node<br>Service2<br>NAT gateway<br>POD2<br>(Container)<br>aim<br>Storage Class<br>AWS EBS Volume<br>Attach<br>Mount<br>Claim Info<br>n<br>Volume Info<br>s Info||
|AWS Cloud<br>VPC (<br>EKS<br>API Server|VPC (<br>EKS<br>API Server|EKS<br>API Server|Cluster<br><br>Private subnet1 (172.31.32.0/20)<br>EKS Worker Node<br>POD1<br>(Container)<br>Service1|Cluster<br><br>Private subnet1 (172.31.32.0/20)<br>EKS Worker Node<br>POD1<br>(Container)<br>Service1|Cluster<br><br>Private subnet1 (172.31.32.0/20)<br>EKS Worker Node<br>POD1<br>(Container)<br>Service1|Cluster<br><br>Private subnet1 (172.31.32.0/20)<br>EKS Worker Node<br>POD1<br>(Container)<br>Service1||Private subnet3 (172.31.48.0/20)<br>EKS Worker Node<br>Service2<br>POD2<br>(Container)<br>aim<br>Storage Class<br><br>Mount<br>Claim Info<br>n<br>Volume Info<br>s Info|Private subnet3 (172.31.48.0/20)<br>EKS Worker Node<br>Service2<br>POD2<br>(Container)<br>aim<br>Storage Class<br><br>Mount<br>Claim Info<br>n<br>Volume Info<br>s Info|
|AWS Cloud<br>VPC (<br>EKS<br>API Server|VPC (<br>EKS<br>API Server|EKS<br>API Server|Cluster<br><br>Private subnet1 (172.31.32.0/20)<br>EKS Worker Node<br>POD1<br>(Container)<br>Service1|Cluster<br><br>Private subnet1 (172.31.32.0/20)<br>EKS Worker Node<br>POD1<br>(Container)<br>Service1|POD1<br>(Container)<br>Service1|POD1<br>(Container)<br>Service1|EKS Namespace<br>Persistent Volume Cl<br>Binding|Service2<br>POD2<br>(Container)<br>aim<br>Claim Info|Service2<br>POD2<br>(Container)<br>aim<br>Claim Info|
|AWS Cloud<br>VPC (<br>EKS<br>API Server|VPC (<br>EKS<br>API Server|EKS<br>API Server|Cluster<br><br>Private subnet1 (172.31.32.0/20)<br>EKS Worker Node<br>POD1<br>(Container)<br>Service1|Cluster<br><br>Private subnet1 (172.31.32.0/20)<br>EKS Worker Node<br>POD1<br>(Container)<br>Service1|POD1<br>(Container)<br>Service1|POD1<br>(Container)<br>Service1|Persistent Volume<br><br>Clas|Persistent Volume<br><br>Clas|Persistent Volume<br><br>Clas|
|AWS Cloud<br>VPC (<br>EKS<br>API Server|VPC (<br>EKS<br>API Server|EKS<br>API Server|Cluster<br><br>Private subnet1 (172.31.32.0/20)<br>EKS Worker Node<br>POD1<br>(Container)<br>Service1|EKS Worker Node|EKS Worker Node|EKS Worker Node|EKS Node Group1<br>Abstractio|EKS Worker Node<br>n<br>Volume Info|EKS Worker Node<br>n<br>Volume Info|
|AWS Cloud<br>VPC (<br>EKS<br>API Server|VPC (<br>EKS<br>API Server|EKS<br>API Server|Cluster<br><br>Private subnet1 (172.31.32.0/20)<br>EKS Worker Node<br>POD1<br>(Container)<br>Service1|EKS Worker Node|EKS Worker Node|||||
|AWS Cloud<br>VPC (<br>EKS<br>API Server|VPC (<br>EKS<br>API Server|EKS<br>API Server|Cluster<br><br>Private subnet1 (172.31.32.0/20)<br>EKS Worker Node<br>POD1<br>(Container)<br>Service1|EKS Worker Node|EKS Worker Node|||||
|AWS Cloud<br>VPC (<br>EKS<br>API Server|VPC (<br>EKS<br>API Server|EKS<br>API Server||||||||
|AWS Cloud<br>VPC (<br>EKS<br>API Server|VPC (<br>EKS<br>API Server|EKS<br>API Server||||||||


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-125-full.png)

**실습아키텍처구성사항#1**


**1. AWS Network 구성**


**- VPC1개, Public Subnet 2개, Private Subnet 2개**


**- Internet Gateway 1개, NAT Gateway 1개**


**2. AWS EKS 구성**


**- EKS Cluster 1개, EKS NodeGroup1개(2개Worker Node 생성)**


**- EC2 Bastion VM 1개(EKS 접속용)**


3


##### **05.**

AWS EBS CSI
Driver를활용한
Block Storage
PV 생성


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-126-full.png)

**실습아키텍처구성사항#2**


**3.1 Terraform으로Backend생성**


**- IaC 경로: Ch03_05-csi-block-pv > terraform-backend**


**3.2 terraform 명령어실행**


**$ terraform init**


**$ terraform plan**


**$ terraform apply**


4


##### **05.**

AWS EBS CSI
Driver를활용한
Block Storage
PV 생성


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-127-full.png)

**실습아키텍처구성사항#3**


**4.1 Terraform으로AWS 클라우드아키텍처구성경로**


**- IaC 경로: Ch03_05-csi-block-pv > terraform-codes**


**4.2 Bastion 서버용Key Pair 생성**


##### **05.**

AWS EBS CSI
Driver를활용한
Block Storage
PV 생성



**-**

**> EC2 >** **>** **>** **>**
**AWS Management 콘솔** **네트워크및보안** **키페어** **키페어생성**


**"test-kp-bastion" 이름의RSA방식의키페어생성및다운로드**


5


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-128-full.png)

**실습아키텍처구성사항#4**


**4.3 terraform 명령어실행하여전체아키텍처구성**


**$ terraform init**


**$ terraform plan**


**$ terraform apply**


**4.4 아키텍처구성이후Bastion 서버연결방법**


##### **05.**

AWS EBS CSI
Driver를활용한
Block Storage
PV 생성



**-**

**> EC2 >**
**AWS Management 콘솔** **Bastion VM 선택** **> 우측상단"연결버튼"클릭>**


**SSH 연결방식에나와있는방식대로수행하여연결**


6


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-129-full.png)

**실습아키텍처구성사항#5**


**5.1 Bastion VM에서kubectl 다운로드**


**$ curl -o kubectl https://s3.us-west-2.amazonaws.com/amazon-**


**eks/1.23.7/2022-06-29/bin/linux/amd64/kubectl**


**5.2 Bastion VM에서kubectl 실행권한부여및bin PATH로이동**


**$ chmod +x kubectl && sudo mv kubectl /usr/local/bin/**


**5.3 kubectl 버전확인**


**$ kubectl version**


7


##### **05.**

AWS EBS CSI
Driver를활용한
Block Storage
PV 생성


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-130-full.png)

**실습아키텍처구성사항#6**


**6.1 Bastion VM에서awscli 설치**


**$ sudo apt update**


**$ sudo apt install -y awscli**


**6.2 Bastion VM에서aws configure 설정**


##### **05.**

AWS EBS CSI
Driver를활용한
Block Storage
PV 생성




**- 본인의AWS 계정의Access Key와Secret Key, Region 설정(Output : json)**


**$ aws configure**


**5.3 aws configure 설정확인**



**$ aws configure list**



8


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-131-full.png)

**실습아키텍처구성사항#7**


**7.1 Bastion VM에서kubeconfig 설정**


**$ aws eks update-kubeconfig --name <생성된EKS 클러스터명>**


**7.2 kubeconfig 파일확인**


**- 홈디렉토리에서파일존재확인**


**$ cat ~/.kube/config**


**7.3 kubectl 동작확인**


**$ kubectl get nodes; kubectl get pods -A**


9


##### **05.**

AWS EBS CSI
Driver를활용한
Block Storage
PV 생성


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-132-full.png)

**실습아키텍처구성사항#8**


**8.1 Bastion VM에서eksctl 다운로드**


**$ curl --silent --location**


##### **05.**

AWS EBS CSI
Driver를활용한
Block Storage
PV 생성



**"https://github.com/weaveworks/eksctl/releases/latest/download/eksctl**


**_$(uname -s)_amd64.tar.gz" | tar xz -C /tmp**


**8.2 eksctl을바이너리Path로이동**


**$ sudo mv /tmp/eksctl /usr/local/bin**


**8.3 eksctl 동작확인**


**$ eksctl version**


10


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-133-full.png)

**실습내용**


**순서**


**1. AWS EBS CSI Driver 설치**


**2.**
**Namespace 구성, Storage Class 및예제** **POD, PVC 배포**


**3.**
**Block Storage PV 생성및** **볼륨마운트** **확인**


**4.**
**Worker Node에있는** **1개의POD에서** **데이터Read/Write**


**5.**
**1개의** **POD 삭제** **및1개의** **POD 생성** **후** **파일읽기** **수행**


**실습예제코드경로**


**>**
**Chapter03** **Ch03_05-csi-block-pv**


11


##### **05.**

AWS EBS CSI
Driver를활용한
Block Storage
PV 생성


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-134-full.png)

**1. AWS EBS CSI Driver 설치#1**


**1.1 IAM Role 및EKS내서비스어카운트생성**


**$ eksctl create iamserviceaccount \**


**--name ebs-csi-controller-sa \**


**--namespace kube-system \**


**--cluster <EKS Cluster명> \**


##### **05.**

AWS EBS CSI
Driver를활용한
Block Storage
PV 생성



**--attach-policy-arn arn:aws:iam::aws:policy/service-role/AmazonEBSCSIDriverPolicy \**


**--approve \**


**--role-only \**


**--role-name AmazonEKS_EBS_CSI_DriverRole**


12


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-135-full.png)

**1. AWS EBS CSI Driver 설치#2**


**1.2 eksctl 애드온을통한설치**


##### **05.**

AWS EBS CSI
Driver를활용한
Block Storage
PV 생성



**$** **eksctl create addon --name aws-ebs-csi-driver --cluster <EKS 클러스터명> --service-**


**account-role-arn arn:aws:iam::<AWS 계정ID>:role/AmazonEKS_EBS_CSI_DriverRole --**


**force**


**1.3 eksctl 애드온을통한설치상태확인**


**>**
**$** **EKS 클러스터명**
**eksctl get addon --name aws-ebs-csi-driver --cluster <**


**1.4 AWS EBS CSI Driver 설치확인**


**$ kubectl get pods -n kube-system | grep ebs-csi-controller**


13


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-136-full.png)

**2. Namespace 구성, 예제K8s Manifest 배포, Block Storage PV 생성**


**2.1 Namespace 구성명령어**


**$ kubectl create namespace test-csi-block-pv**


**2.2 예제K8s Manifest 배포**


**- K8s Manifest 경로: Ch03_05-csi-block-pv > k8s-manifests**


**- K8s Manifest 배포명령어: kubectl create -f ./**


14


##### **05 .**

AWS EBS CSI
Driver를활용한
Block Storage
PV 생성


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-137-full.png)

**3. Block Storage PV 자동생성확인및볼륨마운트확인#1**


**3.1 Block Storage PV 자동생성확인명령어**


**$ kubectl get pv**


**$ kubectl get pvc -n test-csi-block-pv**


**3.2 볼륨마운트확인**


**$ kubectl exec -it <POD명> -n test-csi-block-pv -- df -h**


##### **05 .**

AWS EBS CSI
Driver를활용한
Block Storage
PV 생성



**$ kubectl exec -it <POD명> -n test-csi-block-pv -- cat /data/out.txt**


15


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-138-full.png)

**3. Block Storage PV 자동생성확인및볼륨마운트확인#2**


**3.3 Block Storage PV에연결된AWS EBS 정보확인명령어**


**>**
**$ kubectl describe pv <PV명**


**-**
**VolumeHandle값확인**


**3.4 AWS에서EBS 정보확인**


##### **05 .**

AWS EBS CSI
Driver를활용한
Block Storage
PV 생성




**- 경로** **: AWS Management Console > EC2 > Elastic Block Store > 볼륨**


16


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-139-full.png)
##### **4. 데이터/파일쓰기및POD 삭제후볼륨보존확인 05 .**

AWS EBS CSI
Driver를활용한
Block Storage
PV 생성
**4.1 데이터/파일쓰기**


**$ kubectl exec -it <POD명> -n test-csi-block-pv -- sh -c 'echo "First data" >>**


**/data/out.txt'**


**$ kubectl exec -it <POD명> -n test-csi-block-pv -- sh -c 'echo "Second data" >>**


**/data/out.txt'**


**4.2 POD 삭제**


**$ kubectl delete po <POD명> -n test-csi-block-pv**


**4.3 볼륨보존확인**


**$ kubectl get pv**


**- AWS 확인경로** **: AWS Management Console > EC2 > Elastic Block Store > 볼륨**


17


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-140-full.png)

**5. POD 생성후자동볼륨마운트확인및데이터/파일읽기확인**


**5.1 POD 재생성**


**- K8s Manifest 경로: Ch03_05-csi-block-pv > k8s-manifests**


**- K8s Manifest 배포명령어: $ kubectl create -f test-csi-block-pv-pod.yaml**


**5.2 자동볼륨마운트확인**


**$ kubectl exec -it <POD명> -n test-csi-block-pv -- df -h**


**5.3 데이터/파일읽기확인**


**$ kubectl exec -it <POD명> -n test-csi-block-pv -- cat /data/out.txt**


**-**
**First 및** **Second data 존재확인**


18


##### **05 .**

AWS EBS CSI
Driver를활용한
Block Storage
PV 생성


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-141-full.png)

**추가내용‒ Persistent Volume Mount 및Volume Attach 검증#1**


**검증대상**

###### • POD에서사용되는 Persistent Volume은 EKS Worker Node기준으로 Volume Attach POD Volume 을 한후, Node내부에스케쥴링된 에 의 Mount . 파일시스템을 해서사용하는것이다


19


##### **05 .**

AWS EBS CSI
Driver를활용한
Block Storage
PV 생성


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-142-full.png)
##### **추가내용‒ Persistent Volume Mount 및Volume Attach 검증#2 05 .**

AWS EBS CSI
Driver를활용한
Block Storage
PV 생성
**검증내용- (1) 구성되어있는검증용K8s Resource 현황확인**


   POD, PersistentVolumeClaim, PersistentVolume, NODE 현황확인


$ kubectl get po


$ kubectl get pvc


$ kubectl get pv


$ kubectl get no



![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-142-0.png)
![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-143-full.png)
##### **추가내용‒ Persistent Volume Mount 및Volume Attach 검증#3 05 .**

AWS EBS CSI
Driver를활용한
Block Storage
PV 생성
**(2) POD에Mount된Volume 상세내역**


   PersistentVolumeClaim 맵핑내역및Mount된Volume 현황


   여기서는POD가ip-172-32-2-60 노드에서실행중임을알수있다.


$ kubectl get po <POD명> -o yaml | grep -C5 vol


$ kubectl describe po <POD명>


21



![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-143-0.png)
![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-144-full.png)

**추가내용‒ Persistent Volume Mount 및Volume Attach 검증#4**


##### **05 .**

AWS EBS CSI
Driver를활용한
Block Storage
PV 생성



![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-144-0.png)
![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-145-full.png)
##### **추가내용‒ Persistent Volume Mount 및Volume Attach 검증#5 05 .**

AWS EBS CSI
Driver를활용한
Block Storage
PV 생성
**(3) PersistentVolumeClaim(PVC) 상세내역**


   PersistentVolume 맵핑내역및EKS Worker Node 현황


   여기서는PersistentVolume이ip-172-32-2-60 노드로선택


$ kubectl describe pvc <PVC명>



![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-145-0.png)
![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-146-full.png)
##### **추가내용‒ Persistent Volume Mount 및Volume Attach 검증#6 05 .**

AWS EBS CSI
Driver를활용한
Block Storage
PV 생성
**(4) PersistentVolume(PV) 상세내역**


   PersistentVolume 상세내역및EBS Volume 맵핑현황


   여기서는PersistentVolume이vol-06d8fd91e006505c6 볼륨으로맵핑


$ kubectl describe pv <PV명>



![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-146-0.png)
![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-147-full.png)
##### **추가내용‒ Persistent Volume Mount 및Volume Attach 검증#7 05 .**

AWS EBS CSI
Driver를활용한
Block Storage
PV 생성
**(5) EBS 볼륨상세내역**

 (4)번에서확인된Volume-ID로볼륨에서검색하면맵핑된EBS 상세정보출력

 여기서는PersistentVolume에서확인한vol-06d8fd91e006505c6로검색

 해당볼륨이Attach된EC2 VM 인스턴스의ID는i-0c1e9e24e8c2d25af 이다.



![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-147-0.png)
![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-148-full.png)
##### **추가내용‒ Persistent Volume Mount 및Volume Attach 검증#8 05 .**

AWS EBS CSI
Driver를활용한
Block Storage
PV 생성
**(6) EC2 VM 상세내역**

 (5)번에서확인된EC2 VM ID로인스턴스에서검색하면EC2 VM 상세정보출력

 여기서는EBS볼륨에서확인한i-0c1e9e24e8c2d25af로검색

 EBS가Attach된EC2 VM 인스턴스의프라이빗IP DNS 이름은ip-172-32-2-60 노드



![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-148-0.png)
![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-149-full.png)
##### **추가내용‒ Persistent Volume Mount 및Volume Attach 검증#9 05 .**

AWS EBS CSI
Driver를활용한
Block Storage
**(7) 가설1 : POD를Restart하면다른EKS Worker Node로스케쥴링이되고**
PV 생성


**PV Mount가바뀔것이다?**


  확인을위해POD를배포할때사용한Deployment를Rollout Restart한다.


$ kubectl get deploy


$ kubectl get po -o wide


$ kubectl rollout restart deploy <Deployment명>


$ kubectl get po -o wide



![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-149-0.png)
![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-150-full.png)

**추가내용‒ Persistent Volume Mount 및Volume Attach 검증#10**


 Deployment의Rollout Restart를몇번을


해도PV가Mount된ip-172-32-2-60


노드에만스케쥴링이되는것을알수있다.


$ kubectl describe po <POD명>


28


##### **05 .**

AWS EBS CSI
Driver를활용한
Block Storage
PV 생성



![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-150-0.png)
![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-151-full.png)
##### **추가내용‒ Persistent Volume Mount 및Volume Attach 검증#11 05 .**

AWS EBS CSI
Driver를활용한
Block Storage
**(8) 가설2 : POD가실행중이고및PV가Attach된EKS Worker Node에**
PV 생성


**스케쥴링못하도록막는다면?**


  확인을위해해당노드에Cordon을적용한다.


  Cordon 적용후, POD를배포할때사용한Deployment를Rollout Restart한다.


$ kubectl get no


$ kubectl cordon <POD가기동중인EKS Worker Node명>


$ kubectl get deploy


$ kubectl get no


$ kubectl rollout restart deploy <Deployment명>


$ kubectl get po



$ kubectl describe po <POD명>



29


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-152-full.png)
##### **추가내용‒ Persistent Volume Mount 및Volume Attach 검증#12 05 .**

AWS EBS CSI
Driver를활용한
Block Storage
PV 생성

 Deployment의Rollout Restart를해서새로생성된POD부터는Pending
상태가된것을확인할수있다.

![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-152-0.png)


30


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-153-full.png)

**추가내용‒ Persistent Volume Mount 및Volume Attach 검증#13**


 POD의이벤트내역을
보면현재Node
Affinity Conflict 상태로
Pending이걸린것을
확인할수있다.


##### **05 .**

AWS EBS CSI
Driver를활용한
Block Storage
PV 생성



![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-153-0.png)
![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-154-full.png)
##### **추가내용‒ Persistent Volume Mount 및Volume Attach 검증#14 05 .**

AWS EBS CSI
Driver를활용한
Block Storage
**(9) Cordon 상태의노드를다시Uncordon을통해POD 스케쥴링이되도록**
PV 생성


**만들면어떻게될까?**


  확인을위해해당노드에Uncordon을적용한다.


  Uncordon 적용후, POD의상태를확인한다.


$ kubectl get no


$ kubectl uncordon <Cordon이적용된EKS Worker Node명>


$ kubectl get no


$ kubectl get deploy


$ kubectl get po


$ kubectl get po -o wide


32


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-155-full.png)
##### **추가내용‒ Persistent Volume Mount 및Volume Attach 검증#15 05 .**

AWS EBS CSI
Driver를활용한
Block Storage

 - PV 생성
노드를Uncordon하면그즉시기존에Pending 상태인POD가정상적으로


Running이되는것을확인할수있다.


 POD가스케쥴링된노드는기존에실행되고PV Mount가된ip-172-32-2-60


노드임을확인할수있다.

![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-155-0.png)


33


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-156-full.png)

**추가내용‒ Persistent Volume Mount 및Volume Attach 검증#16**


 POD의이벤트내역을
보면, Successfully
assigned <POD명> to
<Node명>이명시가
되면서, 원래실행된
노드에정상적으로
스케쥴링이된것을확인
할수있다.


##### **05 .**

AWS EBS CSI
Driver를활용한
Block Storage
PV 생성



![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-156-0.png)
![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-157-full.png)
### **3 AWS EKS 기본Plugin 구성방법**

**06**
**AWS EFS CSI Driver를활용한File Storage PV 생성**


1


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-158-full.png)
##### **실습아키텍처(EFS CSI 및File PV 적용) 06 .**

AWS EFS CSI
Driver를활용한
File Storage PV


Inbound Traffic

생성



Inbound Traffic



Internet



Outbound Traffic



User



Registry
















|AWS Cloud<br>VPC (<br>EKS<br>API Server|Col2|Col3|Availability Zone (ap-northeast-2a)|Col5|Col6|Col7|Col8|Availability Zone (ap-northeast-2c)|Col10|
|---|---|---|---|---|---|---|---|---|---|
|AWS Cloud<br>VPC (<br>EKS<br>API Server|VPC (<br>EKS<br>API Server|VPC (<br>EKS<br>API Server|Primary : 172.31.0.0/16)<br>Public subnet1 (172.31.0.0/20)<br>Bastion Server|Primary : 172.31.0.0/16)<br>Public subnet1 (172.31.0.0/20)<br>Bastion Server|Primary : 172.31.0.0/16)<br>Public subnet1 (172.31.0.0/20)<br>Bastion Server|Primary : 172.31.0.0/16)<br>Public subnet1 (172.31.0.0/20)<br>Bastion Server|Internet gateway<br>Router|Private subnet3 (172.31.48.0/20)<br>Public subnet3 (172.31.16.0/20)<br>EKS Worker Node<br>NAT gateway<br>POD2<br>(Container)<br>ent Volume<br><br>Attach<br>Mount<br>Claim Info<br>n||
|AWS Cloud<br>VPC (<br>EKS<br>API Server|VPC (<br>EKS<br>API Server|EKS<br>API Server|Cluster<br><br>Private subnet1 (172.31.32.0/20)<br>EKS Worker Node<br><br>Storage Class<br>POD1<br>(Container)<br>Mount<br>Claim Info<br>Class|Cluster<br><br>Private subnet1 (172.31.32.0/20)<br>EKS Worker Node<br><br>Storage Class<br>POD1<br>(Container)<br>Mount<br>Claim Info<br>Class|Cluster<br><br>Private subnet1 (172.31.32.0/20)<br>EKS Worker Node<br><br>Storage Class<br>POD1<br>(Container)<br>Mount<br>Claim Info<br>Class|Cluster<br><br>Private subnet1 (172.31.32.0/20)<br>EKS Worker Node<br><br>Storage Class<br>POD1<br>(Container)<br>Mount<br>Claim Info<br>Class||Private subnet3 (172.31.48.0/20)<br>EKS Worker Node<br>POD2<br>(Container)<br>ent Volume<br><br>Mount<br>Claim Info<br>n|Private subnet3 (172.31.48.0/20)<br>EKS Worker Node<br>POD2<br>(Container)<br>ent Volume<br><br>Mount<br>Claim Info<br>n|
|AWS Cloud<br>VPC (<br>EKS<br>API Server|VPC (<br>EKS<br>API Server|EKS<br>API Server|Cluster<br><br>Private subnet1 (172.31.32.0/20)<br>EKS Worker Node<br><br>Storage Class<br>POD1<br>(Container)<br>Mount<br>Claim Info<br>Class|Cluster<br><br>Private subnet1 (172.31.32.0/20)<br>EKS Worker Node<br><br>Storage Class<br>POD1<br>(Container)<br>Mount<br>Claim Info<br>Class|POD1<br>(Container)<br>Mount<br>Claim Info|POD1<br>(Container)<br>Mount<br>Claim Info|EKS Namespace<br>Persistent Volume Claim<br>Binding|POD2<br>(Container)<br><br>Mount<br>Claim Info|POD2<br>(Container)<br><br>Mount<br>Claim Info|
|AWS Cloud<br>VPC (<br>EKS<br>API Server|VPC (<br>EKS<br>API Server|EKS<br>API Server|Cluster<br><br>Private subnet1 (172.31.32.0/20)<br>EKS Worker Node<br><br>Storage Class<br>POD1<br>(Container)<br>Mount<br>Claim Info<br>Class|Cluster<br><br>Private subnet1 (172.31.32.0/20)<br>EKS Worker Node<br><br>Storage Class<br>POD1<br>(Container)<br>Mount<br>Claim Info<br>Class|POD1<br>(Container)<br>Mount<br>Claim Info|POD1<br>(Container)<br>Mount<br>Claim Info|Persist<br> Info|Persist<br> Info|Persist<br> Info|
|AWS Cloud<br>VPC (<br>EKS<br>API Server|VPC (<br>EKS<br>API Server|EKS<br>API Server|Cluster<br><br>Private subnet1 (172.31.32.0/20)<br>EKS Worker Node<br><br>Storage Class<br>POD1<br>(Container)<br>Mount<br>Claim Info<br>Class|EKS Worker Node|EKS Worker Node|EKS Worker Node|EKS Node Group1<br>Abstractio|EKS Worker Node<br>n|EKS Worker Node<br>n|
|AWS Cloud<br>VPC (<br>EKS<br>API Server|VPC (<br>EKS<br>API Server|EKS<br>API Server|Cluster<br><br>Private subnet1 (172.31.32.0/20)<br>EKS Worker Node<br><br>Storage Class<br>POD1<br>(Container)<br>Mount<br>Claim Info<br>Class|EKS Worker Node|EKS Worker Node|||||
|AWS Cloud<br>VPC (<br>EKS<br>API Server|VPC (<br>EKS<br>API Server|EKS<br>API Server|Attach<br>Volume Info|Attach<br>Volume Info|Attach<br>Volume Info|||||
|AWS Cloud<br>VPC (<br>EKS<br>API Server|VPC (<br>EKS<br>API Server|EKS<br>API Server|Attach<br>Volume Info|Attach<br>Volume Info|Attach<br>Volume Info||AWS EFS Volume|AWS EFS Volume|AWS EFS Volume|
|AWS Cloud<br>VPC (<br>EKS<br>API Server|VPC (<br>EKS<br>API Server|EKS<br>API Server||||||||


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-159-full.png)

**실습아키텍처구성사항#1**


**1. AWS Network 구성**


**- VPC1개, Public Subnet 2개, Private Subnet 2개**


**- Internet Gateway 1개, NAT Gateway 1개**


**2. AWS EKS 구성**


**- EKS Cluster 1개, EKS NodeGroup1개(2개Worker Node 생성)**


**- EC2 Bastion VM 1개(EKS 접속용)**


3


##### **06 .**

AWS EFS CSI
Driver를활용한
File Storage PV
생성


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-160-full.png)

**실습아키텍처구성사항#2**


**3.1 Terraform으로Backend생성**


**- IaC 경로: Ch03_06-csi-file-pv > terraform-backend**


**3.2 terraform 명령어실행**


**$ terraform init**


**$ terraform plan**


**$ terraform apply**


4


##### **06 .**

AWS EFS CSI
Driver를활용한
File Storage PV
생성


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-161-full.png)

**실습아키텍처구성사항#3**


**4.1 Terraform으로AWS 클라우드아키텍처구성경로**


**- IaC 경로: Ch03_06-csi-file-pv > terraform-codes**


**4.2 Bastion 서버용Key Pair 생성**


##### **06 .**

AWS EFS CSI
Driver를활용한
File Storage PV
생성



**-**

**> EC2 >** **>** **>** **>**
**AWS Management 콘솔** **네트워크및보안** **키페어** **키페어생성**


**"test-kp-bastion" 이름의RSA방식의키페어생성및다운로드**


5


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-162-full.png)

**실습아키텍처구성사항#4**


**4.3 terraform 명령어실행하여전체아키텍처구성**


**$ terraform init**


**$ terraform plan**


**$ terraform apply**


**4.4 아키텍처구성이후Bastion 서버연결방법**


##### **06 .**

AWS EFS CSI
Driver를활용한
File Storage PV
생성



**-**

**> EC2 >**
**AWS Management 콘솔** **Bastion VM 선택** **> 우측상단"연결버튼"클릭>**


**SSH 연결방식에나와있는방식대로수행하여연결**


6


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-163-full.png)

**실습아키텍처구성사항#5**


**5.1 Bastion VM에서kubectl 다운로드**


**$ curl -o kubectl https://s3.us-west-2.amazonaws.com/amazon-**


**eks/1.23.7/2022-06-29/bin/linux/amd64/kubectl**


**5.2 Bastion VM에서kubectl 실행권한부여및bin PATH로이동**


**$ chmod +x kubectl && sudo mv kubectl /usr/local/bin/**


**5.3 kubectl 버전확인**


**$ kubectl version**


7


##### **06 .**

AWS EFS CSI
Driver를활용한
File Storage PV
생성


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-164-full.png)

**실습아키텍처구성사항#6**


**6.1 Bastion VM에서awscli 설치**


**$ sudo apt update**


**$ sudo apt install -y awscli**


**6.2 Bastion VM에서aws configure 설정**


##### **06 .**

AWS EFS CSI
Driver를활용한
File Storage PV
생성




**- 본인의AWS 계정의Access Key와Secret Key, Region 설정(Output : json)**


**$ aws configure**


**5.3 aws configure 설정확인**



**$ aws configure list**



8


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-165-full.png)

**실습아키텍처구성사항#7**


**7.1 Bastion VM에서kubeconfig 설정**


**$ aws eks update-kubeconfig --name <생성된EKS 클러스터명>**


**7.2 kubeconfig 파일확인**


**- 홈디렉토리에서파일존재확인**


**$ cat ~/.kube/config**


**7.3 kubectl 동작확인**


**$ kubectl get nodes; kubectl get pods -A**


9


##### **06 .**

AWS EFS CSI
Driver를활용한
File Storage PV
생성


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-166-full.png)

**실습아키텍처구성사항#8**


**8.1 Bastion VM에서eksctl 다운로드**


**$ curl --silent --location**


##### **06 .**

AWS EFS CSI
Driver를활용한
File Storage PV
생성



**"https://github.com/weaveworks/eksctl/releases/latest/download/eksctl**


**_$(uname -s)_amd64.tar.gz" | tar xz -C /tmp**


**8.2 eksctl을바이너리Path로이동**


**$ sudo mv /tmp/eksctl /usr/local/bin**


**8.3 eksctl 동작확인**


**$ eksctl version**


10


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-167-full.png)

**실습내용**


**순서**


**1. AWS EFS CSI Driver 설치**


**2.**
**Namespace 구성, Storage Class 및예제** **POD, PVC 배포**


**3.**
**File Storage PV 생성및** **볼륨마운트** **확인**


**4.**
**다른Worker Node에있는** **2개의POD에서동시에** **데이터Read/Write**


**5.**
**2개의** **POD 삭제** **및2개의** **POD 생성** **후동시** **파일읽기** **수행**


**실습예제코드경로**


**>**
**Chapter03** **Ch03_06-csi-file-pv**


11


##### **06 .**

AWS EFS CSI
Driver를활용한
File Storage PV
생성


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-168-full.png)

**1. AWS EFS CSI Driver 설치#1**


**1.1 IAM Role 및EKS내서비스어카운트생성**


**$ eksctl create iamserviceaccount \**


**--name efs-csi-controller-sa \**


**--namespace kube-system \**


**--cluster <EKS Cluster명> \**


##### **06 .**

AWS EFS CSI
Driver를활용한
File Storage PV
생성



**--attach-policy-arn arn:aws:iam::<AWS 계정ID>:policy/AmazonEKS_EFS_CSI_Driver_Policy \**


**--approve \**


**--override-existing-serviceaccounts \**


**--region ap-northeast-2**


12


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-169-full.png)

**1. AWS EFS CSI Driver 설치#2**


**1.2 Helm 설치**


**$ curl -L https://git.io/get_helm.sh | bash -s -- --version v3.8.2**


**1.3 Helm 설치후버전확인**


**$ helm version**


13


##### **06 .**

AWS EFS CSI
Driver를활용한
File Storage PV
생성


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-170-full.png)

**1. AWS EFS CSI Driver 설치#4**


**1.4 Helm 리포지토리추가**


##### **06 .**

AWS EFS CSI
Driver를활용한
File Storage PV
생성



**$ helm repo add aws-efs-csi-driver https://kubernetes-sigs.github.io/aws-**


**efs-csi-driver/**


**1.5 리포지토리업데이트**


**$ helm repo update**


14


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-171-full.png)

**1. AWS EFS CSI Driver 설치#5**


**1.6 Helm Chart로AWS EFS CSI Driver 설치**


##### **06 .**

AWS EFS CSI
Driver를활용한
File Storage PV
생성



**$ helm upgrade -i aws-efs-csi-driver aws-efs-csi-driver/aws-efs-csi-driver \**


**--namespace kube-system \**


**--set image.repository=602401143452.dkr.ecr.ap-northeast-**


**2.amazonaws.com/eks/aws-efs-csi-driver \**


**--set controller.serviceAccount.create=false \**


**--set controller.serviceAccount.name=efs-csi-controller-sa**


**1.7 AWS EFS CSI Driver 설치확인**


**$ kubectl get pods -n kube-system | grep efs-csi-controller**


15


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-172-full.png)

**2. Namespace 구성, Storage Class 및예제POD, PVC 배포#1**


**2.1 Namespace 구성명령어**


**$ kubectl create namespace test-csi-file-pv**


**2.2 Storage Class 배포**


**- K8s Manifest 경로: Ch03_06-csi-file-pv > k8s-manifests**


**- Manifest 배포명령어: kubectl create ‒f storageclass.yaml**


16


##### **06 .**

AWS EFS CSI
Driver를활용한
File Storage PV
생성


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-173-full.png)

**2. Namespace 구성, Storage Class 및예제POD, PVC 배포#2**


**2.3 예제POD, PVC 배포**


**- K8s Manifest 경로: Ch03_06-csi-file-pv > k8s-manifests**


**- POD1 배포: kubectl create ‒f deploy-pod1.yaml**


**- POD2 배포: kubectl create ‒f deploy-pod2.yaml**


**- PVC 배포: kubectl create ‒f efs-pv-claim.yaml**


17


##### **06 .**

AWS EFS CSI
Driver를활용한
File Storage PV
생성


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-174-full.png)

**3. File Storage PV 생성및볼륨마운트확인#1**


**3.1 File Storage PV 자동생성확인명령어**


**$ kubectl get pv**


**$ kubectl get pvc ‒n test-csi-file-pv**


**3.2 볼륨마운트확인**


**$ kubectl exec <deploy-pod1, 2> ‒it -n test-csi-file-pv -- df ‒h**


##### **06 .**

AWS EFS CSI
Driver를활용한
File Storage PV
생성



**$ kubectl exec deploy-pod1 ‒it -n test-csi-file-pv -- cat /dpod1/out**


**$ kubectl exec deploy-pod2 ‒it -n test-csi-file-pv -- cat /dpod2/out**


18


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-175-full.png)

**3. File Storage PV 생성및볼륨마운트확인#2**


**3.3 File Storage PV에연결된AWS EFS 정보확인명령어**


**>**
**$ kubectl describe pv <PV명**


**-**
**VolumeHandle값확인**


**- 출력형태: 파일시스템ID:액세스포인트ID**


**3.4 AWS에서EFS 정보확인**


**> EFS >**

**- 경로** **: AWS Management Console** **파일시스템**


19


##### **06 .**

AWS EFS CSI
Driver를활용한
File Storage PV
생성


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-176-full.png)

**4. 다른Worker Node에있는2개의POD에서동시에데이터Read/Write #1**


**4.1 다른Worker Node에있는2개의POD 상태확인**


**-**
**터미널창을2개** **띄움(좌/우로배열)**


##### **06 .**

AWS EFS CSI
Driver를활용한
File Storage PV
생성




**- 다음의명령어를이용해서2개의** **POD의상태** **및배포된Worker Node의현황** **확인**


**$ kubectl get pods ‒o wide**


20


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-177-full.png)

**4. 다른Worker Node에있는2개의POD에서동시에데이터Read/Write #2**


**4.2 동시에데이터Read/Write**


**- 좌측터미널창**


##### **06 .**

AWS EFS CSI
Driver를활용한
File Storage PV
생성



**$ kubectl exec deploy-pod1 -it -n test-csi-file-pv -- bash -c 'echo "[deploy-**


**pod1 message]" >> /dpod1/out; tail -10 /dpod1/out'**


**- 우측터미널창**


**$ kubectl exec deploy-pod2 -it -n test-csi-file-pv -- bash -c 'echo "[deploy-**


**pod2 message]" >> /dpod2/out; tail -10 /dpod2/out'**


21


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-178-full.png)

**5. 2개의POD 삭제및2개의POD 생성후동시파일읽기수행#1**


**5.1 POD 삭제**


**$ kubectl delete po <deploy-pod1, 2> -n test-csi-file-pv**


**5.2 볼륨보존확인**


**$ kubectl get pv**


**> EFS >**

**- AWS 확인경로** **: AWS Management Console** **파일시스템**


22


##### **06 .**

AWS EFS CSI
Driver를활용한
File Storage PV
생성


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-179-full.png)

**5. 2개의POD 삭제및2개의POD 생성후동시파일읽기수행#2**


**5.3 POD 재생성**


**- K8s Manifest 경로: Ch03_06-csi-file-pv > k8s-manifests**


**- POD1 배포: kubectl create ‒f deploy-pod1.yaml**


**- POD2 배포: kubectl create ‒f deploy-pod2.yaml**


23


##### **06 .**

AWS EFS CSI
Driver를활용한
File Storage PV
생성


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-180-full.png)

**5. 2개의POD 삭제및2개의POD 생성후동시파일읽기수행#3**


**5.4 동시파일읽기수행**


**$ kubectl get ‒it <deploy-pod1, 2> -n test-csi-file-pv -- df ‒h**


##### **06 .**

AWS EFS CSI
Driver를활용한
File Storage PV
생성



**$ kubectl get ‒it deploy-pod1 -n test-csi-file-pv -- cat /dpod1/out**


**$ kubectl get ‒it deploy-pod2 -n test-csi-file-pv -- cat /dpod2/out**


**-**
**deploy-pod1 message 및** **deploy-pod2 message 존재확인**


24


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-181-full.png)
### **3 AWS EKS 기본Plugin 구성방법**

**07 Cluster Autoscaler를활용한EKS노드오토스케일링**


1


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-182-full.png)
##### **AWS 네트워크및EKS 구성도(Cluster Autoscaler 적용) 07 .**

Cluster
Autoscaler를
활용한EKS노드


Inbound Traffic

오토스케일링



Inbound Traffic



Internet



Outbound Traffic



User



Registry






















|AWS Cloud<br>VPC (<br>E<br>Cl<br>API Se|Col2|Col3|Availability Zone (ap-northeast-2a)|Col5|Col6|Col7|Col8|Col9|Availability Zone (ap-northeast-2c)|Col11|Col12|Col13|Autoscaling Group|
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
|AWS Cloud<br>VPC (<br>E<br>Cl<br>API Se|VPC (<br>E<br>Cl<br>API Se|VPC (<br>E<br>Cl<br>API Se|Primary : 172.31.0.0/16)<br>Public subnet1 (172.31.0.0/20)<br>Bastion Server|Primary : 172.31.0.0/16)<br>Public subnet1 (172.31.0.0/20)<br>Bastion Server|Primary : 172.31.0.0/16)<br>Public subnet1 (172.31.0.0/20)<br>Bastion Server|Primary : 172.31.0.0/16)<br>Public subnet1 (172.31.0.0/20)<br>Bastion Server|Primary : 172.31.0.0/16)<br>Public subnet1 (172.31.0.0/20)<br>Bastion Server|Internet gateway<br>Router|Private subnet3 (172.31.48.0/20)<br>Public subnet3 (172.31.16.0/20)<br>NAT gateway<br>Multi PODs<br>Scale out EKS Worker Nodes<br>Scale Out|Private subnet3 (172.31.48.0/20)<br>Public subnet3 (172.31.16.0/20)<br>NAT gateway<br>Multi PODs<br>Scale out EKS Worker Nodes<br>Scale Out|Private subnet3 (172.31.48.0/20)<br>Public subnet3 (172.31.16.0/20)<br>NAT gateway<br>Multi PODs<br>Scale out EKS Worker Nodes<br>Scale Out|Private subnet3 (172.31.48.0/20)<br>Public subnet3 (172.31.16.0/20)<br>NAT gateway<br>Multi PODs<br>Scale out EKS Worker Nodes<br>Scale Out||
|AWS Cloud<br>VPC (<br>E<br>Cl<br>API Se|VPC (<br>E<br>Cl<br>API Se|E<br>Cl<br>API Se|KS<br>uster<br><br>Private subnet1 (172.31.32.0/20)<br>Scale out EKS Worker Nodes<br>rver<br>Multi PODs<br>Scale Out|KS<br>uster<br><br>Private subnet1 (172.31.32.0/20)<br>Scale out EKS Worker Nodes<br>rver<br>Multi PODs<br>Scale Out|KS<br>uster<br><br>Private subnet1 (172.31.32.0/20)<br>Scale out EKS Worker Nodes<br>rver<br>Multi PODs<br>Scale Out|KS<br>uster<br><br>Private subnet1 (172.31.32.0/20)<br>Scale out EKS Worker Nodes<br>rver<br>Multi PODs<br>Scale Out|KS<br>uster<br><br>Private subnet1 (172.31.32.0/20)<br>Scale out EKS Worker Nodes<br>rver<br>Multi PODs<br>Scale Out||Private subnet3 (172.31.48.0/20)<br>Multi PODs<br>Scale out EKS Worker Nodes<br>Scale Out|Private subnet3 (172.31.48.0/20)<br>Multi PODs<br>Scale out EKS Worker Nodes<br>Scale Out|Private subnet3 (172.31.48.0/20)<br>Multi PODs<br>Scale out EKS Worker Nodes<br>Scale Out|Private subnet3 (172.31.48.0/20)<br>Multi PODs<br>Scale out EKS Worker Nodes<br>Scale Out|Private subnet3 (172.31.48.0/20)<br>Multi PODs<br>Scale out EKS Worker Nodes<br>Scale Out|
|AWS Cloud<br>VPC (<br>E<br>Cl<br>API Se|VPC (<br>E<br>Cl<br>API Se|E<br>Cl<br>API Se|KS<br>uster<br><br>Private subnet1 (172.31.32.0/20)<br>Scale out EKS Worker Nodes<br>rver<br>Multi PODs<br>Scale Out|Multi PODs|Multi PODs|Multi PODs|Multi PODs|EKS Namespace<br>Service|Multi PODs|Multi PODs|Multi PODs|Multi PODs|Multi PODs|
|AWS Cloud<br>VPC (<br>E<br>Cl<br>API Se|VPC (<br>E<br>Cl<br>API Se|E<br>Cl<br>API Se|KS<br>uster<br><br>Private subnet1 (172.31.32.0/20)<br>Scale out EKS Worker Nodes<br>rver<br>Multi PODs<br>Scale Out|Multi PODs|Multi PODs|Multi PODs|Multi PODs|||||||
|AWS Cloud<br>VPC (<br>E<br>Cl<br>API Se|VPC (<br>E<br>Cl<br>API Se|E<br>Cl<br>API Se|KS<br>uster<br><br>Private subnet1 (172.31.32.0/20)<br>Scale out EKS Worker Nodes<br>rver<br>Multi PODs<br>Scale Out|Scale out EKS Worker Nodes|Scale out EKS Worker Nodes|Scale out EKS Worker Nodes|Scale out EKS Worker Nodes|EKS Node Group1<br>(Autoscaling)|Scale out EKS Worker Nodes|Scale out EKS Worker Nodes|Scale out EKS Worker Nodes|Scale out EKS Worker Nodes|Scale out EKS Worker Nodes|
|AWS Cloud<br>VPC (<br>E<br>Cl<br>API Se|VPC (<br>E<br>Cl<br>API Se|E<br>Cl<br>API Se|KS<br>uster<br><br>Private subnet1 (172.31.32.0/20)<br>Scale out EKS Worker Nodes<br>rver<br>Multi PODs<br>Scale Out|Scale out EKS Worker Nodes|Scale out EKS Worker Nodes|Scale out EKS Worker Nodes||||||||
|||||||||||||||


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-183-full.png)

**사전준비사항**


**1. AWS Network 구성**


**- Public Subnet 2개, Private Subnet 2개**


**- NAT Gateway 1개**


**2. AWS EKS 구성**


**- EKS Cluster 1개, EKS NodeGroup1개(2개Worker Node 생성)**


**- Bastion Server에서EKS 접속**


3


##### **07 .**

Cluster
Autoscaler를
활용한EKS노드
오토스케일링


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-184-full.png)

**실습내용**


**순서**


**1.** **TAG**
**AWS Autoscaling Group내** **설정**


**2. Terraform으로** **IAM Policy 적용**


**3. eksctl로** **IAM Role 및EKS Service Account 적용**


**4. Cluster Autoscaler 배포및설정**


**5.** **Scale-out**
**10개POD 배포및EKS Worker Node 자동** **확인**


**6.** **Scale-in**
**POD 2개로축소및EKS Worker Node 자동** **확인**


**실습예제코드경로**


**>**
**Chapter03** **Ch03_07-cluster-autoscaler**


4


##### **07 .**

Cluster
Autoscaler를
활용한EKS노드
오토스케일링


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-185-full.png)

**1. AWS Autoscaling Group내TAG 설정**


**1. Cluster Autoscaler Tag1**


**>**
**k8s.io/cluster-autoscaler/<EKS Cluster명**

**- Key :**


**- Value : owned**


**2. Cluster Autoscaler Tag2**


**k8s.io/cluster-autoscaler/enabled**

**- Key :**


**- Value : TRUE**


5


##### **07 .**

Cluster
Autoscaler를
활용한EKS노드
오토스케일링


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-186-full.png)

**2. Terraform으로IAM Policy 적용**


**2.1 IAM Policy를Terraform으로생성**


##### **07 .**

Cluster
Autoscaler를
활용한EKS노드
오토스케일링




**- IaC 경로: Ch03_07-cluster-autoscaler > terraform-codes > iam-policy.tf**


**2.2 terraform 명령어실행**


**$ terraform init**


**$ terraform plan**


**$ terraform apply**


6


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-187-full.png)

**3. eksctl로IAM Role 및EKS Service Account 적용**


**3.1 IAM Role 및EKS Service Account 적용**


**$ eksctl create iamserviceaccount \**


**--name cluster-autoscaler \**


**--namespace kube-system \**


**--cluster <EKS Cluster명> \**


##### **07 .**

Cluster
Autoscaler를
활용한EKS노드
오토스케일링



**--attach-policy-arn arn:aws:iam::<AWS 계정ID>: policy/<EFS IAM Policy명> \**


**--approve \**


**--override-existing-serviceaccounts \**


**--region ap-northeast-2**


7


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-188-full.png)

**4. Cluster Autoscaler 배포및설정**


**1.4 Cluster Autoscaler Manifest 확인**


##### **07 .**

Cluster
Autoscaler를
활용한EKS노드
오토스케일링




**- 파일경로: Ch03_06-csi-file-pv > k8s-manifests > cluster-autoscaler.yaml**


**1.5 Cluster Autoscaler 배포실행명령어**


**$ kubectl apply -f cluster-autoscaler.yaml**


8


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-189-full.png)

**5. 10개POD 배포및EKS Worker Node 자동Scale-out 확인**


**5.1 Namespace 구성명령어**


**test-ca**
**$ kubectl create namespace**


**5.2 예제Deployment 배포**


##### **07 .**

Cluster
Autoscaler를
활용한EKS노드
오토스케일링




**- 파일경로: Ch03_07-cluster-autoscaler > k8s-manifests > deploy-pod.yaml**


**- 예제POD 배포: kubectl create ‒f ./deploy-pod.yaml**


**5.3 POD 및Worker Node 개수실시간확인**


**$ kubectl get po -n test-ca -w**


**$ kubectl get no -w**


9


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-190-full.png)

**6. POD 2개로축소및EKS Worker Node 자동Scale-in 확인**


**6.1 POD 2개로축소명령어**


**$ kubectl scale deploy deploy-pod --replicas=2 ‒n test-ca**


**6.2 POD 및Worker Node 개수확인실시간확인**


**$ kubectl get po -n test-ca -w**


**$ kubectl get no -w**


10


##### **07 .**

Cluster
Autoscaler를
활용한EKS노드
오토스케일링


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-191-full.png)
### **4 Kubernetes Manifest 작성을위한Helm 활용**

**01**
**Kubernetes Manifest 작성방법소개**


1


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-192-full.png)
##### **Kubernetes Manifest 작성을위한Helm 활용 01 .**

**Kubernetes**
**Manifest 작성**
**방법소개**

**1.**
**Kubernetes Manifest 작성방법소개**


**2. Kustomize 소개**


**3.** **Manifest**
**[실습] Kustomize을활용한** **배포하기**


**4. Helm Charts 소개**


**5. Helm Values 및** **Template 소개**


**6.** **Manifest**
**[실습] Helm Charts를활용한** **배포하기**


2


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-193-full.png)

**Kubernetes Manifest란?**


**deployment.yaml**


apiVersion: apps/v1
kind: Deployment
metadata:

name: nginx-deployment
spec:

selector:

matchLabels:

app: nginx
minReadySeconds: 5
template:

metadata:

labels:

app: nginx
spec:

containers:

      - name: nginx

image: nginx:1.14.2
ports:

       - containerPort: 80


##### **01 .**

**Kubernetes**
**Manifest 작성**
**방법소개**



3


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-194-full.png)

**Kubernetes Manifest를통한Object 생성/업데이트방법**


**Object 생성/업데이트명령어**


**$ kubectl apply -f <Manifest 파일>**


**Object의생성/업데이트비교명령어(Dry run)**


**$ kubectl diff -f <Manifest 파일>**


**Manifest기반으로생성된Object 생성/업데이트현황출력명령어**


**$ kubectl get -f <Manifest 파일> -o yaml**


4


##### **01 .**

**Kubernetes**
**Manifest 작성**
**방법소개**


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-195-full.png)

**Object 업데이트(Replace)시이전적용된(Applied)사항확인방법**


**kubectl.kubernetes.io/last-applied-configuration에서확인**


apiVersion: apps/v1
kind: Deployment
metadata:


annotations:


# ...
# note that the annotation does not contain replicas
# because it was not updated through apply
kubectl.kubernetes.io/last-applied-configuration: |


##### **01 .**

**Kubernetes**
**Manifest 작성**
**방법소개**



{"apiVersion":"apps/v1","kind":"Deployment",
"metadata":{"annotations":{},"name":"nginx-deployment","namespace":"default"},
"spec":{"minReadySeconds":5,"selector":{"matchLabels":{"app":nginx}},"template":{"metadata":{"labels":{"app":"nginx"}},
"spec":{"containers":[{"image":"nginx:1.14.2","name":"nginx",
"ports":[{"containerPort":80}]}]}}}}
# ...

spec:

replicas: 2 # written by scale
# ...


5


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-196-full.png)

**Kubernetes Manifests별사용방향성**


**Kustomize**


       Kubernetes 선언적


##### **01 .**

**Kubernetes**
**Manifest 작성**
**방법소개**



매니페스트자체를활용,


배포용이


요건에따라
Patch(Replace)


해서내용을수정해


에대한
Kubernetes Object


추가/변경/삭제관리



**Kubernetes**
**Manifests를**
**기반으로하는**
**방식의**
**GitOps**

**배포, 관리**

**체계마련**


6



**Helm Charts**


     Kubernetes 선언적


매니페스트를다양하게구현


가능한 과
template


활용해다양한
values.yaml


방식으로배포관리


배포가능단위의패키지화


하여다양한워크로드대상


배포용이


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-197-full.png)
### **4 Kubernetes Manifest 작성을위한Helm 활용**

**02**
**Kustomize 소개**


1


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-198-full.png)

**Kustomize란?**


##### **02 .**

**Kustomize 소개**



![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-198-0.png)

출처: https://kustomize.io/


2


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-199-full.png)

**Kustomize 기본명령어**


**kustomization 파일을포함하는디렉터리내의리소스확인방법**


**$ kubectl kustomize <kustomization 디렉토리>**


**Kustomize 리소스적용**


**$ kubectl apply --kustomize <kustomization 디렉토리>**


**$ kubectl apply ‒k <kustomization 디렉토리>**


3


##### **02 .**

**Kustomize 소개**


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-200-full.png)

**기본kustomization 파일구성#1**


kustomization.yaml
service.yaml deployment.yaml


apiVersion: apps/v1
kind: Deployment
metadata:


##### **02 .**

**Kustomize 소개**



name: my-nginx
spec:

selector:

matchLabels:

run: my-nginx
replicas: 2
template:

metadata:

labels:

run: my-nginx
spec:

containers:

  - name: my-nginx

image: nginx
ports:

  - containerPort: 80



resources:

- deployment.yaml

- service.yaml



apiVersion: v1
kind: Service
metadata:

name: my-nginx
labels:

run: my-nginx
spec:

ports:

 - port: 80

protocol: TCP
selector:

run: my-nginx


4


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-201-full.png)

**기본kustomization 파일구성#2**


**Kustomize 방식의Manifest를Kubernetes에적용하는방법**


**$ kubectl apply --kustomize <Kustomization 디렉토리>**


**Kustomization 디렉토리구조**


~/someApp
├── deployment.yaml
├── kustomization.yaml
└── service.yaml


5


##### **02 .**

**Kustomize 소개**


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-202-full.png)

**커스텀kustomization 파일구성**


##### **02 .**

**Kustomize 소개**







|patchesStrategicMerge|patchesJson6902|
|---|---|
|•<br>패치하려는대상을Kustomization에병합하여패치를<br>수행하는방식(대상은파편화, 조각화된패치)|•<br>kubernetes object의변경을JSONPatch 규약을따름<br>•<br>https://datatracker.ietf.org/doc/html/rfc6902|
|•<br>패치하려는Patch Manifest 내부의Object 네임은반드시<br>대상으로지정한리소스네임과기본템플릿과일치해야함|•<br>패치하려는대상의정보는Patch Manifest 내부의Object<br>path에맞춰서value값을입력|
|•<br>Manifest당Object를교체/병합/삭제하는패치가권장됨|•<br>Json 패치의정확한리소스를찾기위해, 리소스의group,<br>version, kind, name을kustomization.yaml 내에명시|


6


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-203-full.png)

**patchesStrategicMerge 방식#1**


##### **02 .**

**Kustomize 소개**



|설정 항목|설정 내용|설정 예|
|---|---|---|
|**replace**|replace를포함하는요소가병합되는대신대체|containers:<br>- name: nginx<br>image: nginx-1.0<br>- $patch: replace|
|**merge**|merge를포함하는요소가대체되는대신병합|containers:<br>- name: nginx<br>image: nginx-1.0<br>- name: log-tailer<br>image: fluentd:latest|
|**delete**|delete를포함하는요소가삭제|containers:<br>- name: nginx<br>image: nginx-1.0<br>- $patch: delete<br>name: log-tailer|


7




![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-204-full.png)

**patchesStrategicMerge 방식#2**


##### **02 .**

**Kustomize 소개**



deployment.yaml
kustomization.yaml set_memory.yaml incr_replica.yaml


apiVersion: apps/v1
kind: Deployment
metadata:



name: my-nginx
spec:

selector:

matchLabels:

run: my-nginx
replicas: 2
template:

metadata:

labels:

run: my-nginx
spec:

containers:

  - name: my-nginx

image: nginx
ports:

  - containerPort: 80



resources:

deployment.yaml
patchesStrategicMerge:

incr_replica.yaml

set_memory.yaml



apiVersion: apps/v1
kind: Deployment
metadata:

name: my-nginx
spec:

template:

spec:

containers:

  - name: my-nginx


resources:

limits:

memory: 512Mi



apiVersion: apps/v1
kind: Deployment
metadata:

name: my-nginx
spec:

replicas: 3



8


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-205-full.png)

**patchesJson6902 방식#1**


##### **02 .**

**Kustomize 소개**







|설정 항목|설정 내용|설정 예|
|---|---|---|
|**add**|path에명시된value를추가|- op: add<br>path: /spec/replicas<br>value: 2|
|**replace**|path에명시된value가대체|- op: replace<br>path: /spec/replicas<br>value: 3|
|**remove**|path에명시된value가삭제|- op: remove<br>path: /spec/replicas|


9


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-206-full.png)

**patchesJson6902 방식#2**


patch.yaml deployment.yaml
kustomization.yaml


apiVersion: apps/v1
kind: Deployment
metadata:


##### **02 .**

**Kustomize 소개**



resources:

deployment.yaml


patchesJson6902:

- target:

group: apps
version: v1
kind: Deployment
name: my-nginx
path: patch.yaml




- op: replace

path: /spec/replicas
value: 3


10



name: my-nginx
spec:

selector:

matchLabels:

run: my-nginx
replicas: 2
template:

metadata:

labels:

run: my-nginx
spec:

containers:

  - name: my-nginx

image: nginx
ports:

  - containerPort: 80


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-207-full.png)

**Kustomize 사용방법‒ Base와Overlay 디렉토리구성#1**


**Base 및Overlay를사용한수정된Manifest를적용하는방법**


**$ kubectl apply --kustomize <Base or Overlay 디렉토리>**


**Overlay를사용한수정파일디렉토리구조**


~/someApp
├── base
│  ├── deployment.yaml
│  ├── kustomization.yaml
│  └── service.yaml
└── overlays

├── dev
│  ├── cpu_count.yaml
│  ├── kustomization.yaml
│  └── replica_count.yaml
└── prod

├── cpu_count.yaml
├── kustomization.yaml
└── replica_count.yaml


11


##### **02 .**

**Kustomize 소개**


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-208-full.png)

**Kustomize 사용방법‒ Base와Overlay 디렉토리구성#2 (Base)**


kustomization.yaml
service.yaml deployment.yaml


##### **02 .**

**Kustomize 소개**



apiVersion: apps/v1
kind: Deployment
metadata:

name: my-nginx
spec:

selector:

matchLabels:

run: my-nginx
replicas: 2
template:

metadata:

labels:

run: my-nginx
spec:

containers:

  - name: my-nginx

image: nginx



resources:

- deployment.yaml

- service.yaml



apiVersion: v1
kind: Service
metadata:

name: my-nginx
labels:

run: my-nginx
spec:

ports:

 - port: 80

protocol: TCP
selector:

run: my-nginx


12


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-209-full.png)

**Kustomize 사용방법‒ Base와Overlay 디렉토리구성#3 (Overlay)**


dev/kustomization.yaml prod/kustomization.yaml


##### **02 .**

**Kustomize 소개**



bases:

- ../base
namePrefix: dev


bases:

- ../base
namePrefix: prod


13


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-210-full.png)
### **4 Kubernetes Manifest 작성을위한Helm 활용**

**03**
**Kustomize을활용한Manifest 배포하기**


1


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-211-full.png)

**실습내용**


**순서**


**1. kubernetes manifest 기본명령어수행**


**2. kustomize 기본명령어수행**


**3. kustomize patchesStrategicMerge 패치수행**


**4. kustomize patchesJson6902 패치수행**


**5. kustomize base,** **패치수행**
**overlay**


**실습예제코드경로**


**>**
**Chapter04** **Ch04_03-kustomize**


2


##### **03 .**

**Kustomize을**
**활용한Manifest**
**배포하기**


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-212-full.png)

**1. kubernetes manifest 기본명령어수행#1**


**kubernetes object 생성명령어**


**$ kubectl apply -f <Manifest 파일>**


**kubernetes object 비교방법(Dry-Run)**


**$ kubectl diff -f <Manifest 파일>**


**kubernetes object 상세정보출력명령어**


**$ kubectl get -f <Manifest 파일> -o yaml**


**실습예제코드경로**


**Chapter04 > Ch04_03-kustomize > 01-kubernetes-manifest**


3


##### **03 .**

**Kustomize을**
**활용한Manifest**
**배포하기**


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-213-full.png)

**1. kubernetes manifest 기본명령어수행#2**


**kubernetes object 비교방법(Dry-Run)**


**$ kubectl diff -f <Manifest 파일>**


**kubernetes object 업데이트명령어**


**$ kubectl apply -f <Manifest 파일>**


**kubernetes object 삭제명령어**


**$ kubectl delete -f <Manifest 파일>**


**실습예제코드경로**


**Chapter04 > Ch04_03-kustomize > 01-kubernetes-manifest**


4


##### **03 .**

**Kustomize을**
**활용한Manifest**
**배포하기**


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-214-full.png)

**2. kustomize 기본명령어수행**


**kustomize 기반object 확인방법(Dry-Run)**


**$ kubectl kustomize <kustomization 디렉토리>**


**kustomize 기반object 생성명령어**


**$ kubectl apply --kustomize <kustomization 디렉토리>**


**Kustomize 기반object 삭제명령어**


**$ kubectl delete --kustomize <kustomization 디렉토리>**


**실습예제코드경로**


**Chapter04 > Ch04_03-kustomize > 02-kustomize-manifest**


5


##### **03 .**

**Kustomize을**
**활용한Manifest**
**배포하기**


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-215-full.png)

**3. kustomize patchesStrategicMerge 패치수행**


**kustomize 기반object 확인방법(Dry-Run)**


**$ kubectl kustomize <kustomization 디렉토리>**


**kustomize 기반object 생성명령어**


**$ kubectl apply --kustomize <kustomization 디렉토리>**


**Kustomize 기반object 삭제명령어**


**$ kubectl delete --kustomize <kustomization 디렉토리>**


**실습예제코드경로**


##### **03 .**

**Kustomize을**
**활용한Manifest**
**배포하기**



**>** **>**
**Chapter04** **Ch04_03-kustomize** **03-kustom-patchesStrategicMerge**


6


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-216-full.png)

**4. kustomize patchesJson6902 패치수행**


**kustomize 기반object 확인방법(Dry-Run)**


**$ kubectl kustomize <kustomization 디렉토리>**


**kustomize 기반object 생성명령어**


**$ kubectl apply ‒k <kustomization 디렉토리>**


**Kustomize 기반object 삭제명령어**


**$ kubectl delete -k <kustomization 디렉토리>**


**실습예제코드경로**


**>** **>**
**Chapter04** **Ch04_03-kustomize** **04-kustom-patchesJson6902**


7


##### **03 .**

**Kustomize을**
**활용한Manifest**
**배포하기**


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-217-full.png)

**5. kustomize base, overlay 패치수행#1**


**base**
**디렉터리로생성될base kustomize 기반object 확인방법(Dry-Run)**


**$ kubectl kustomize ./base**


**base kustomize 기반object 생성명령어**


**$ kubectl apply ‒k ./base**


**base Kustomize 기반object 삭제명령어**


**$ kubectl delete -k ./base**


**실습예제코드경로**


**>** **>**
**Chapter04** **Ch04_03-kustomize** **05-kustom-base-overlay**


8


##### **03 .**

**Kustomize을**
**활용한Manifest**
**배포하기**


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-218-full.png)

**5. kustomize base, overlay 패치수행#2**


**overlay ‒ dev 디렉토리내kustomize 기반object Dry-Run 및생성**


**$ kubectl kustomize ./dev**


**$ kubectl apply ‒k ./dev**


**overlay ‒ prod 디렉토리내kustomize 기반object Dry-Run 및생성**


**$ kubectl kustomize ./prod**


**$ kubectl apply ‒k ./prod**


**실습예제코드경로**


**>** **>**
**Chapter04** **Ch04_03-kustomize** **05-kustom-base-overlay**


9


##### **03 .**

**Kustomize을**
**활용한Manifest**
**배포하기**


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-219-full.png)

**5. kustomize base, overlay 패치수행#3**


**overlay ‒ dev 디렉토리내kustomize 기반object 삭제**


**$ kubectl delete ‒k ./dev**


**overlay ‒ prod 디렉토리내kustomize 기반object 삭제**


**$ kubectl delete ‒k ./prod**


**실습예제코드경로**


**>** **>**
**Chapter04** **Ch04_03-kustomize** **05-kustom-base-overlay**


10


##### **03 .**

**Kustomize을**
**활용한Manifest**
**배포하기**


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-220-full.png)
### **4 Kubernetes Manifest 작성을위한Helm 활용**

**04**
**Helm Charts 소개**


1


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-221-full.png)
###### **Helm이란?**


##### **04 .**

**Helm Charts**
**소개**



![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-221-0.png)

출처: https://devopscube.com/install-configure-helm-kubernetes/


2


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-222-full.png)
###### **Helm 특징**

|구분|설명|
|---|---|
|관리복잡성해소|•<br>Helm Chart는복잡한애플리케이션을쉽게설치및반복설치하도록패키징<br>•<br>Helm을통해여러오브젝트를한번에배포하도록구성하여관리복잡성해소|
|업데이트용이|•<br>배포된애플리케이션에대한설정변경후업데이트나CLI 옵션을통한업데이트용이<br>•<br>Helm Upgrade 명령어를통해업데이트가능|
|쉬운공유|•<br>Helm 차트는개인, 공용의커스텀Helm Repository에패키징해쉬운공유및제공<br>•<br>공식적인특정Helm Repository에서공개된차트로Kubernetes에바로배포|
|버전관리|•<br>Helm을통해서설치하고업데이트할때마다Revision으로버전관리<br>•<br>Helm Rollback 명령어를이용하여쉽게이전버전으로Rollback|



3


##### **04 .**

**Helm Charts**
**소개**


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-223-full.png)

**Helm의주요개념**


**1.**
**Chart (패키지)**


**2.**
**Repository (저장소)**


**3.**
**Release (인스턴스)**


**연계방식**


##### **04 .**

**Helm Charts**
**소개**




**- Kubernetes 내부에** **Helm Chart를원하는** **Repository에서검색후설치>**


**각설치에따른새로운** **Release 생성**


4


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-224-full.png)

**Helm 설치#1**


**Mac에서설치(패키지관리자)**


**$ brew install helm**


**리눅스에서설치**


**$ curl -fsSL -o get_helm.sh**


##### **04 .**

**Helm Charts**
**소개**



**https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3**


**$ chmod 700 get_helm.sh**


**$ ./get_helm.sh**


5


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-225-full.png)

**Helm 설치#2**


**윈도우에서설치(다운로드)**


**$ https://get.helm.sh/helm-canary-windows-amd64.zip**


**- Zip 압축풀고, helm.exe 사용**


**윈도우에서설치(패키지관리자)**


**$ choco install kubernetes-helm**


**설치확인**


**$ helm version**


6


##### **04 .**

**Helm Charts**
**소개**


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-226-full.png)

**Helm Repository 주소**


**Helm Stable Repository의주소**


**https://charts.helm.sh/stable**


**Bitnami Kubernetes OpenSource Repository의주소**


**https://charts.bitnami.com/bitnami**


**AWS EKS 관련Repository의주소**


**https://aws.github.io/eks-charts**


7


##### **04 .**

**Helm Charts**
**소개**


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-227-full.png)

**Helm Repository 관련명령어**


**Repository 추가**


**$ helm repo add [Repository명] [Repository URL]**


**Repository 조회**


**$ helm repo list**


**Repository 삭제**


**$ helm repo remove [Repository명]**


8


##### **04 .**

**Helm Charts**
**소개**


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-228-full.png)

**Helm Repository 관련명령어**


**Repository 정보업데이트**


**$ helm repo update**


**Repository 내chart 조회**


**$ helm search repo [공식Helm Charts 릴리즈명]**


9


##### **04 .**

**Helm Charts**
**소개**


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-229-full.png)

**Helm Chart 설치명령어**


**helm chart 설치(Repo 참조)**


##### **04 .**

**Helm Charts**
**소개**



**$ helm install [Helm Repository명]/[공식Helm Chart 릴리즈명] [옵션]**


**helm chart 설치(파일참조)**


**$ helm install [배포될Helm Chart 릴리즈명] [Helm Chart 파일경로]**


**자주사용되는옵션**

|옵션명|설명|
|---|---|
|--version|chart의버전을지정한다. Chart.yaml 안에version 정보를참조|
|--set|해당옵션으로values.yaml 값을동적으로설정|
|--namespace|chart가설치될네임스페이스를지정|



10


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-230-full.png)

**배포된Helm Chart확인명령어**


**배포된Helm Chart 릴리즈목록확인**


**$ helm list**


**$ helm ls**


**배포된특정Helm Chart 릴리즈상태및제공도움말확인**


**$ helm status [배포된특정Helm Chart 릴리즈명]**


11


##### **04 .**

**Helm Charts**
**소개**


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-231-full.png)

**Helm 버전관리명령어#1**


**Helm Chart 업데이트(Repo 참조)**


##### **04 .**

**Helm Charts**
**소개**



**$ helm upgrade [배포된Helm Chart 릴리즈명] [Helm Repository명]/[공식Helm**


**Chart 릴리즈명] [옵션]**


**Helm Chart 업데이트(파일참조)**


**$ helm upgrade [배포된Helm Chart 릴리즈명] [Helm Chart 파일경로]**


12


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-232-full.png)

**Helm 버전관리명령어#2**


**Helm Chart 버전히스토리확인**


**$ helm history [배포된Helm Chart 릴리즈명]**


**Helm Chart 버전Rollback**


##### **04 .**

**Helm Charts**
**소개**



**$ helm rollback [배포된Helm Chart 릴리즈명] [Rollback 할Revision 번호]**


13


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-233-full.png)

**Helm 기타명령어**


**Helm Charts Fetch**


##### **04 .**

**Helm Charts**
**소개**



**$ helm fetch --untar [Helm Repository명]/[공식Helm Chart 릴리즈명]**


**--version [Helm Chart 버전]**


**- Fetch후압축이해제된상태의Helm Chart 디렉토리확인**


**helm 릴리즈삭제**


**$ helm delete [배포된Helm Chart 릴리즈명]**


**$ helm uninstall [배포된Helm Chart 릴리즈명]**


14


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-234-full.png)
### **4 Kubernetes Manifest 작성을위한Helm 활용**

**05**
**Helm Values 및Template 소개**


1


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-235-full.png)

**Helm Chart 생성**


**Helm Chart 생성명령어**


**$ helm create [Helm Chart명]**


**Helm Chart create후디렉토리구조**


##### **05 .**

**Helm Values 및**
**Template 소개**



2



![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-235-0.png)
![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-236-full.png)

**Helm Chart의파일구조**


##### **05 .**

**Helm Values 및**
**Template 소개**



|파일명<br>(디렉토리명/)|설명|
|---|---|
|Chart.yaml|Helm Chart에대한이름, 버전, 설명이설정된파일|
|charts/|Helm Chart에서참조해서사용할특정Helm Charts 패키지를저장하는디렉토리|
|values.yaml|Helm Chart의변수값을설정된파일|
|templates/|Template Manifest 파일저장디렉토리|
|_helpers.tpl|Template Manifest에서공용으로사용하는변수값정의및구현하는파일|
|NOTES.txt|Helm install, upgrade, status시출력되는도움말혹은정보를조합해출력하는파일|
|*.yaml|Helm Charts로릴리즈배포할Kubernetes Object의Template Manifest 파일|


3


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-237-full.png)

**Chart.yaml의적용항목**


##### **05 .**

**Helm Values 및**
**Template 소개**







|항목|설명|
|---|---|
|apiVersion|• Helm자체의API Version으로Helm3부터는v2 지원(Required)|
|name|• Helm Chart명(Required)|
|description|• Helm Chart의설명(Optional)<br>|
|type|•~~ Helm Chart의유형. 유형은application 및library중택1 (Required)~~<br>• application은버전이지정된아카이브로패키징할수있는템플릿모음, 배포O<br>• library는chart 개발시필요한유틸리티혹은기능을제공, 템플릿이없으므로배포X<br>|
|version|•~~ Helm Chart버전으로SemVer(Semantic Versioning)규칙을준수해야함(Required)~~<br>• 버전형태는숫자로된x.y.z 형식이여야함(https://semver.org/lang/ko/)<br>|
|appVersion|•~~ Helm Charts에서제공되는App 버전이며, SemVer형식을따르지않아도됨(Optional)~~<br>• 보통은배포될App Container Image의버전(Tag)를명시|


4


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-238-full.png)

**values.yaml 적용항목**


##### **05 .**

**Helm Values 및**
**Template 소개**



![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-238-0.png)

5


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-239-full.png)

**template/*.yaml 내적용항목**


##### **05 .**

**Helm Values 및**
**Template 소개**



|항목|설명|
|---|---|
|.values|values.yaml 파일에서설정된변수값구현|
|.Charts|Chart.yaml 파일에서설정된변수값구현<br>|
|.Release|~~배포할때할당된정보를변수로구현~~<br>(ex. Helm Charts 릴리즈명을nginx로할경우.Release.Name에nginx로구현)|
|include|_helpers.tpl에서설정된변수값구현|
|if ~ end|if문(statement) 구현(구문안에else 적용가능, if not 형태로적용가능)|
|with ~ end|변수에대한범위(scope)를지정, 해당범위는.아래설정된변수값을구현|
|nindent|들여쓰기적용공백수(char 단위)|
|toYaml|구현된변수를yaml형식으로변경|
|default|기본적으로구현되는변수|
|quote|변수값이string type으로구현|


6


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-240-full.png)

**Helm Chart 코드문법스캔**


**Helm Chart 코드문법스캔명령어**


**$ helm lint [Helm Chart 디렉토리경로]**


**Helm Chart 코드문법정상결과**

![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-240-0.png)


**Helm Chart 코드문법비정상결과(예)**

![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-240-1.png)


7


##### **05 .**

**Helm Values 및**
**Template 소개**


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-241-full.png)

**Helm Charts 렌더링(Dry-Run)**


**Helm Chart 렌더링(Dry-Run) 명령어**

###### **$ helm template [Helm Chart 디렉토리경로]**


8


##### **05 .**

**Helm Values 및**
**Template 소개**



![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-241-0.png)
![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-242-full.png)

**Helm Charts 패키징**


**Helm Chart 패키징명령어**


**$ helm package [Helm Chart 디렉토리경로]**

![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-242-0.png)


9


##### **05 .**

**Helm Values 및**
**Template 소개**


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-243-full.png)

**Helm Chart Test 수행**


**Helm Chart Test 수행명령어**

###### **$ helm test [Helm Chart 릴리즈명]**


##### **05 .**

**Helm Values 및**
**Template 소개**



![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-243-0.png)

10


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-244-full.png)

**Helm Chart 내Chart.yaml에설정된정보확인**


**Helm Chart 내Chart.yaml에설정된정보확인명령어**


**$ helm show chart [Helm Chart 디렉토리경로]**

![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-244-0.png)


11


##### **05 .**

**Helm Values 및**
**Template 소개**


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-245-full.png)

**Helm Chart 내Chart.yaml 및values.yaml에설정된정보확인**


**Helm Chart 내Chart.yaml 및values.yaml에설정된정보확인명령어**


**$ helm show all [Helm Chart 디렉토리]**


12


##### **05 .**

**Helm Values 및**
**Template 소개**



![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-245-0.png)
![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-246-full.png)
### **4 Kubernetes Manifest 작성을위한Helm 활용**

**06**
**Helm Charts를활용한Manifest 배포하기**


1


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-247-full.png)

**실습내용**


**순서**


**1. Helm Chart 배포/관리** **명령어수행**


**2. Helm Chart 파일** **확인**


**3. Helm Chart 코드작성** **명령어수행**


**4. Helm Chart 코드테스트** **수행**


**실습예제코드경로**


**>**
**Chapter04** **Ch04_06-helm-charts**


2


##### **06 .**

**Helm Charts를**
**활용한Manifest**
**배포하기**


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-248-full.png)
### **5 Kubernetes 배포를위한GitHub와ArgoCD 활용**

**01**
**Git을활용한Kubernetes 배포방법소개**


1


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-249-full.png)
###### **Kubernetes 배포를위한GitHub와ArgoCD 활용**

**1.**
**Git을활용한Kubernetes 배포방법소개**


**2. [실습] Github Repository 생성및설정**


**3. Kubernetes**
**배포도구(ArgoCD, ArgoRollout) 소개**


**4.**
**[실습]** **구성**
**ArgoCD**


**5.** **Manifest**
**[실습] ArgoCD를활용한Kubernetes** **배포**


**6.**
**[실습] ArgoRollout 구성**


**7.**
**[실습] Argo Rollout을활용한** **무중단** **배포**


2


##### **01 .**

**Git을활용한**
**Kubernetes**
**배포방법소개**


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-250-full.png)

**Git을활용한Kubernetes 배포방법의아이디어**


**Kubernetes 배포방법**


##### **01 .**

**Git을활용한**
**Kubernetes**
**배포방법소개**




**- K8s는** **Manifest 기반의** **선언적** **코드를명시해** **배포할대상을특정** **Object로구현**


**Git 활용**


**- 코드를저장하고** **버전을관리하여코드의** **형상을관리할수있음**


**Git을활용한Kubernetes 배포방법의아이디어**


**-**
**Git의저장한Manifest 기반의** **선언적** **코드로Kubernetes 관리가가능하지않을까?**


**- Manifest 기반의** **선언적** **코드들은Git에서** **버전** **관리가가능하지않을까?**


**- K8s Manifest로배포된K8s Object의실행상태의** **형상** **관리가가능하지않을까?**


3


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-251-full.png)

**GitOps란?**


**GitOps의기원**


**GitOps 개념은2017년** **Weaveworks에서최초로제안함**


**GitOps의목표**


**1. 시스템외부의모델을** **소스로사용하여Kubernetes의** **운영을자동화**


**2. GitOps를** **활용해K8s 기반의플랫폼, 서비스, 앱을** **관리하는데사용**


##### **01 .**

**Git을활용한**
**Kubernetes**
**배포방법소개**



**3. 시스템과** **상호작용하는다양한이해관계자를고려하고업무를명확하게** **분리**


4


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-252-full.png)

**Git기반CI/CD 및운영사이클**

![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-252-0.png)


출처: https://www.weave.works/blog/what-is-gitops-really


5


##### **01 .**

**Git을활용한**
**Kubernetes**
**배포방법소개**


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-253-full.png)

**GitOps 원칙#1**


  **OpenGitOps 기준으로GitOps를** **구현할때의표준및구조화된** **방식을제안**


**-**
**https://opengitops.dev/**


  **선언적원하는상태(Desired State)원칙**


##### **01 .**

**Git을활용한**
**Kubernetes**
**배포방법소개**




**- GitOps 관리시스템은사용자와플랫폼이모두읽고쓸수있는** **선언적** **코드로표현된**


**원하는상태(Desired State)를가져야함**


**불변한원하는상태(Desired State)버전원칙**


**- 원하는상태(Desired State)는버전관리및버전의** **불변성을지원하고완전한버전**


**기록을유지하는방식으로저장해** **형상을관리**


6


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-254-full.png)

**GitOps 원칙#2**


  **지속적인상태조정원칙**


##### **01 .**

**Git을활용한**
**Kubernetes**
**배포방법소개**




**- GitOps 관리시스템은플랫폼의실제** **배포된상태를원하는상태(Desired State)와**


**지속적으로** **자동으로비교함**


**- 실제배포된상태와원하는상태(Desired State)가다른경우, 이를** **일치시키기위한**


**자동화** **작업진행**


**선언을통한작동원칙**


**- 플랫폼이의도적으로작동되는유일한** **메커니즘은GitOps 원칙을통해서만가능**


7


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-255-full.png)

**GitOps 상태사이클**


##### **01 .**

**Git을활용한**
**Kubernetes**
**배포방법소개**



![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-255-0.png)

출처: https://www.weave.works/technologies/gitops/


8


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-256-full.png)

**GitOps 관리를위한Git Repository 구성**


     **GitOps Repository**


**코드**

**- 아래3개의Repository를** **제어, 실행을위한** **관리**


     **Platform Repository**


**IaC 코드**

**- 플랫폼및Kubernetes 프로비저닝을위한** **관리**


     **Management Repository**


**- Kubernetes 관리를위한설정, 플러그인, 시스템** **배포코드** **관리**


     **Service Repository**


**- 컨테이너기반의서비스앱개발** **소스코드** **관리**


9


##### **01 .**

**Git을활용한**
**Kubernetes**
**배포방법소개**


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-257-full.png)

**GitOps 관리를위한Git Repository 구성도**


##### **01 .**

**Git을활용한**
**Kubernetes**
**배포방법소개**



![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-257-2.png)

**Git Organization Repositories** **External Repositories**



GitOps Repository



![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-257-0.png)

Platform Git Repository


Management Git Repository


Service Git Repository


10





![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-257-1.png)
![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-258-full.png)
### **5 Kubernetes 배포를위한GitHub와ArgoCD 활용**

**02**
**Github Repository 생성및설정**


1


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-259-full.png)

**실습내용**


**순서**


**1. Github Repository 구성설계**


**2. SSH 관리를위한** **Key 생성** **및** **Github 등록**


**3.**
**gitops-repository 구성** **확인**


**4.**
**platform-repository 구성** **확인**


**5. GitOps를통한** **Terraform으로AWS 인프라/플랫폼** **프로비저닝**


**실습예제코드경로**


**Chapter05**


2


##### **02 .**

**Github**
**Repository**
**생성및설정**


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-260-full.png)

**1. Github Repository 구성설계#1**


**main Branch (Production Env.)**


##### **02 .**

**Github**
**Repository**
**생성및설정**



![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-260-2.png)









![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-260-0.png)



3



![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-260-1.png)
![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-261-full.png)

**1. Github Repository 구성설계#2**


**main Branch (Prod Env.)** **staging Branch (QA Env.)**

![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-261-0.png)

![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-261-1.png)


**develop Branch (Dev Env.)** **sandbox Branch (Test Env.)**

![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-261-2.png)


4


##### **02 .**

**Github**
**Repository**
**생성및설정**



![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-261-3.png)
![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-262-full.png)

**2. SSH 관리를위한Key 생성및Github 등록#1**


**SSH 관리를위한Key 생성**


##### **02 .**

**Github**
**Repository**
**생성및설정**



**$ ssh-keygen -q -t rsa -N '' -m PEM -t rsa -b 4096 -C test -f ./id_rsa <<<y >/dev/null 2>&1**


**생성후OS별SSH를Agent에등록방법(등록이되어야항상SSH로Git 접근이가능)**


**-**
**MAC OS**


**$ ssh-add id_rsa**


**-**
**Linux**


**1.** **$**
**eval `ssh-agent`**


**2.** **$ ssh-add id_rsa**


5


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-263-full.png)

**2. SSH 관리를위한Key 생성및Github 등록#2**


**Github 등록방법**


**1. Github 로그인후** **> 우측상단** **아이콘클릭** **> 맨아래서2번째위"Settings" 클릭**


**2. 좌측메뉴중중간에Access > SSH and GPG keys 클릭**


##### **02 .**

**Github**
**Repository**
**생성및설정**



**3. 우측상단"New SSH key" 클릭** **> Title은식별가능한이름으로, Key는위에서생성한**


**id_rsa.pub의Key 내용을복사, 붙여넣기** **> "Add SSH key" 버튼을눌러생성완료**


**4. 우측상단클릭** **> "Your repositories" 클릭** **> 특정Repository 클릭** **> 중간우측에있는**


**"**
**Code" 버튼클릭** **> Clone > SSH 내역복사(git@github.com:본인의** **repository 주소)**


**5. 터미널에서특정디렉토리로이동** **> git clone (git@github.com:본인의** **repository 주소)**


**6. 정상적으로** **git clone이되었는지확인**


6


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-264-full.png)

**3. gitops-repository 구성확인#1**


.


├── README.md


├──
management


│├── argo-cd


││├── manifests


│││└── kustomization.yaml


││└── scripts


││ └── setup.sh


│└── argo-rollout


│ ├── manifests


│ │└── kustomization.yaml


│ └── scripts


│ └── setup.sh


##### **02 .**

**Github**
**Repository**
**생성및설정**



├── platform


│└── aws


│ └── ap-northeast-2


│ ├── terraform-backend


│ │└── iac.tf


│ └── terraform-codes


│ └── iac.tf


└── service


├── bubblepool


│└── application.yaml


└── guestbook


└── application.yaml



7


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-265-full.png)

**3. gitops-repository 구성확인#2**


**Service Github Repository 참조방식(ArgoCD > application.yaml)**


**git@github.com:<사용자Org명>/service-repository.git**


##### **02 .**

**Github**
**Repository**
**생성및설정**



**Management Github Repo 참조방식(Kustomize > Kustomization.yaml)**


**https://github.com/<사용자Org명>/management-repository//argo-**


**cd?ref=main**


**Platform Github Repository 참조방식(Terraform > iac.yaml)**


**git@github.com:<사용자Org명>/platform-repository.git//aws/ap-**


**northeast-2/terraform-backend?ref=main**


8


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-266-full.png)

**4. platform-repository 구성확인**


.


├── README.md


└── aws


└── ap-northeast-2


├── terraform-backend


├── providers.tf


├── terraform-backend.tf


└── variables.tf



└── terraform-codes


├── eks-cluster.tf


├── eks-nodegroup.tf


├── iam-roles.tf


├── internet_gateway.tf


├── providers.tf


├── route_table.tf


├── route_table_association.tf


├── security-group.tf


├── subnet.tf


├── variables.tf


└── vpc.tf


##### **02 .**

**Github**
**Repository**
**생성및설정**



9


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-267-full.png)

**5. GitOps를통한Terraform으로AWS 인프라/플랫폼프로비저닝**


**terraform 초기화명령어(Init)**


**$ terraform init**


**terraform 코드문법확인및실행검증(Dry-Run)**


**$ terraform plan**


**terraform 프로비저닝수행및리소스생성(Run)**


**$ terraform apply**


10


##### **02 .**

**Github**
**Repository**
**생성및설정**


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-268-full.png)
### **5 Kubernetes 배포를위한GitHub와ArgoCD 활용**

**03**
**Kubernetes 배포도구(ArgoCD, ArgoRollout) 소개**


1


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-269-full.png)
###### **ArgoCD란?**


##### **03 .**

**Kubernetes**
**배포**
**도구(ArgoCD,**
**ArgoRollout)**
**소개**



![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-269-0.png)

출처: https://argo-cd.readthedocs.io/en/stable/


2


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-270-full.png)
###### **ArgoCD 특징**


     지정된대상환경에애플리케이션 자동배포


     다양한방식의 템플릿Manifest 지원(Kustomize, Helm, Plain-YAML)


     Git Repository 내커밋된애플리케이션대상 업데이트/롤백


     GitOps기준의 원하는상태(Desired State)로자동또는수동 동기화


     애플리케이션배포/실행상태의 실시간동기화/헬스체크를제공하는 웹UI


     다양한Git 저장소의 Webhook 지원(GitHub, BitBucket, GitLab)


3


##### **03 .**

**Kubernetes**
**배포**
**도구(ArgoCD,**
**ArgoRollout)**
**소개**


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-271-full.png)
###### **ArgoCD Web UI**


##### **03 .**

**Kubernetes**
**배포**
**도구(ArgoCD,**
**ArgoRollout)**
**소개**



![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-271-1.png)

4



![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-271-0.png)
![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-272-full.png)
###### **Argo Rollout이란?**


##### **03 .**

**Kubernetes**
**배포**
**도구(ArgoCD,**
**ArgoRollout)**
**소개**



![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-272-0.png)

출처: https://argoproj.github.io/argo-rollouts/architecture/


5


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-273-full.png)
###### **Argo Rollout 특징**


     Blue/Green 배포 지원


     Canary 배포 지원


     세분화된가중치적용 트래픽라우팅


     자동화된 롤백적용 가능


     Ingress Controller 통합: AWS ALB, NGINX등


     Service Mesh 통합: Istio, Linkerd, SMI등


6


##### **03 .**

**Kubernetes**
**배포**
**도구(ArgoCD,**
**ArgoRollout)**
**소개**


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-274-full.png)
###### **Argo Rollout UI**


##### **03 .**

**Kubernetes**
**배포**
**도구(ArgoCD,**
**ArgoRollout)**
**소개**



![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-274-0.png)

7



![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-274-1.png)
![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-275-full.png)
###### **Argo Rollout 배포방식‒ Blue/Green 배포**

![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-275-0.png)

출처: https://argoproj.github.io/argo-rollouts/concepts/


8


##### **03 .**

**Kubernetes**
**배포**
**도구(ArgoCD,**
**ArgoRollout)**
**소개**


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-276-full.png)
###### **Argo Rollout 배포방식‒ Canary 배포**

![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-276-0.png)

출처: https://argoproj.github.io/argo-rollouts/concepts/


9


##### **03 .**

**Kubernetes**
**배포**
**도구(ArgoCD,**
**ArgoRollout)**
**소개**


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-277-full.png)
###### **Argo Rollout Canary 배포실행예**

![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-277-0.png)

출처: https://argoproj.github.io/argo-rollouts/getting-started/


10


##### **03 .**

**Kubernetes**
**배포**
**도구(ArgoCD,**
**ArgoRollout)**
**소개**


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-278-full.png)

**CI/CD Pipeline에서의ArgoCD와Argo Rollout 적용**


**Jenkins**


##### **03 .**

**Kubernetes**
**배포**
**도구(ArgoCD,**
**ArgoRollout)**
**소개**


**Container**
**Image Push**



![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-278-0.png)



**(CI)**





**PR Merge**
**(Commit & Push)**


**GitHub Repo**
**(K8s Manifests)**



11


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-279-full.png)
### **5 Kubernetes 배포를위한GitHub와ArgoCD 활용**

**04**
**ArgoCD 구성**


1


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-280-full.png)

**실습내용**


**순서**


**1. ArgoCD 설치및Web UI 접속**


**2. Repository 및SSH 설정**


**실습예제코드경로**


**Chapter05**


##### **04 .**

**ArgoCD 구성**



2


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-281-full.png)

**1. ArgoCD 설치및Web UI 접속명령어**


**ArgoCD 설치스크립트경로**


**- gitops-repository > management > argo-cd > scripts > setup.sh**


**$ chmod +x setup.sh && ./setup.sh**


**-**
**최종출력되는난수가ArgoCD Web UI의admin 패스워드**


**Web UI 접속**


**$ kubectl get svc argocd-server ‒n argocd**


**-**
**LoadBalancer DNS 주소를웹브라우저에입력후접속**


3


##### **04 .**

**ArgoCD 구성**


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-282-full.png)

**2. Repository 및SSH 설정**


**Repository 및SSH 설정경로**


##### **04 .**

**ArgoCD 구성**



**-**
**>** **>**
**좌측톱니바퀴** **1번째탭Repositories** **상단1번째탭"Connect repo using SSH" 클릭**


**Connect repo using SSH 입력정보**


**- Project : default**


**- Repository URL : git@github.com:<사용자Org명>/service-repository.git**


**- SSH private key data**


*** SSH 입력시Github에등록한SSH의Private Key와동일한Key(id_rsa)를입력**


4


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-283-full.png)
### **5 Kubernetes 배포를위한GitHub와ArgoCD 활용**

**05**
**ArgoCD를활용한Kubernetes Manifest 배포**


1


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-284-full.png)

**실습내용**


**순서**


**1. EKS에Application 배포**


**2. Desired State 검증**


**3. GitOps 검증**


**실습예제코드경로**


**Chapter05**


##### **05 .**

**ArgoCD를**
**활용한**
**Kubernetes**
**Manifest 배포**



2


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-285-full.png)

**1. EKS에Application 배포**


**EKS에Application 배포경로**


**- service > guestbook에서다음의명령어실행**


**$ kubectl apply -f application.yaml**


**Web UI 접속후확인**


**- application > guestbook**


**-**
**guestbook 토폴로지구성및상태** **확인**


##### **05 .**

**ArgoCD를**
**활용한**
**Kubernetes**
**Manifest 배포**



**-**
**guestbook service에서명시된** **LoadBalancer 주소로접속해웹페이지출력확인**


3


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-286-full.png)

**2. Desired State 검증**


**1. kubectl로pod 강제삭제**


**$ kubectl delete po guestbook-ui-<POD명> -n guestbook**


**2. kubectl로edit를통해pod수강제증가**


**$ kubectl edit deploy guestbook-ui -n guestbook**


**-**
**replicas를1 -> 3으로증가**


##### **05 .**

**ArgoCD를**
**활용한**
**Kubernetes**
**Manifest 배포**




*** kubectl 처리후바로ArgoCD Web UI에서변경사항확인및** **Refresh 버튼클릭**


4


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-287-full.png)

**3. GitOps 검증**


**1. Deployment Manifest에서Replica수변경**


##### **05 .**

**ArgoCD를**
**활용한**
**Kubernetes**
**Manifest 배포**



**$ service-repository > guestbook > guestbook-ui-deployment.yaml**


**-**
**replicas를1 -> 3으로증가**


**2. Service Manifest에서type변경**


**$ service-repository > guestbook > guestbook-ui-svc.yaml**


**-**
**type을LoadBalancer -> ClusterIP로변경**


**kubectl 처리후바로ArgoCD Web UI에서변경사항확인및** **Refresh 버튼클릭**


5


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-288-full.png)
### **5 Kubernetes 배포를위한GitHub와ArgoCD 활용**

**06**
**ArgoRollout 구성**


1


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-289-full.png)

**실습내용**


**순서**


**Rollout 및플러그인설치**
**1. Argo**


**2. Argo Rollout Dashboard 접속**


**실습예제코드경로**


**Chapter05**


##### **06 .**

**ArgoRollout**
**구성**



2


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-290-full.png)

**1. Argo Rollout 및플러그인설치**


**Argo Rollout 및플러그인설치스크립트경로**


##### **06 .**

**ArgoRollout**
**구성**




**- gitops-repository > management > argo-rollout > scripts > setup.sh**


**$ chmod +x setup.sh && ./setup.sh**


**Argo Rollout Dashboard를Background로기동**


**-**
**http://localhost:3100**


3


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-291-full.png)

**2. Argo Rollout Dashboard 접속#1**


**Argo Rollout Dashboard URL**


**-**
**http://localhost:3100**


**접속후배포된rollout Object 확인방법**


**NS:**

**- 우측상단에있는"** **" 부분에명시된드롭다운리스트클릭**


**rollout** **NS**

**- 드롭다운리스트중** **object가배포된** **(Namespace) 선택**


4


##### **06 .**

**ArgoRollout**
**구성**


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-292-full.png)

**2. Argo Rollout Dashboard 접속#2**


##### **06 .**

**ArgoRollout**
**구성**



5



![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-292-0.png)

![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-292-1.png)
![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-293-full.png)
### **5 Kubernetes 배포를위한GitHub와ArgoCD 활용**

**07**
**Argo Rollout을활용한무중단배포**


1


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-294-full.png)

**실습내용**


**순서**


**1. Canary 배포설정(Rollout object)**


**2. Rollout object 배포**


**3. CLI 및** **GUI로배포확인**


**4. Bubble Pool**
**Application 배포** **확인(Stable)**


##### **07 .**

**Argo Rollout을**
**활용한무중단**
**배포**



**5. Service Repo내Bubble Pool 코드업데이트** **및** **변경배포** **확인(Canary)**


**실습예제코드경로**


**Chapter05**


2


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-295-full.png)

**1. Canary 배포설정(Rollout object)**


**Canary 배포설정경로**

**- service-repository > bubblepool > rollout.yaml 에서설정**


kind: Rollout
metadata:

name: bubble-pool
.. 중략..

             - setWeight: 20

             - pause: {duration: 15}

             - setWeight: 40

             - pause: {duration: 15}

             - setWeight: 60

             - pause: {duration: 15}

             - setWeight: 80

             - pause: {duration: 15}

             - setWeight: 100

             - pause: {duration: 15}
.. 중략..

image: argoproj/rollouts-demo:red


3


##### **07 .**

**Argo Rollout을**
**활용한무중단**
**배포**


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-296-full.png)

**2. Rollout object 배포**


**EKS에Rollout object 배포경로**


**- gitops-repository > service > bubblepool에서다음의명령어실행**


**$ kubectl apply -f application.yaml**


**ArgoCD Web UI 접속후배포상태확인**


**- application > bubblepool**


**-**
**bubblepool 토폴로지구성및상태** **확인**


##### **07 .**

**Argo Rollout을**
**활용한무중단**
**배포**



**-**
**bubblepool service에서명시된** **LoadBalancer 주소로접속해GUI 출력확인**


4


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-297-full.png)

**3. CLI 및GUI로배포확인**


**CLI로배포확인**


**$ kubectl argo rollouts get rollout bubble-pool ‒watch**


**GUI로배포확인**


**- 웹브라우저> http://localhost:3100**


**- 우측상단NS: bubblepool**


5


##### **07 .**

**Argo Rollout을**
**활용한무중단**
**배포**


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-298-full.png)

**4. Bubble Pool Application 배포확인(Stable) #1**


**Bubble Pool App Object 생성확인**


**$ kubectl get all ‒n bubblepool**


**LoadBalancer 도메인주소확인**


**- service object 확인시출력되는External-IP의도메인주소로접속**


**‒n**
**$ kubectl get svc bubble-pool** **bubblepool**


**LoadBalancer 도메인주소로접속**


**- 웹브라우저> http://도메인주소:80**


6


##### **07 .**

**Argo Rollout을**
**활용한무중단**
**배포**


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-299-full.png)

**4. Bubble Pool Application 배포확인(Stable) #2**


**Bubble Pool Application 배포확인(Stable)**


**- 전체Pool내** **Red Bubble만확인**

![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-299-0.png)


7


##### **07 .**

**Argo Rollout을**
**활용한무중단**
**배포**


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-300-full.png)

**5. Service Repo내Bubble Pool 코드업데이트및변경배포확인(Canary) #1**


**Bubble Pool 코드업데이트경로(IDE)**

**- service-repository > bubblepool > rollout.yaml 에서설정**


apiVersion: argoproj.io/v1alpha1

kind: Rollout
metadata:

name: bubble-pool
.. 중략..

containers:

            - name: bubble-pool

image: argoproj/rollouts-demo:blue


**Image Tag를수정후commit > push**

**-**
**red > blue**


8


##### **07 .**

**Argo Rollout을**
**활용한무중단**
**배포**


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-301-full.png)

**5. Service Repo내Bubble Pool 코드업데이트및변경배포확인(Canary) #2**


**Bubble Pool 및변경배포확인(Canary)**


**- 전체Pool내점진적으로** **Red Bubble > Blue Bubble로전환확인**

![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-301-0.png)


9


##### **07 .**

**Argo Rollout을**
**활용한무중단**
**배포**


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-302-full.png)
# **6 Kubernetes** **안정성강화방법**

**01 Kubernetes**
**안정성강화방법소개**


1


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-303-full.png)
###### **Kubernetes 안정성강화방법소개**

**1.**
**Kubernetes 안정성강화방법소개**


**2.** **HPA**
**[실습]** **소개및Metrics Server 설치**


**3.**
**[실습] HPA 및** **오토스케일링** **적용**


**4. [실습] Minio 소개및설치**


**5.** **S3**
**[실습] Minio 및AWS** **연결후** **업로드/다운로드** **적용**


**6.** **Velero**
**[실습]** **소개및설치**


**7.**
**[실습] Velero 백업** **적용**


**8. [실습] Velero 복구** **적용**


2


##### **01 .**

**Kubernetes**
**안정성강화방법**
**소개**


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-304-full.png)
###### **HPA(Horizontal Pod Autoscaler)란?**

![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-304-0.png)

출처: https://medium.com/tensult/cluster-autoscaler-ca-and-horizontal-pod-autoscaler-hpa-on-kubernetes-f25ba7fd00b9


3


##### **01 .**

**Kubernetes**
**안정성강화방법**
**소개**


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-305-full.png)
###### **HPA 활용**


##### **01 .**

**Kubernetes**
**안정성강화방법**
**소개**



![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-305-0.png)

출처: https://medium.com/geekculture/enhanced-autoscaling-options-for-event-driven-applications-1b86aecdefa0


4


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-306-full.png)
###### **Minio란?**


##### **01 .**

**Kubernetes**
**안정성강화방법**
**소개**



![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-306-0.png)

출처: https://min.io/product/multicloud-elastic-kubernetes-service


5


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-307-full.png)
###### **Minio 활용**


##### **01 .**

**Kubernetes**
**안정성강화방법**
**소개**



![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-307-0.png)

출처: https://www.storagereview.com/news/minio-kubernetes-native-object-storage-video-demo


6


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-308-full.png)
###### **Velero란?**


##### **01 .**

**Kubernetes**
**안정성강화방법**
**소개**



![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-308-0.png)

출처: https://aws.amazon.com/ko/blogs/containers/backup-and-restore-your-amazon-eks-cluster-resources-using-velero/


7


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-309-full.png)
###### **Velero 활용**


##### **01 .**

**Kubernetes**
**안정성강화방법**
**소개**



![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-309-0.png)

출처: https://blogs.halodoc.io/kubernetes-disaster-recovery-with-velero/


8


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-310-full.png)

**Kubernetes (AWS EKS) 안정성강화방법**


##### **01 .**

**Kubernetes**
**안정성강화방법**
**소개**



![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-310-0.png)

![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-310-1.png)



![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-310-2.png)



![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-310-3.png)



9


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-311-full.png)
# **6. Kubernetes 안정성강화방법**

**02**
**HPA 소개및Metrics Server 설치**


1


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-312-full.png)

**소개및실습내용**


**순서**


**1. HPA 소개**


**2. Metrics Server 소개**


**3. Metrics Server 설치**


**실습예제코드경로**


**Chapter06 > Ch06_02-metrics-server**


2


##### **02 .**

**HPA 소개및**
**Metrics Server**
**설치**


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-313-full.png)

**1. HPA 소개**


  **워크로드리소스(Deployment, StatefulSet)를자동으로업데이트**

  **워크로드의크기를수요에맞게자동으로스케일링**

![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-313-0.png)


출처: https://kubernetes.io/ko/docs/tasks/run-application/horizontal-pod-autoscale/


3


##### **02 .**

**HPA 소개및**
**Metrics Server**
**설치**


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-314-full.png)

**1. HPA ‒ Scale out 수행기준**


**$ kubectl get deploy test-deploy ‒o yaml**


**.. 중략..**


**resources:**


##### **02 .**

**HPA 소개및**
**Metrics Server**
**설치**



**limits:**


**cpu: 500m**


**requests:**


**200m**
**cpu:**


**.. 중략..**


**$ kubectl get hpa**



***** **50%**
**가넘으면scale out 수행**
**request > cpu 기준**
**200m x 0.5** **50%** **100m** **1**
**(** **) =** **(** **Pod)**
**(CPU 사용률1분간격체크)**



**NAME             REFERENCE                TARGETS  MINPODS  MAXPODS  REPLICAS  AGE**


**50%** **1           10          1** **5m**
**test-deploy      Deployment/test-deploy  0%/**


4


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-315-full.png)

**1. HPA ‒ Replicas 산정기준**


**$ kubectl get deploy test-deploy ‒o yaml**


**.. 중략..**


**resources:**


##### **02 .**

**HPA 소개및**
**Metrics Server**
**설치**



**limits:**


**cpu: 500m**


**requests:**


**cpu: 200m**


**.. 중략..**


**$ kubectl get hpa**




*** request > cpu 기준50%가넘으면scale out 수행**
**200m x 0.5(50%) = 100m (1Pod)**
**200m x 2.5** **250%** **500m** **5**
**(** **) =** **(** **Pods - REPLICAS)**
**(Pod 스케쥴링sync, 15초간격수행)**



**NAME             REFERENCE                TARGETS    MINPODS  MAXPODS  REPLICAS  AGE**


**test-deploy      Deployment/test-deploy  250%/50%   1           10          5** **8m**


5


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-316-full.png)

**1. HPA ‒ Scale in (Downscale) 산정기준**


**$ kubectl get deploy test-deploy ‒o yaml**


**.. 중략..**


**resources:**


##### **02 .**

**HPA 소개및**
**Metrics Server**
**설치**



**limits:**


**cpu: 500m**


**requests:**


**cpu: 200m**


**.. 중략..**


**$ kubectl get hpa**




*** request > cpu 기준50%가이하가되면scale in 수행**
**200m x 0.5(50%) = 100m (1Pod)**
**100%** **200m** **2**
**200m x 1(** **) =** **(5에서** **로수량감소)**
**(Pod downscale, 5분간격수행)**



**NAME             REFERENCE                TARGETS    MINPODS  MAXPODS  REPLICAS  AGE**


**test-deploy      Deployment/test-deploy  100%/50%  1           10          2** **19m**


6


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-317-full.png)

**2. Metrics Server 소개**


    **Kubernetes POD Autoscale을위한기본Metrics 처리시스템**


    **Metrics을Query해생성/회수할Replicas를산정한뒤Scale**

![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-317-0.png)


출처: https://lzomedia.com/blog/horizontal-pod-autoscaler-on-eks-cluster/


7


##### **02 .**

**HPA 소개및**
**Metrics Server**
**설치**


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-318-full.png)

**3. Metrics Server 설치**


**Metrics Server 설치Manifest 경로**


**- Chapter06 > Ch06_02-metrics-server**


**$ kubectl apply ‒f metrics-server.yaml**


**설치확인**


**$ kubectl get deployment metrics-server -n kube-system**


8


##### **02 .**

**HPA 소개및**
**Metrics Server**
**설치**


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-319-full.png)
# **6. Kubernetes 안정성강화방법**

**03**
**HPA 및오토스케일링적용**


1


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-320-full.png)

**실습내용**


**순서**


**1. 테스트용Pod 배포및HPA 적용**


**2. CPU 부하테스트수행**


**실습예제코드경로**


**Chapter06 > Ch06_03-hpa-autoscaling**


2


##### **03 .**

**HPA 및**
**오토스케일링**
**적용**


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-321-full.png)

**1. 테스트용Pod 배포및HPA 적용**


**테스트용Pod 배포경로**


**- Chapter06 > Ch06_03-hpa-autoscaling**


**$ kubectl apply -f test-deploy.yaml**


**HPA 적용명령어**


##### **03 .**

**HPA 및**
**오토스케일링**
**적용**



**$**
**kubectl autoscale deployment test-deploy --cpu-percent=50 --min=1 --max=10**


3


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-322-full.png)

**2. CPU 부하테스트수행**


**CPU 부하테스트수행명령어**


##### **03 .**

**HPA 및**
**오토스케일링**
**적용**



**$**
**kubectl run -i --tty load-generator --rm --image=busybox --restart=Never**


**-- /bin/sh -c "while sleep 0.01; do wget -q -O- http://test-deploy; done"**


**HPA 현황출력명령어수행**


**$ kubectl get hpa**


**NAME             REFERENCE                TARGETS** **MINPODS  MAXPODS  REPLICAS  AGE**


**5m**
**test-deploy      Deployment/test-deploy  250%/50%   1           10          5**


4


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-323-full.png)
# **6. Kubernetes 안정성강화방법**

**04**
**Minio 소개및설치**


1


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-324-full.png)

**소개및실습내용**


**순서**


**1. Minio 소개**


**2. Minio 설치**


**3. Minio 콘솔접속및Object 파일업로드/다운로드적용**


**실습예제코드경로**


**Chapter06 > Ch06_04-minio**


2


##### **04 .**

**Minio 소개및**
**설치**


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-325-full.png)

**1. Minio 소개**


    **MinIO는고성능분산Object Storage 시스템**

    **MinIO는클라우드및온프레미스, 컨테이너통합가능하도록설계**

    **RESTful 방식의S3 API를사용해통합연동가능**

![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-325-0.png)


출처: https://min.io/product/overview

3


##### **04 .**

**Minio 소개및**
**설치**


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-326-full.png)

**2. Minio 설치**


**Minio 설치경로**


**- Chapter06 > Ch06_04-minio**


**Minio 설치명령어(Helm)**


**$ helm install minio ./**


**Minio 설치후접속패스워드확인방법(admin 계정)**


##### **04 .**

**Minio 소개및**
**설치**



**$** **ROOT_PASSWORD**
**export** **=$(kubectl get secret --namespace default minio -o**


**ROOT_PASSWORD**
**jsonpath="{.data.root-password}" | base64 --decode); echo**


4


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-327-full.png)

**3. Minio 콘솔접속및Object 파일업로드/다운로드적용**


**Minio 콘솔접속주소**


**$ kubectl get svc**


**>:9001**

**- 웹브라우저주소창에입력: http://<Service External-IP 주소**


**Minio를통한Bucket 생성**


**(1) 로그인후> 좌측메뉴중"bucket" 클릭**


**(2) 우측상단에"Create Bucket" 클릭**


**(3) "test-minio-bucket" 이름으로bucket 생성**


5


##### **04 .**

**Minio 소개및**
**설치**


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-328-full.png)
# **6. Kubernetes 안정성강화방법**

**05**
**Minio 및AWS S3 연결후업로드/다운로드적용**


1


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-329-full.png)

**실습내용**


**순서**


**1. Minio Gateway 소개**


**2. Minio Gateway 설치**


**3. Minio 콘솔접속**


**4. Minio를통한AWS S3 Bucket 생성및업로드/다운로드적용테스트**


**실습예제코드경로**


**Chapter06 > Ch06_05-minio-to-aws-s3**


2


##### **05 .**

**Minio 및AWS**
**S3 연결후**
**업로드/다운로드**
**적용**


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-330-full.png)

**1. Minio Gateway 소개**

![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-330-0.png)


출처: https://www.datanami.com/2017/09/20/amazon-s3-dominance-spawns-storage-challengers/

3


##### **05 .**

**Minio 및AWS**
**S3 연결후**
**업로드/다운로드**
**적용**


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-331-full.png)

**2. Minio Gateway 설치**


**Minio 설치경로**


**- Chapter06 > Ch06_05-minio-to-aws-s3**


**Minio 설치명령어(Helm)**


**$ helm install minio-to-aws-s3 ./**


4


##### **05 .**

**Minio 및AWS**
**S3 연결후**
**업로드/다운로드**
**적용**


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-332-full.png)

**3. Minio 콘솔접속**


**Minio 콘솔접속주소**


**$ kubectl get svc**


**>:9001**

**- 웹브라우저주소창에입력: http://<Service External-IP 주소**


**Minio 설치후접속계정정보**


**- ID : AWS 계정**
**Access Key**


**- Password : AWS 계정**
**Secret Key**


5


##### **05 .**

**Minio 및AWS**
**S3 연결후**
**업로드/다운로드**
**적용**


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-333-full.png)

**4. Minio를통한AWS S3 Bucket 생성및업로드/다운로드적용테스트**


**Minio를통한AWS S3 Bucket 생성**


**(1) 로그인후> 좌측메뉴중"bucket" 클릭**


**(2) 우측상단에"Create Bucket" 클릭**


**(3) "test-minio-s3-bucket" 이름으로bucket 생성**


**AWS S3 Bucket 경로에서Bucket 확인**


**S3**
**(1) AWS 로그인후> 상단검색창"** **"검색> 클릭**


**(2) 다음의bucket명확인: test-minio-s3-bucket**


6


##### **05 .**

**Minio 및AWS**
**S3 연결후**
**업로드/다운로드**
**적용**


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-334-full.png)
# **6. Kubernetes 안정성강화방법**

**06**
**Velero 소개및설치**


1


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-335-full.png)

**소개및실습내용**


**순서**


**1. Velero 소개**


**2. Velero 설치**


**실습예제코드경로**


**Chapter06 > Ch06_06-velero**


##### **06 .**

**Velero 소개및**
**설치**



2


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-336-full.png)

**1. Velero 소개**


##### **06 .**

**Velero 소개및**
**설치**




**Kubernetes 클러스터및Object 데이터, PV 백업** **및** **마이그레이션** **도구**

**DR**
**안전한** **백업** **및** **복원, 재해복구(** **) 수행, 데이터마이그레이션가능**

**백업** **스케쥴링, 리텐션** **지정, 커스텀백업** **Hook등주요데이터** **보호** **기능제공**

![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-336-0.png)


출처: https://gauravwadghule.medium.com/backup-solution-for-kubernetes-with-velero-7a6c0f35579


3


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-337-full.png)

**2. Velero 설치#1**


**(1) Velero 설치경로**


**- Chapter06 > Ch06_06-velero**


**(2) Velero 백업/복구를위한AWS IAM Policy 생성**


##### **06 .**

**Velero 소개및**
**설치**



**$ aws iam create-policy --policy-name VeleroAccessPolicy --policy-**


**document file://velero_policy.json**


4


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-338-full.png)

**2. Velero 설치#2**


**(3) eksctl을통한Velero용IAM Role 생성**


##### **06 .**

**Velero 소개및**
**설치**



**--**
**$ eksctl create iamserviceaccount --cluster=<생성한EKS Cluster명>**


**name=velero-server --namespace=velero --role-name=eks-velero-**


**backup --role-only --attach-policy-arn=arn:aws:iam::<AWS 계정ID**


**(12자리수)>:policy/VeleroAccessPolicy --approve**


**(4) Helm Chart로설치를위한values.yaml 내용확인**


**$ vi values.yaml**


5


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-339-full.png)

**2. Velero 설치#3**


**(5) Helm Chart 배포**


##### **06 .**

**Velero 소개및**
**설치**



**$ helm install velero** **velero ./**
**--create-namespace --namespace**


**(6) Velero 배포현황확인**


**$ kubectl get all ‒n velero**


**(7) Velero와IAM Role 연동확인**


**$ kubectl get sa velero-server ‒n velero**


6


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-340-full.png)

**2. Velero 설치#4**


**(8) Velero 관리를위한CLI 설치(로컬PC 환경)**


**-**
**MacOS**


**$ brew install velero**


**-**
**Linux**


##### **06 .**

**Velero 소개및**
**설치**



**$ wget https://github.com/vmware-tanzu/velero/releases/download/v1.7.2/velero-v1.7.2-**


**linux-amd64.tar.gz**


**$ tar xvfz velero-v1.7.2-linux-amd64.tar.gz**


**$ cd velero-v1.7.2-linux-amd64; mv velero /usr/local/bin/**


**-**
**Windows**


**$ choco install velero**


7


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-341-full.png)
# **6. Kubernetes 안정성강화방법**

**07**
**Velero 백업적용**


1


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-342-full.png)

**실습내용**


**순서**


**1. Velero 백업수행구조**


**2. Velero 백업테스트앱(Ghost) Helm 배포및데이터쓰기수행**


**3. Velero 백업수행**


**4. Velero 백업후결과확인**


**실습예제코드경로**


**Chapter06 > Ch06_07-velero-backup**


2


##### **07 .**

**Velero 백업적용**


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-343-full.png)

**1. Velero 백업수행구조**


##### **07 .**

**Velero 백업적용**



![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-343-0.png)









User











3


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-344-full.png)

**2. Velero 백업테스트앱(Ghost) Helm 배포및데이터쓰기수행#1**


**(1) Velero 백업테스트앱(Ghost) Helm Chart 배포경로**


**Chapter06 > Ch06_07-velero-backup**


**$ helm install ghost ./ --create-namespace --namespace ghost**


**(2) 백업테스트앱(Ghost) Helm 배포후도움말중추가반영할정보확인**


  **export APP_HOST=$(kubectl get svc --namespace ghost ghost --template "{{ range**


**(index .status.loadBalancer.ingress 0) }}{{ . }}{{ end }}"); echo "APP_HOST="$APP_HOST**


##### **07 .**

**Velero 백업적용**




**export GHOST_PW=$(kubectl get secret --namespace "ghost" ghost -o jsonpath="{.data.ghost-password}" |**


**base64 --decode); echo "GHOST_PW="$GHOST_PW**


**export DB_ROOT_PW=$(kubectl get secret --namespace "ghost" ghost-mariadb -o jsonpath="{.data.mariadb-**


**root-password}" | base64 --decode); echo "DB_ROOT_PW="$DB_ROOT_PW**


**export DB_PW=$(kubectl get secret --namespace "ghost" ghost-mariadb -o jsonpath="{.data.mariadb-**


**password}" | base64 --decode); echo "DB_PW="$DB_PW**


4


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-345-full.png)

**2. Velero 백업테스트앱(Ghost) Helm 배포및데이터쓰기수행#2**


**(3) Velero 백업테스트앱(Ghost) 추가반영정보Upgrade**


**$ helm upgrade ghost ./ --namespace ghost --set service.type=LoadBalancer --set**


**ghostHost=$APP_HOST --set ghostPassword=$GHOST_PW --set**


##### **07 .**

**Velero 백업적용**



**mariadb.auth.rootPassword=$DB_ROOT_PW --set mariadb.auth.password=$DB_PW**


**(4) 배포후Kubernetes Object 현황확인**


**$ kubectl get all ‒n ghost**


**External-IP**
**(5) Velero 백업테스트앱(Ghost) 접속을위한DNS 주소확인방법(** **)**


**svc**
**$ kubectl get** **‒n ghost**


5


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-346-full.png)

**2. Velero 백업테스트앱(Ghost) Helm 배포및데이터쓰기수행#3**


**(6) Velero 백업테스트앱(Ghost) 접속주소(웹브라우저)**


**- Admin URL : http://<Service External-IP>:80/ghost (로그인정보: admin/$GHOST_PW )**


**<Service External-IP>:80**

**- Blog URL : http://** **(로그인없이접속)**

![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-346-0.png)

![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-346-1.png)


6


##### **07 .**

**Velero 백업적용**


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-347-full.png)

**3. Velero 백업수행**


**(1) Velero 백업저장소확인방법(Backup-Location)**


**$ velero backup-location get**


**(2) Velero 백업수행**


**$ velero backup create ghost-backup**


**(3) Velero 백업결과상세내용확인방법**


**$ velero backup describe ghost-backup**


7


##### **07 .**

**Velero 백업적용**


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-348-full.png)

**4. Velero 백업후결과확인**


**AWS S3 Bucket에서백업파일확인**


**-**
**test-velero-backup-bucket**


##### **07 .**

**Velero 백업적용**



![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-348-0.png)

8


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-349-full.png)
# **6. Kubernetes 안정성강화방법**

**08**
**Velero 복구적용**


1


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-350-full.png)

**실습내용**


**순서**


**1. Velero 복구수행구조**


**2. 백업된테스트앱(Ghost) Helm Release 및Namespace 삭제**


**3. Velero 복구수행**


**4. Velero 복구후결과확인**


2


##### **08 .**

**Velero 복구적용**


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-351-full.png)

**1. Velero 복구수행구조**


##### **08 .**

**Velero 복구적용**



![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-351-0.png)









User











3


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-352-full.png)

**2. 백업된테스트앱(Ghost) Helm Release 및Namespace 삭제**


**(1) 백업된테스트앱(Ghost) Helm Release 삭제명령어**


**$ helm uninstall ghost ‒n ghost**


**(2) 백업된테스트앱(Ghost) Namespace 삭제명령어**


**$ kubectl delete ns ghost**


**(3) 삭제후Kubernetes내전체Namespace내POD 현황확인**


**$ kubectl get po -A**


4


##### **08 .**

**Velero 복구적용**


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-353-full.png)

**3. Velero 복구수행**


**(1) Velero 복구수행**


##### **08 .**

**Velero 복구적용**



**velero restore create**
**$** **ghost-restore --from-backup ghost-backup**


**--include-namespaces ghost**


**(2) Velero 복구결과상세내용확인방법**


**$ velero restore describe ghost-backup**


5


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-354-full.png)

**4. Velero 복구후결과확인**


**(1) ghost Namespace 및ghost 테스트앱Object 복구현황확인**


**$ kubectl get all ‒n ghost**


##### **08 .**

**Velero 복구적용**



**External-IP**
**(2) 복구된테스트앱(Ghost) 접속을위한DNS 주소확인방법(** **)**


**svc**
**$ kubectl get** **‒n ghost**


**(3) Velero 백업테스트앱(Ghost) 접속주소(웹브라우저)**


**- Admin URL : http://<Service External-IP>:80/ghost (로그인정보: email주소/$GHOST_PW )**


**External-IP>:80**

**- Blog URL : http://<Service** **(로그인없이접속)**


6


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-355-full.png)
# **7 Kubernetes Custom** **관리방법**

**01 Kubernetes Custom**
**관리방법소개**


1


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-356-full.png)
###### **Kubernetes Custom 관리방법**

**1.**
**Kubernetes Custom 관리방법소개**


**2.** **CRD**
**Custom Resource Definition(** **) 소개**


**3. Kubernetes**
**소개**
**Operator**


**4.**
**[실습] Kubernetes** **적용**
**Operator**


2


##### **01 .**

**Kubernetes**
**Custom 관리**
**방법소개**


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-357-full.png)

**소개내용**


**순서**


**1. Kubernetes Custom 관리방법소개**


**2. Extension 패턴**


**3. Extension 포인트**


**4. API Extension**


**5. 플랫폼Extension**


3


##### **01 .**

**Kubernetes**
**Custom 관리**
**방법소개**


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-358-full.png)
##### **01 .**
###### **1. Kubernetes Custom 관리방법소개**

**Kubernetes**
**Custom 관리**
**방법소개**

 **Kubernetes Custom 관리방법으로는** **Extension을통해구현**

 **Extension은** **Kubernetes를확장하고** **Kubernetes와긴밀하게통합되는소프트웨어** **컴포넌트구현**

 **Kubernetes가새로운** **type의리소스와새로운종류의** **시스템을지원할수있게해줌**



![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-358-0.png)
![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-359-full.png)
##### **01 .**
###### **2. Extension 패턴**

**Kubernetes**
**Custom 관리**
**방법소개**

    **Kubernetes는** **클라이언트** **프로그램을작성하여** **자동화** **되도록설계됨**

    **Controller** **을**
**모델은Kubernetes의클라이언트로, 일반적으로Object의** **.spec**

**읽고, 클러스터에서적용한다음Object의** **.status를업데이트해etcd에갱신**

    **WebHook 모델에서는Kubernetes가클라이언트가되서특정** **원격서비스에**

**네트워크상으로요청**

    **바이너리** **플러그인모델에서는Kubernetes가바이너리(프로그램)를** **실행**

![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-359-0.png)


출처: https://kubernetes.io/ko/docs/concepts/extend-kubernetes/


5


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-360-full.png)
###### **3. Extension 포인트**


##### **01 .**

**Kubernetes**
**Custom 관리**
**방법소개**


**1.사용자는종종** **kubectl을사용하여Kubernetes API와상호작용**


**2.apiserver는여러유형의Extension 포인트는요청을인증하거나, 콘텐츠를**


**기반으로요청을차단하거나, 콘텐츠를편집하고, 삭제처리를허용**


**3.apiserver는** **다양한종류의리소스를제공한다. 직접정의한리소스를추가**


**및Custom Resource라고부르는다른프로젝트에서정의한리소스를추가**


**4.Kubernetes 스케줄러는파드를배치할노드를결정**


**5.Kubernetes의많은동작은API-Server의클라이언트인** **Controller라는**


**프로그램으로구현됨. Controller는종종Custom Resource와함께사용**


**6.kubelet은서버에서실행되며, Pod가클러스터네트워크에서자체IP를가진가상**


**서버처럼적용**


**7.kubelet은컨테이너의** **볼륨을마운트** **및마운트를해제**



![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-360-0.png)

출처: https://kubernetes.io/ko/docs/concepts/extend-kubernetes/



6


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-361-full.png)
###### **4. API Extension #1**


##### **01 .**

**Kubernetes**
**Custom 관리**
**방법소개**



**(1) 사용자정의유형**
**새컨트롤러, 애플리케이션구성오브젝트또는기타선언적** **API를정의하고kubectl과**
**같은쿠버네티스도구를사용하여관리하려면쿠버네티스에** **커스텀리소스를추가**


**(2) 새로운API와자동화의결합**
**사용자정의리소스API와컨트롤루프의조합을** **오퍼레이터(operator) 패턴이라고함.**
**오퍼레이터패턴은특정애플리케이션, 일반적으로스테이트풀(stateful)**
**애플리케이션을관리하는데사용됨. 이러한** **사용자정의API 및** **컨트롤루프를사용하여**
**스토리지나정책과같은다른리소스를** **제어**


7


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-362-full.png)
###### **4. API Extension #2**


##### **01 .**

**Kubernetes**
**Custom 관리**
**방법소개**



**(3) 빌트인리소스변경**
**기존API 그룹을** **바꾸거나변경할수없음. API를추가해도기존API(예: 파드)의동작에**
**직접** **영향을미치지는않지만** **API 접근익스텐션은영향을줌**


**(4) API 접근익스텐션**
**요청이쿠버네티스API 서버에도달하면먼저인증이되고, 그런다음승인된후다양한**
**유형의** **어드미션컨트롤이적용. 이러한각단계는** **익스텐션포인트를제공.**
**쿠버네티스에는이를지원하는몇가지빌트인인증방법이있는데, 또한인증** **프록시**
**뒤에있을수있으며인증** **헤더에서원격서비스로토큰을전송하여확인할수있음(웹훅)**


8


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-363-full.png)
###### **4. API Extension #3**


##### **01 .**

**Kubernetes**
**Custom 관리**
**방법소개**



**(5) 인증**
**인증은모든요청의** **헤더또는인증서를요청하는클라이언트의사용자이름에매핑.**
**쿠버네티스는몇가지빌트인인증방법과필요에맞지않는경우인증** **웹훅** **방법을제공**


**(6) 인가**
**인가는특정사용자가** **API 리소스에서읽고, 쓰고, 다른작업을수행할수있는지를결정.**
**전체리소스레벨에서작동하며임의의오브젝트필드를기준으로구별하지않는다.**
**빌트인인증옵션이사용자의요구를충족시키지못하면인가** **웹훅을통해사용자가**
**제공한코드를호출하여인증결정을내림**


9


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-364-full.png)
###### **4. API Extension #4**


##### **01 .**

**Kubernetes**
**Custom 관리**
**방법소개**



**(7) 동적어드미션컨트롤**
**요청이승인된후, 쓰기작업인경우** **어드미션컨트롤** **단계도수행됨. 빌트인단계외에도**
**몇가지익스텐션이있음**


**이미지정책** **웹훅은컨테이너에서실행할수있는이미지를제한**


**임의의어드미션컨트롤결정을내리기위해일반적인** **어드미션** **웹훅을사용할수있음.**


**어드미션웹훅은생성또는업데이트를거부할수있음**


10


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-365-full.png)
###### **5. 플랫폼Extension #1**


##### **01 .**

**Kubernetes**
**Custom 관리**
**방법소개**



**(1) 스토리지플러그인**
**Flex Volumes을사용하면Kubelet이바이너리플러그인을호출하여볼륨을**
**마운트하도록함으로써빌트인지원없이볼륨유형을마운트할수있음.**
**v1.23**
**그러나FlexVolume은쿠버네티스** **부터사용중단(deprecated)됨.**
**CSI 드라이버가쿠버네티스에서볼륨드라이버를작성할때추천하는방식**


**(2) 장치플러그인**
**노드**
**장치플러그인은** **가장치플러그인을통해새로운** **노드리소스(CPU 및메모리와**
**같은빌트인자원외에)를발견할수있게해줌**


11


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-366-full.png)
###### **5. 플랫폼Extension #2**


##### **01 .**

**Kubernetes**
**Custom 관리**
**방법소개**



**(3) 네트워크플러그인**
**노드-레벨의네트워크플러그인을통해다양한** **네트워킹패브릭을지원할수있음**


**(4) 스케줄러익스텐션**
**스케줄러는파드를감시하고파드를노드에할당하는특수한유형의** **컨트롤러임.**
**다른쿠버네티스컴포넌트를계속사용하면서기본스케줄러를완전히**
**교체하거나, 여러스케줄러를동시에실행할수있음.**
**스케줄러는또한** **웹훅** **백엔드(스케줄러익스텐션)가파드에대해선택된노드를**
**필터링하고우선순위를지정할수있도록하는웹훅을지원**


12


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-367-full.png)
# **7 Kubernetes Custom 관리방법**

**02**
**Custom Resource Definition(CRD) 소개**


1


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-368-full.png)

**실습내용**


**순서**


**1. Custom Resource 소개**


**2. Custom Resource Definition(CRD)이란?**


**3. CRD 생성**


**4. Custom Resource 생성**


**실습예제코드경로**


**Chapter07 > Ch07_02-crd**


2


##### **02 .**

**Custom**

**Resource**
**Definition(CRD)**
**소개**


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-369-full.png)

**1. Custom Resource 소개**


   **Kubernetes에서는Object를직접** **커스텀정의해사용할수있음**


##### **02 .**

**Custom**

**Resource**
**Definition(CRD)**
**소개**




**소스코드를따로수정하지않고** **API를확장해사용할수있는인터페이스를제공**


**Custom Resource**
**를이용하여Kubernetes Object를확장가능**


apiVersion: "extension.example.com/v1"


kind: test


metadata:


name: test-custom-resource


size: 2


3


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-370-full.png)

**2. Custom Resource Definition(CRD)이란?**


  **Custom Resource를Kubernetes etcd에등록하기위해서는**


**CustomResourceDefinition(이하CRD)를사용**


##### **02 .**

**Custom**

**Resource**
**Definition(CRD)**
**소개**




**Custom Resource**
**CRD용Manifest yaml 파일을작성해놓으면** **를등록할수있음**


apiVersion: apiextensions.k8s.io/v1beta1
kind: CustomResourceDefinition
metadata:

name: test.extension.example.com
spec:

group: extension.example.com
version: v1
scope: Namespaced

names:

plural: test
singular: test
kind: test


4


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-371-full.png)

**3. CRD 생성**


**(1) CRD 생성Manifest 경로및생성명령어**


**- Chapter07 > Ch07_02-crd**


**$ kubectl apply -f test-crd.yaml**


**(2) CRD 생성확인명령어**


**$ kubectl get crd**


**(3) CRD 상세설명출력명령어**


**$ kubectl explain test**


5


##### **02 .**

**Custom**

**Resource**
**Definition(CRD)**
**소개**


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-372-full.png)

**4. Custom Resource 생성**


**(1) Custom Resource 생성Manifest 경로및생성명령어**


**- Chapter07 > Ch07_02-crd**


**$ kubectl apply -f test-custom-resource.yaml**


**(2) 생성된Custom Resource 확인명령어**


**test**
**$ kubectl get**


6


##### **02 .**

**Custom**

**Resource**
**Definition(CRD)**
**소개**


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-373-full.png)
# **7 Kubernetes Custom 관리방법**

**03**
**Kubernetes Operator 소개**


1


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-374-full.png)

**소개내용**


**순서**


**1. Kubernetes Controller 소개**


**2. Kubernetes Operator 소개**


**3. Operator 작성도구소개**


**4. Helm vs Operator 비교**


**5. KUDO 소개**


##### **03 .**

**Kubernetes**
**Operator 소개**



2


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-375-full.png)

**1. Kubernetes Controller 소개**


##### **03 .**

**Kubernetes**
**Operator 소개**




**Kubernetes Controller는Object의선언적인Spec 기준** **원하는상태(Desire**


**State)를읽고Object의** **현재상태(Current State)와비교해서처리한후에**


**etcd에서** **상태(Status)를갱신하는방식으로동작하는컴포넌트**


**Custom Resource**
**CRD를사용하여만든** **를이용하여사용자가원하는상태를**


**선언하면(etcd에갱신되면), Custom Controller가그상태를맞추기위해동작**


3


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-376-full.png)

**1. Kubernetes Controller 소개**

![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-376-0.png)


출처: https://kubernetes.io/blog/2019/04/17/the-future-of-cloud-providers-in-kubernetes/


4


##### **03 .**

**Kubernetes**
**Operator 소개**


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-377-full.png)

**2. Kubernetes Operator 소개#1**


##### **03 .**

**Kubernetes**
**Operator 소개**




**Kubernetes Operator는** **Custom Resource Definition(CRD)를기반으로**


**애플리케이션및컴포넌트를관리하는Kubernetes API 확장** **개념**


**Kubernetes의워크로드** **배포, 실행** **등의자동화및** **수행방식의자동화구현**


5


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-378-full.png)

**2. Kubernetes Operator 소개#2**


    **Kubernetes Controller 개념을통해Go언어기반의Kubernetes 구현**


**K8s**
**소스코드를수정(빌드/컴파일/배포)하지않고** **클러스터의동작을확장**


##### **03 .**

**Kubernetes**
**Operator 소개**




**를작성후적용하면Custom Resource와CRD에의한etcd 변경**
**Operator**


**을감지하고Kubernetes에** **원하는동작을구현** **가능**


6


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-379-full.png)

**2. Kubernetes Operator 소개#3**

![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-379-0.png)


출처: https://iximiuz.com/en/posts/kubernetes-operator-pattern/


7


##### **03 .**

**Kubernetes**
**Operator 소개**


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-380-full.png)

**3. Operator 작성도구소개#1**


   **KUDO**
**Operator를작성하기위한도구로는** **, kubebuilder, Operator**


**Framework가있음**


##### **03 .**

**Kubernetes**
**Operator 소개**




**Operator 작성도구를사용하게되면Custom Resource나Controller를**


**작성하는데필요한** **BoilerPlate를제공, 작성자는핵심** **로직작성에집중가능**


8


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-381-full.png)

**3. Operator 작성도구소개#2**


##### **03 .**

**Kubernetes**
**Operator 소개**




**Operator Framework는Operator 개발플로우를제공하는** **Operator SDK와**


**Operator의라이프사이클을관리하는** **Operator OLM으로구성**


**Operator Lifecycle Manager (OLM)은Operator의** **생애주기를관리하는**


**매니저로, Operator를설치하고, 업데이트, 백업, 스케일링등** **운영/관리** **가능**


9


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-382-full.png)

**4. Helm vs Operator 비교**

![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-382-0.png)


출처: https://cloudark.medium.com/kubernetes-operators-and-helm-it-takes-two-to-tango-3ff6dcf65619


10


##### **03 .**

**Kubernetes**
**Operator 소개**


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-383-full.png)

**5. KUDO 소개#1**


##### **03 .**

**Kubernetes**
**Operator 소개**




**KUDO** **도구**
**(Kubernetes Universal Declarative Operator) = Operator 작성**


**Yaml 형태의** **선언적명세작성만으로손쉽게** **Operator를만들수있는도구** **제공**


**Operator 라이프사이클간의** **공통화및재사용할수있는기능** **제공**


11


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-384-full.png)

**6. KUDO 소개#2**


##### **03 .**

**Kubernetes**
**Operator 소개**



![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-384-0.png)

출처: https://kudo.dev/docs/architecture.html


12


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-385-full.png)
# **7 Kubernetes Custom 관리방법**

**04**
**Kubernetes Operator 적용**


1


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-386-full.png)

**실습내용**


**순서**


**1. Operator 작성디렉토리구조**


**2. KUDO 설치**


**3. KUDO를사용한Operator 생성**


**4. KUDO를사용한Operator 업그레이드**


**실습예제코드경로**


**Chapter07 > Ch07_04-kudo-operator**


2


##### **04 .**

**Kubernetes**
**Operator 적용**


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-387-full.png)

**1. Operator 작성디렉토리구조**


   **operator.yaml : Operator 메타데이터와전체라이프사이클을모두**


**정의하는기본YAML 파일**


   **params.yaml : Operator의매개변수를정의합니다.**


   **templates 디렉토리** **: operator.yaml에정의된워크플로를기반으로설치**


**후클러스터에적용될모든템플릿화된Kubernetes Object가포함**


.
├──
operator.yaml
├──
params.yaml
└──
templates

├── deployment.yaml
└── service.yaml


3


##### **04 .**

**Kubernetes**
**Operator 적용**


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-388-full.png)

**2. KUDO 설치#1**


**(1) KUDO 플러그인바이너리다운로드및설치**


**$**
**wget**


##### **04 .**

**Kubernetes**
**Operator 적용**



**https://github.com/kudobuilder/kudo/releases/download/v0.19.0/**


**kubectl-kudo_0.19.0_<*OS종류>_x86_64**


**$ chmod +x kubectl-kudo_0.19.0_<*OS종류>_x86_64 && mv kubectl-**


**kudo_0.19.0_<*OS종류>_x86_64 /usr/local/bin/kubectl-kudo**


*** OS 종류** **: 리눅스‒ linux, 맥- darwin**


4


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-389-full.png)

**2. KUDO 설치#2**


**(2) KUDO 설치확인**


**$ kubectl kudo --version**


**(3) cert-manager 설치**


##### **04 .**

**Kubernetes**
**Operator 적용**



**$ kubectl apply --validate=false -f https://github.com/jetstack/cert-**


**manager/releases/download/v1.0.1/cert-manager.yaml**


**(4) cert-manager 설치확인**


**$ kubectl get pods --namespace cert-manager**


5


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-390-full.png)

**2. KUDO 설치#3**


**(5) KUDO 설치후초기화수행**


**$ kubectl kudo init**


##### **04 .**

**Kubernetes**
**Operator 적용**



![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-390-0.png)

6


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-391-full.png)

**3. KUDO를사용한Operator 생성#1**


**(1) Operator 경로이동및생성명령어**


**-**
**Chapter07**


**$ kubectl kudo install Ch07_04-kudo-operator/**


**(2) 생성된Operator 확인명령어**


**$**
**kubectl kudo get operators**


**(3) 생성된Instances 확인명령어**


**$ kubectl kudo get instances**


7


##### **04 .**

**Kubernetes**
**Operator 적용**


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-392-full.png)

**3. KUDO를사용한Operator 생성#2**


**(4) 생성된Component 전체를yaml 형태확인명령어**


**$ kubectl kudo get all ‒o yaml**


**(5) 생성된Kubernetes Object 전체확인명령어**


**$ kubectl get all**


**(6) 배포된Kubernetes deployment yaml 형태확인명령어**


**$ kubectl get deploy ‒o yaml**


8


##### **04 .**

**Kubernetes**
**Operator 적용**


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-393-full.png)

**4. KUDO를사용한Operator 업그레이드**


**(1) Operator > Parameter 수정후업그레이드명령어**


**-**
**Chapter07**


**$ kubectl kudo upgrade Ch07_04-kudo-operator/ --instance**


**test-instance**


**(2) 생성된Component 전체를yaml 형태확인명령어**


**$ kubectl kudo get all ‒o yaml**


**(3) 생성된Kubernetes Object 전체확인명령어**


**$ kubectl get all**


9


##### **04 .**

**Kubernetes**
**Operator 적용**


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-394-full.png)
# **8 Kubernetes 보안강화방법**

**01**
**Kubernetes 보안강화활용소개**


1


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-395-full.png)
##### **01 .**
###### **Kubernetes 보안강화방법**

**Kubernetes**
**보안강화활용**
**소개**
**1.**
**Kubernetes 보안강화활용소개**


**2. [실습] kube2iam 소개및설치**


**3. [실습] kube2iam를활용한AWS IAM 기반권한관리**


**4. [실습] Falco 소개및설치**


**5. [실습] Falco를활용한** **런타임보안강화**


**6. [실습] OPA Gatekeeper 소개및설치**


**7. [실습] OPA Gatekeeper를활용한** **보안정책관리**


**8. [실습]** **소개및설치**
**cert-manager**


**9. [실습] cert-manager를활용한** **TLS 인증서관리**


**AWS ACM**
**10.[실습]** **활용TLS 인증서관리**


2


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-396-full.png)
##### **소개내용 01 .**

**Kubernetes**
**보안강화활용**
**소개**

###### **IAM 기반권한관리 런타임보안강화**

![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-396-0.png)

###### **보안정책관리 인증서관리**


3


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-397-full.png)
###### **1. IAM 기반권한관리#1**

**Identity and Access Management(IAM)는리소스에대한** **액세스를안전하게**


**제어할수있는서비스로, IAM을사용하여기본접근및리소스를사용하도록** **권한부여**


##### **01 .**

**Kubernetes**
**보안강화활용**
**소개**







|구분|상세 설명|
|---|---|
|**User**|•** IAMUser는플랫폼내에서생성하는사용자로플랫폼상호작용하는사용자혹은**<br>**어플리케이션을의미**|
|**Group**|•** IAMGroup은IAM User의집합이고,그룹을사용함으로써다수사용자에대하여동일한**<br>**권한을보다쉽게관리가능**|
|**Role**|•** IAMRole은특정권한을가진IAM자격증명방식임**<br>•** Role을사용함으로써특정사용자혹은어플리케이션에혹은서비스에접근권한을위임**|
|**Policy**|•** IAMPolicy는접근하는권한을정의하는개체로, IAM 리소스들과연결하여사용**|


4


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-398-full.png)
###### **1. IAM 기반권한관리#2**

![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-398-0.png)

출처: https://docs.aws.amazon.com/ko_kr/IAM/latest/UserGuide/intro-structure.html


5


##### **01 .**

**Kubernetes**
**보안강화활용**
**소개**


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-399-full.png)
###### **2. 런타임보안강화#1**

**런타임보안강화는검증된** **트래픽만을허용하는방법, 서비스간** **최소권한아래의**


**통신을적용하고외부공격으로부터내부망이동을** **방어하는방법, 워크로드자체가예상**


**보호범위내에서작동하는지여부를** **검증하는방법등을포함**


##### **01 .**

**Kubernetes**
**보안강화활용**
**소개**







|구분|상세 설명|
|---|---|
|**이미지스캐닝**|•** 런타임취약성스캐닝을자동화할수있으며, 위험을줄이고실행중인컨테이너에**<br>**사용된이미지를보호하기위한정책커스터마이징지원**|
|**워크로드이상감지**|•** 네트워킹모듈을표준화하고, 신규워크로드설정시중요한문제인네트워킹모듈상에**<br>**편차가있는지의이상을감지해보안운영(SecOps) 담당에리포팅가능**|
|**수신및송신보안**|•** Kubernetes에도달하는외부소스데이터수신에대한추가가시성을보안팀에**<br>**제공하고, IP 주소및데이터를기반으로잘못된송신대상으로의연결을감지, 차단**|
|**위협탐지**|•** 오픈포트를스캔해취약성을확인하고, 진행중인내부망이동공격이있는지확인**|


6


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-400-full.png)
###### **2. 런타임보안강화#2**


##### **01 .**

**Kubernetes**
**보안강화활용**
**소개**



![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-400-0.png)

출처: https://sysdig.com/blog/intro-runtime-security-falco/


7


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-401-full.png)
###### **3. 보안정책관리#1**

**보안정책관리는정책통합하여** **적용/관리하는방식. Kubernetes에대한사용자정의**


**컴플라이언스관리정책의** **기술을제한없이구현** **가능하도록제공. 정책을** **코드로관리**


**할수있도록정책구현전용언어인** **Rego라는선언형언어를사용.**


##### **01 .**

**Kubernetes**
**보안강화활용**
**소개**







|구분|상세 설명|
|---|---|
|**제약조건**|•** 제약조건을사용하여정책을정의할수있음. 제약조건은Kubernetes에서배포동작을**<br>**허용하거나거부하는조건의집합임.**<br>•** ConstraintTemplate을사용하여클러스터에여러제약조건정책을시행할수있음.**|
|**정책출시**|•** 점진적이고범위가지정된방식으로정책을시행하여워크로드가중단되는위험을제한**|
|**정책변경테스트**|•** 정책영향및시행전에범위를테스트하기위한메커니즘을제공**|
|**기존정책감사**|•** 새로운워크로드및기존워크로드에정책보안감사제어애플리케이션을적용**|


8


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-402-full.png)
###### **3. 보안정책관리#2**


##### **01 .**

**Kubernetes**
**보안강화활용**
**소개**



![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-402-0.png)

출처: https://www.velotio.com/engineering-blog/deploy-opa-on-kubernetes

9


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-403-full.png)
###### **4. 인증서관리#1**

**인증서관리는HTTPS 통신을위한** **인증서를생성하고, 인증서만료시자동으로** **인증서를**


**갱신해주는역할을하는관리방식. 주로웹사이트및내부리소스보안에사용하며, 공인**


**및사설SSL/TLS 인증서를손쉽게프로비저닝, 관리및배포할수있도록지원**


##### **01 .**

**Kubernetes**
**보안강화활용**
**소개**











|구분|상세 설명|
|---|---|
|**인증서적용**|•** Kubernetes 내에서외부에존재하는Issuers를활용**<br>•** Selfsigned Issuer를직접생성해서생성하여Certificate를생성**|
|**인증서검사**|•** 인증서의유효성을검사하고최신상태인지를확인**|
|**인증서갱신**|•** 생성된Certificate를관리하며, 인증서의만료시간이가까워지면인증서를자동으로갱신**|
|**다양한발급자**|•** Let's Encrypt, HashiCorp Vault, Venafi등간단한서명Keypair 또는자체서명과같은**<br>**다양한발급자로부터인증서발급지원**|


10


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-404-full.png)
###### **4. 인증서관리#2**


##### **01 .**

**Kubernetes**
**보안강화활용**
**소개**



![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-404-0.png)

출처: https://cert-manager.io/docs/


11


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-405-full.png)
# **8 Kubernetes 보안강화방법**

**02**
**kube2iam 소개및설치**


1


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-406-full.png)

**소개내용**


**순서**


**1. kube2iam 소개**


**2. kube2iam의단점및대체방법**


**3. AWS IRSA 소개**


**4. AWS IRSA 설치방법**


##### **02 .**

**kube2iam 소개**
**및설치**



2


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-407-full.png)

**1. kube2iam 소개**


##### **02 .**

**kube2iam 소개**
**및설치**


**Annotation을기반으로Kubernetes 클러스터**


**내에서실행되는컨테이너에** **IAM 자격증명을**


**제공하는오픈소스도구**


**POD**
**각Kubernetes** **가가질수있는** **권한을제한**


**트래픽을** **EC2 메타데이터API로Proxy 처리**


**AWS 내Kubernetes에서실행되는**


**애플리케이션(POD)을** **보호하는데도움이됨**



![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-407-0.png)

출처: https://www.bluematador.com/blog/iam-access-in-kubernetes-kube2iam-vs-kiam

3


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-408-full.png)

**2. kube2iam의단점및대체방법**


**단점**


   **Daemonset 형태로모든** **EKS Worker Node에POD를배포해야함**


##### **02 .**

**kube2iam 소개**
**및설치**




**이에모든EKS Worker Node의Role에** **Assume Role 권한을부여해야함**


**Worker Node마다** **Iptables DNAT 설정을해야함(EC2 메타데이터API 호출용)**


**대체방법**


**IRSA**
**AWS에서EKS ‒ IAM 연동및자격증명을위한** **(IAM Role for Service**


**Account)를사용**


4


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-409-full.png)

**3. AWS IRSA 소개#1**


    **IRSA** **IAM**
**(IAM Role for Service Account, 서비스어카운트용** **역할)**


##### **02 .**

**kube2iam 소개**
**및설치**




**OIDC**
**OpenID Connect(** **) 자격증명공급자와Kubernetes(EKS) Service**


**Account Annotation을결합하여POD 수준에서IAM 역할을사용할수있도록**


**하는AWS의기능**


**eksctl 및** **awscli를통해EKS 및IAM과연동하여구현**


5


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-410-full.png)

**3. AWS IRSA 소개#2**


##### **02 .**

**kube2iam 소개**
**및설치**







|특징|상세내용|
|---|---|
|**최소권한**|•<br>**EKS WorkerNode가AWS API 호출Role에확장된권한을제공할필요없음**<br>•<br>**IAM 권한의범위를Service Account로지정할수있음**<br>•<br>**해당Service Account를사용하는POD만이권한에액세스할수있음**<br>•<br>**kube2iam, kiam 같은다른오픈소스도구가필요없음**|
|**자격증명격리**|•** 컨테이너는컨테이너가속한Service Account와연결된IAM Role에대한자격증명만**<br>**검색할수있음**<br>•** 컨테이너는다른POD에속한다른컨테이너를위한자격증명에는액세스할수없음**|
|**감사**|•** CloudTrail을통한액세스및이벤트로깅을사용하여이전감사로그를검색및확인가능**|


6


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-411-full.png)

**3. AWS IRSA 소개#3**


##### **02 .**

**kube2iam 소개**
**및설치**



![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-411-0.png)


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-412-full.png)

**4. AWS IRSA 설치방법**


**(1) IRSA용OIDC 자격증명공급자생성명령어**


##### **02 .**

**kube2iam 소개**
**및설치**



**$ eksctl utils associate-iam-oidc-provider --cluster <EKS클러스터명> --approve**


**(2) 생성된IRSA용OIDC 자격증명공급자URL 확인명령어**


**$ aws eks describe-cluster --name <EKS클러스터명>**
**--query**


**"cluster.identity.oidc.issuer" --output text**


**(3) 생성된IRSA용OIDC 자격증명공급자ARN 확인명령어**


**$ aws iam list-open-id-connect-providers | grep <(2)번에서나온ID값입력>**


8


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-413-full.png)
# **8 Kubernetes 보안강화방법**

**03**
**kube2iam를활용한AWS IAM 기반권한관리**


1


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-414-full.png)

**실습내용**


**순서**


**1. 사전준비**


**2. IAM Policy 적용(접근할AWS Resource 권한적용)**


**3. IRSA 적용(eksctl)**


**4. IRSA 적용검증(POD 배포및awscli 수행)**


**실습예제코드경로**


**Chapter08 > Ch08_03-kube2iam-irsa**


2


##### **03 .**

**kube2iam를**
**활용한AWS IAM**
**기반권한관리**


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-415-full.png)

**1. 사전준비**


**EKS Cluster :**


##### **03 .**

**kube2iam를**
**활용한AWS IAM**
**기반권한관리**




**IRSA 테스트검증을위한Kubernetes 환경, 기존에사용한환경과동일하게사용**


**S3 Bucket :**


**S3 Bucket 내파일목록조회및삭제검증용으로Bucket 1개생성**


**:**
**DynamoDB Table**


**DynamoDB Table 정보조회및삭제검증용으로Table 1개생성**


3


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-416-full.png)

**2. IAM Policy 적용(접근할AWS Resource 권한적용)**


**(1) 접근할AWS Resource 권한적용을위한IAM Policy 적용명령어**


**- Chapter08 > Ch08_03-kube2iam-irsa**


**$ aws iam create-policy \**


**--policy-name <생성할IAM Policy명> \**


**--policy-document file://iam-policy.json**


4


##### **03 .**

**kube2iam를**
**활용한AWS IAM**
**기반권한관리**


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-417-full.png)

**3. IRSA 적용(eksctl)**


**(1) eksctl를활용한IRSA 적용명령어**


**$ eksctl create iamserviceaccount \**


**--name**
**<IRSA명> \**


**\**
**--namespace <적용할EKS내Namespace명>**


**--cluster <EKS 클러스터명> \**


##### **03 .**

**kube2iam를**
**활용한AWS IAM**
**기반권한관리**



**--attach-policy-arn arn:aws:iam::<AWS 12자리계정ID>:policy/<2번에서**


**생성한접근할Resource의IAM Policy명> \**


**--approve**


5


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-418-full.png)

**4. IRSA 적용검증(POD 배포및awscli 수행) #1**


**(1) IRSA 적용검증용awscli 수행을위한POD 배포명령어**


**- Chapter08 > Ch08_03-kube2iam-irsa**


**$ kubectl apply -f ./aws-cli-pod.yaml**


**(2) 배포후POD내Bash Shell 실행명령어**


**$ kubectl exec -it aws-cli -- bash**


**(3) Assume Role에의해발급된임시토큰권한(STS) 확인명령어**


**aws sts**
**$** **get-caller-identity**


6


##### **03 .**

**kube2iam를**
**활용한AWS IAM**
**기반권한관리**


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-419-full.png)

**4. IRSA 적용검증(POD 배포및awscli 수행) #2**


**(4) S3 Bucket 내파일목록출력명령어**


**$ aws s3 ls s3://<S3 Bucket명>**


**(5) S3 Bucket 내특정파일삭제명령어**


**$ aws s3 rm s3://<S3 Bucket명>/<특정파일명>**


7


##### **03 .**

**kube2iam를**
**활용한AWS IAM**
**기반권한관리**


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-420-full.png)

**4. IRSA 적용검증(POD 배포및awscli 수행) #3**


**(6) DynamoDB Table 정보출력명령어**


##### **03 .**

**kube2iam를**
**활용한AWS IAM**
**기반권한관리**



**$ aws dynamodb describe-table --table-name <DynamoDB Table명>**


**(7) DynamoDB Table 삭제명령어**


**$ aws dynamodb delete-table --table-name <DynamoDB Table명>**


8


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-421-full.png)
# **8 Kubernetes 보안강화방법**

**04**
**Falco 소개및설치**


1


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-422-full.png)

**소개및실습내용**


**순서**


**1. Falco 소개**


**2. 사전준비(EKS)**


**3. IAM Policy 및Role 적용(CloudWatch 로그연동용)**


**4. Falco 설치(Helm Chart)**


**실습예제코드경로**


**Chapter08 > Ch08_04-falco**


2


##### **04 .**

**Falco 소개및**
**설치**


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-423-full.png)

**1. Falco 소개#1**


**Falco는Kubernetes, 컨테이너및클라우드** **런타임** **전반에서지속적인** **위험및위협**


##### **04 .**

**Falco 소개및**
**설치**



**탐지를위한** **런타임보안관리용오픈소스도구로, 지속적인보안감시로예기치않은동작,**


**구성변경, 침입및데이터도난을실시간으로** **감지및처리** **할수있음**

![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-423-0.png)


출처: https://sysdig.com/blog/kubernetes-audit-log-falco/


3


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-424-full.png)

**1. Falco 소개#2**


##### **04 .**

**Falco 소개및**
**설치**





|특징|상세내용|
|---|---|
|**규정준수범위**|•** NIST, SOC2 또는PCI와같은규정준수표준에매핑되는기본확인및런타임정책을**<br>**사용하여규정준수를검증**<br>•** 커뮤니티에서제공하는악성활동및CVE 익스플로잇탐지를사용하여정책위반을탐지**|
|**런타임보안정책**|•** Linux 시스템호출, Kubernetes감사및클라우드활동로그를통한위협탐지정책적용**<br>•** 맞춤형정책기반Cloud/K8s컨텍스트적용및경고출력가능**|
|**자동화된수정**|•** 자동화된수정작업(컨테이너중지, 종료, 일시중지)으로Falco의탐지기능을확장하여**<br>**위협에신속하게대응가능**<br>•** 오픈소스기반에이전트를통한지속적인탐지수행가능**|


4


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-425-full.png)

**2. 사전준비(EKS)**


**EKS Cluster**


    **런타임보안검증을위한Kubernetes 환경**


    **기존에사용한환경과동일하게사용**


5


##### **04 .**

**Falco 소개및**
**설치**


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-426-full.png)

**3. IAM Policy 및Role 적용(CloudWatch 로그연동용) #1**


**(1) Falco 로그대상CloudWatch 연동용IAM Policy 적용명령어**


**aws**

**- Chapter08 > Ch08_04-falco >**


**$ aws iam create-policy --policy-name EKS-CloudWatchLogs --**


**policy-document file://iam_role_policy.json**


6


##### **04 .**

**Falco 소개및**
**설치**


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-427-full.png)

**3. IAM Policy 및Role 적용(CloudWatch 로그연동용) #2**


**(2) Falco 로그대상CloudWatch 연동용IAM Role 적용명령어**


##### **04 .**

**Falco 소개및**
**설치**



**$ aws iam attach-role-policy --role-name <EKS Worker Node Role명>**


**--policy-arn `aws iam list-policies | jq -r '.[][] | select(.PolicyName ==**


**"EKS-CloudWatchLogs") | .Arn'`**


7


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-428-full.png)

**4. Falco 설치(Helm Chart)**


**(1) values.yaml 변경내역**


**- Chapter08 > Ch08_04-falco > helm-chart > values.yaml**


**-**
**-> true**
**jsonOutput: false**


**(2) Falco Helm Chart 설치명령어**


**- Chapter08 > Ch08_04-falco > helm-chart**


**$ helm install falco ./**


8


##### **04 .**

**Falco 소개및**
**설치**


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-429-full.png)
# **8 Kubernetes 보안강화방법**

**05**
**Falco를활용한런타임보안강화**


1


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-430-full.png)

**실습내용**


**순서**


**1. CloudWatch 로그수집을위한FluentBit 설치**


**2. 예제용Deployment 배포(Nginx)**


**3. 보안취약상황테스트및CloudWatch 로그확인**


**4. CloudWatch Insights를통한쿼리분석**


**실습예제코드경로**


**Chapter08 > Ch08_05-falco-test**


2


##### **05 .**

**Falco를활용한**
**런타임보안강화**


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-431-full.png)

**1. CloudWatch 로그수집을위한FluentBit 설치**


##### **05 .**

**Falco를활용한**
**런타임보안강화**



**Fluent Bit은매우빠르고가벼우며확장성이뛰어난** **로깅및메트릭** **프로세서및**


**수집/전달** **도구이다. 클라우드및컨테이너화된환경** **로깅용으로널리사용된다.**


**(1) FluentBit 설치명령어**


**- Chapter08 > Ch08_05-falco-test > fluentbit**


**$ kubectl apply -f ./**


3


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-432-full.png)

**2. 예제용Deployment 배포(Nginx)**


**(1) 예제용Deployment 배포명령어**


**- Chapter08 > Ch08_05-falco-test > example**


**$ kubectl apply -f deployment.yaml**


**(2) 배포후POD 확인명령어**


**$ kubectl get pods**


4


##### **05 .**

**Falco를활용한**
**런타임보안강화**


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-433-full.png)

**3. 보안취약상황테스트및CloudWatch 로그확인#1**


**(1) 특정POD의Bash Shell로접속**


**$ kubectl exec ‒it <특정POD명> -- bash**


**(2) 보안정책위배(취약점) 명령어수행**


**- falco_rules.yaml > “write below etc”**


**$ touch /etc/2**


**- falco_rules.yaml > “Read sensitive file untrusted”**


**$ cat /etc/shadow > /dev/null 2>&1**


5


##### **05 .**

**Falco를활용한**
**런타임보안강화**


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-434-full.png)

**3. 보안취약상황테스트및CloudWatch 로그확인#2**


**(3) CloudWatch 로그확인경로**


**- CloudWatch > 로그> 로그그룹> falco**


**(4) 로그검색필터링문자열**


**- “Error File below /etc”**


**- “Warning Sensitive file opened”**


6


##### **05 .**

**Falco를활용한**
**런타임보안강화**


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-435-full.png)

**3. 보안취약상황테스트및CloudWatch 로그확인#3**


**(5) 특정POD의Bash Shell로접속(또다른POD로접속)**


**$ kubectl exec ‒it <특정POD명> -- bash**


**(6) 보안정책위배(취약점) 명령어수행**


**- falco_rules.yaml > “Mkdir binary dirs”**


**$ cd /bin**


**$ mkdir hello**


7


##### **05 .**

**Falco를활용한**
**런타임보안강화**


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-436-full.png)

**3. 보안취약상황테스트및CloudWatch 로그확인#4**


**(7) CloudWatch 로그확인경로**


**- CloudWatch > 로그> 로그그룹> falco**


**(8) 로그검색필터링문자열**


**- “Error Directory below known binary directory”**


8


##### **05 .**

**Falco를활용한**
**런타임보안강화**


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-437-full.png)

**4. CloudWatch Insights를통한쿼리분석#1**


##### **05 .**

**Falco를활용한**
**런타임보안강화**



**(1) CloudWatch Insights 쿼리수행및Dashboard 출력을통한분석경로**


**- CloudWatch > 로그> Logs Insights**


**(2) 로그그룹선택**


**-**
**falco**


9


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-438-full.png)

**4. CloudWatch Insights를통한쿼리분석#2**


**(3) “Mkdir binary dirs” 로그분석을위한쿼리작성**


fields @timestamp, @message


| filter @message like 'Mkdir binary dirs'


| sort @timestamp desc


**(4) 쿼리실행**


**-**
**쿼리실행** **버튼클릭**


10


##### **05 .**

**Falco를활용한**
**런타임보안강화**


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-439-full.png)

**4. CloudWatch Insights를통한쿼리분석#2**


**(5) “Read sensitive file untrusted” 로그분석을위한쿼리작성**


fields @timestamp, @message


| filter @message like 'Read sensitive file untrusted'


| sort @timestamp desc


**(6) 쿼리실행**


**-**
**쿼리실행** **버튼클릭**


11


##### **05 .**

**Falco를활용한**
**런타임보안강화**


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-440-full.png)
# **8 Kubernetes 보안강화방법**

**06**
**OPA Gatekeeper 소개및설치**


1


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-441-full.png)

**소개및실습내용**


**순서**


**1. OPA 소개**


**2. OPA Gatekeeper 소개**


**3. OPA Gatekeeper 설치(Helm Chart)**


**실습예제코드경로**


**Chapter08 > Ch08_06-opa-gatekeeper**


2


##### **06 .**

**OPA**
**Gatekeeper**
**소개및설치**


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-442-full.png)

**1. OPA 소개#1**


**OPA(Open Policy Agent)는Kubernetes Object 요청시주어진** **정책을준수하도록**


**하는** **정책엔진으로, 정책에따라Object의특정** **Action을허용하거나거부할수있음**

![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-442-0.png)


출처: https://medium.com/@hiroyuki.osaki/illustration-open-policy-agent-aaf05bb0de8f


3


##### **06 .**

**OPA**
**Gatekeeper**
**소개및설치**


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-443-full.png)

**1. OPA 소개#2**


##### **06 .**

**OPA**
**Gatekeeper**
**소개및설치**





|특징|상세내용|
|---|---|
|**Validation**|•** Rule을따르는요청은승인**<br>•** Rule을따르지않는요청은거부**|
|**Mutation**|•** Rule을따르기위해요청내용을업데이트가능**|
|**Apply tools**|•** 플랫폼: Docker,Kubernetes**<br>•** 도구: SSH, Terraform, Envoy**|
|**Language**|•** Rego는JSON과같은구조화된문서모델을지원**<br>•** Rego 쿼리는OPA에저장된데이터에대한쿼리를명세할수있으며, 이러한쿼리는시스템의**<br>**원하는상태를위반하는데이터정책을정의하는데사용**<br>•** Rego 소개- https://www.openpolicyagent.org/docs/latest/policy-language/**<br>•** Rego 코드작성및테스트- https://play.openpolicyagent.org/**|


4


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-444-full.png)

**2. OPA Gatekeeper 소개#1**


**Kubernetes에서는** **정책적인결정을API 서버와분리해서독립적으로할수있도록**


**하기위해** **Admission Controller Webhook을제공하며, 하나의Object가생성,**


**업데이트, 삭제될때** **무조건실행됨**

![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-444-0.png)


5


##### **06 .**

**OPA**
**Gatekeeper**
**소개및설치**


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-445-full.png)

**2. OPA Gatekeeper 소개#2**


   **OPA Gatekeeper는내부적으로** **OPA 엔진을사용하는OPA의K8S Object 및**


**CRD(Custom Resource Definitions)의** **승인/제어를위해** **구현된오픈소스도구**


   **Webhook을확인하여OPA 정책엔진에서** **정의한대로실행,**
**OPA Gatekeeper는**


**정책을코드로관리가능하며, 정책을정의한대로Object에대한** **특정액션을취해줌**

![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-445-0.png)


6


##### **06 .**

**OPA**
**Gatekeeper**
**소개및설치**


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-446-full.png)

**2. OPA Gatekeeper 소개#3**


##### **06 .**

**OPA**
**Gatekeeper**
**소개및설치**







|구분|상세 설명|
|---|---|
|**제약조건**|•** 제약조건을사용하여정책을정의할수있음. 제약조건은Kubernetes에서배포동작을**<br>**허용하거나거부하는조건의집합임.**<br>•** ConstraintTemplate을사용하여클러스터에여러제약조건정책을시행할수있음.**|
|**정책출시**|•** 점진적이고범위가지정된방식으로정책을시행하여워크로드가중단되는위험을제한**|
|**정책변경테스트**|•** 정책영향및시행전에범위를테스트하기위한메커니즘을제공**|
|**기존정책감사**|•** 새로운워크로드및기존워크로드에정책보안감사제어애플리케이션을적용**|


7


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-447-full.png)

**3. OPA Gatekeeper 설치(Helm Chart)**


**(1) Helm Chart를이용한OPA Gatekeeper 설치명령어**


**- Chapter08 > Ch08_06-opa-gatekeeper**


**$ helm install ./ --name-template=gatekeeper --namespace**


**gatekeeper-system --create-namespace**


**(2) Helm Chart 설치결과확인명령어**


**$ helm list -n gatekeeper-system**


**$ kubectl get all -n gatekeeper-system**


8


##### **06 .**

**OPA**
**Gatekeeper**
**소개및설치**


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-448-full.png)
# **8 Kubernetes 보안강화방법**

**07**
**OPA Gatekeeper를활용한보안정책관리**


1


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-449-full.png)

**실습내용**


**순서**


**1. ConstraintTemplate 및Constraint 코드소개및배포**


**2. Label 없이Nginx POD 배포및결과확인**


**3. 필요Label 추가및Nginx POD 배포및결과확인**


**실습예제코드경로**


**Chapter08 > Ch08_07-opa-gatekeeper-test**


2


##### **07 .**

**OPA**
**Gatekeeper를**
**활용한보안정책**
**관리**


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-450-full.png)

**1. ConstraintTemplate 및Constraint 코드소개및배포**


**(1) ConstraintTemplate 및Constraint 코드경로및배포명령어**


**- Chapter08 > Ch08_07-opa-gatekeeper-test**


**$ kubectl apply -f ./**


3


##### **07 .**

**OPA**
**Gatekeeper를**
**활용한보안정책**
**관리**


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-451-full.png)

**2. Label 없이Nginx POD 배포및결과확인**


**(1) Label 없이Nginx POD 배포명령어**


**$ kubectl run nginx --image=nginx**


4


##### **07 .**

**OPA**
**Gatekeeper를**
**활용한보안정책**
**관리**


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-452-full.png)

**3. 필요Label 추가및Nginx POD 배포및결과확인**


**(1) 필요Label 추가및Nginx POD 배포명령어**


**$ kubectl run nginx --image=nginx \**


**-l zone=ap-northeast-2,stage=test,status=ready**


5


##### **07 .**

**OPA**
**Gatekeeper를**
**활용한보안정책**
**관리**


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-453-full.png)
# **8 Kubernetes 보안강화방법**

**08**
**cert-manager 소개및설치**


1


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-454-full.png)

**소개및실습내용**


**순서**


**1. cert-manager 소개**


**2. 사전준비사항**


**3. cert-manager 설치**


**실습예제코드경로**


**Chapter08 > Ch08_08-cert-manager**


2


##### **08 .**

**cert-manager**
**소개및설치**


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-455-full.png)

**1. cert-manager 소개#1**


**는HTTPS 통신을위한** **인증서를생성하고, 인증서만료시자동으로**
**cert-manager**


**인증서를갱신해주는역할을하는관리방식. SSL/TLS 인증서관리및배포지원**

![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-455-0.png)


출처: https://theithollow.com/2019/12/02/jetstack-cert-manager/

3


##### **08 .**

**cert-manager**
**소개및설치**


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-456-full.png)

**1. cert-manager 소개#2**


##### **08 .**

**cert-manager**
**소개및설치**











|구분|상세 설명|
|---|---|
|**인증서적용**|•** Kubernetes 내에서외부에존재하는Issuers를활용**<br>•** Selfsigned Issuer를직접생성해서생성하여Certificate를생성**|
|**인증서검사**|•** 인증서의유효성을검사하고최신상태인지를확인**|
|**인증서갱신**|•** 생성된Certificate를관리하며, 인증서의만료시간이가까워지면인증서를자동으로갱신**|
|**다양한발급자**|•** Let's Encrypt, HashiCorp Vault, Venafi등간단한서명Keypair 또는자체서명과같은**<br>**다양한발급자로부터인증서발급지원**|


4


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-457-full.png)

**1. cert-manager 소개#3**


##### **08 .**

**cert-manager**
**소개및설치**



![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-457-0.png)

출처: https://cert-manager.io/docs/


5


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-458-full.png)

**2. 사전준비사항**


**EKS Cluster**


    **런타임보안검증을위한Kubernetes 환경**


    **기존에사용한환경과동일하게사용**


**AWS ALB Controller**


    **AWS에서ALB를통한EKS Ingress 사용을위해사전적용필요**


##### **08 .**

**cert-manager**
**소개및설치**




**Chapter03 > AWS ALB Controller를활용한Ingress ALB 생성강의참고**


6


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-459-full.png)

**3. cert-manager 설치**


**(1) K8s Manifest를이용한cert-manager 설치명령어**


**- Chapter08 > Ch08_08-cert-manager**


**$ kubectl apply -f cert-manager.yaml**


**(2) cert-manager 설치결과확인명령어**


**$ kubectl get all -n cert-manager**


7


##### **08 .**

**cert-manager**
**소개및설치**


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-460-full.png)
# **8 Kubernetes 보안강화방법**

**09**
**cert-manager를활용한TLS 인증서관리**


1


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-461-full.png)

**실습내용**


**순서**


**1. 사전준비사항**


**2. Ingress-Nginx 설치(Helm Chart)**


**3. cert-manager를통한TLS 인증서발급**


**4. 테스트용K8s Object 배포및실행**


**5. Route53 도메인등록및HTTPS 접속검증**


**실습예제코드경로**


**Chapter08 > Ch08_09-cert-manager-test**


2


##### **09 .**

**cert-**
**manager를**
**활용한TLS**
**인증서관리**


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-462-full.png)

**1. 사전준비사항**


**(1) EKS Cluster**


**(2) Domain 주소**


##### **09 .**

**cert-**
**manager를**
**활용한TLS**
**인증서관리**




**Route53 >**
**등록된도메인** **> 도메인등록에서도메인준비(신청후이메일인증1회)**


**Domain이발급** **되었다면다음의경로에서도메인을확인해사용가능**


**- Route53 >**
**호스팅영역** **> 본인이등록한도메인이름클릭**


3


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-463-full.png)

**2. Ingress-Nginx 설치(Helm Chart)**


**(1) Helm Chart를이용한Ingress-Nginx 설치**


**- Chapter08 > Ch08_09-cert-manager-test > ingress-nginx**


**$ helm install ingress-nginx ./**


**(2) Service - LoadBalancer Type을통한자동ELB 생성확인**


**$ kubectl get service**


4


##### **09 .**

**cert-**
**manager를**
**활용한TLS**
**인증서관리**


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-464-full.png)

**2. cert-manager를통한TLS 인증서발급**


**(1) TLS 인증서자동발급을위한ClusterIssuer 배포명령어**


**- Chapter08 > Ch08_09-cert-manager-test > cert-manager**


**$ kubectl apply -f cluster-issuer.yaml**


**(2) ClusterIssuer 배포및실행결과확인명령어**


**$ kubectl get clusterissuers**


5


##### **09 .**

**cert-**
**manager를**
**활용한TLS**
**인증서관리**


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-465-full.png)

**3. 테스트용K8s Object 배포및실행**


**(1) 테스트용Deployment, Service, Ingress 설치명령어**


**- Chapter08 > Ch08_09-cert-manager-test > k8s-manifests**


**$ kubectl apply -f ./**


**(2) 테스트용K8s Object 배포및실행결과확인명령어**


**$ kubectl get all**


**$ kubectl get ingress**


6


##### **09 .**

**cert-**
**manager를**
**활용한TLS**
**인증서관리**


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-466-full.png)

**4. Route53 도메인등록및HTTPS 접속검증#1**


**(1) AWS Management Console에서Route53 서비스접속**


     **상단검색창> Route53 > 호스팅영역** **> 본인이생성한도메인이름클릭**


**(2) Route53 도메인등록**


     **CNAME**
**레코드생성> 레코드이름입력> 레코드유형-** **선택**


**> 값- Service External-IP** **ELB DNS주소**
**값(** **) 복사, 붙여넣기**


**>**
**레코드생성** **버튼클릭> 도메인등록확인**


7


##### **09 .**

**cert-**
**manager를**
**활용한TLS**
**인증서관리**


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-467-full.png)

**4. Route53 도메인등록및HTTPS 접속검증#2**


**(3) 등록된Domain 주소를웹브라우저에입력**


    **페이지가안나올경우, Domain 주소앞에** **https://를붙임**


**(4) HTTPS 접속검증**


**1.**
**웹브라우저주소창맨앞에** **자물쇠** **모양클릭**


**2. "이사이트는보안연결(HTTPS)이사용되었습니다." 항목클릭**


**3. "인증서가유효함" 항목클릭**


8


##### **09 .**

**cert-**
**manager를**
**활용한TLS**
**인증서관리**


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-468-full.png)
# **8 Kubernetes 보안강화방법**

**10**
**AWS ACM 활용TLS 인증서관리**


1


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-469-full.png)

**소개및실습내용**


**순서**


**1. AWS ACM 소개**


**2. 사전준비사항**


**3. AWS ACM을통한TLS 인증서발급**


**4. 테스트용K8s Object 배포및실행**


**5. Route53 도메인등록및HTTPS 접속검증**


**실습예제코드경로**


**Chapter08 > Ch08_10-aws-certificate-manager**


2


##### **10 .**

**AWS ACM 활용**
**TLS 인증서관리**


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-470-full.png)

**1. AWS ACM 소개**


**AWS ACM**
**(Certificate Manager)는서비스및연결리소스에사용할공인및**


**사설** **SSL/TLS 인증서를프로비저닝, 관리및배포할수있도록지원하는서비스**


##### **10 .**

**AWS ACM 활용**
**TLS 인증서관리**



![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-470-0.png)
![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-471-full.png)

**2. 사전준비사항**


**(1) EKS Cluster**


**(2) AWS ALB Controller**


**(3) Domain 주소**


##### **10 .**

**AWS ACM 활용**
**TLS 인증서관리**




**Route53 >**
**등록된도메인** **> 도메인등록에서도메인준비(신청후이메일인증1회)**


**Domain이발급** **되었다면다음의경로에서도메인을확인해사용가능**


**- Route53 >**
**호스팅영역** **> 본인이등록한도메인이름클릭**


4


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-472-full.png)

**3. AWS ACM을통한TLS 인증서발급**


**(1) AWS Management Console에서ACM 서비스접속**


    **상단검색창> acm(Certificate Manager) > 인증서요청버튼클릭**


**(2) 퍼블릭인증서요청**


    **완전히정규화된도메인이름: <본인이생성한Domain 주소> 입력**


**(3) DNS 검증수행시명령어**


**$ dig +short <DNS 검증Domain 주소>**


5


##### **10 .**

**AWS ACM 활용**
**TLS 인증서관리**


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-473-full.png)

**4. 테스트용K8s Object 배포및실행**


**(1) 테스트용Deployment, Service, Ingress 설치명령어**


**- Chapter08 > Ch08_10-aws-certificate-manager**


**$ kubectl apply -f ./**


**(2) 테스트용K8s Object 배포및실행결과확인명령어**


**$ kubectl get all**


**$ kubectl get ingress**


6


##### **10 .**

**AWS ACM 활용**
**TLS 인증서관리**


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-474-full.png)

**5. Route53 도메인등록및HTTPS 접속검증#1**


**(1) AWS Management Console에서Route53 서비스접속**


 **상단검색창> Route53 > 호스팅영역** **> 본인이생성한도메인이름클릭**


**(2) Route53 도메인등록**


 **레코드생성> 레코드이름입력> 값‒ 별칭** **활성화> 엔드포인트선택**


##### **10 .**

**AWS ACM 활용**
**TLS 인증서관리**




**> Application/Classic Load Balancer에대한별칭> 리전선택[ap-northeast-2]**


**ADDRESS**

**> 로드밸런서선택> (kubectl get ingress 명령어출력중** **복사후검색**


**>**
**리소스선택** **> 레코드생성버튼클릭> 도메인등록확인**


7


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-475-full.png)

**5. Route53 도메인등록및HTTPS 접속검증#2**


**(3) 등록된Domain 주소를웹브라우저에입력**


    **페이지가안나올경우, Domain 주소앞에** **https:// 를붙임**


**(4) HTTPS 접속검증**


**1. 웹브라우저주소창맨앞에** **자물쇠** **모양클릭**


**2. "이사이트는보안연결(HTTPS)이사용되었습니다." 항목클릭**


**3. "인증서가유효함" 항목클릭**


8


##### **10 .**

**AWS ACM 활용**
**TLS 인증서관리**


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-476-full.png)
# **9 Kubernetes 트러블슈팅방법**

**01**
**Kubernetes 트러블슈팅방법소개**


1


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-477-full.png)
###### **Kubernetes 트러블슈팅방법**

**1.**
**Kubernetes 트러블슈팅방법소개**


**2. [실습] Cluster 로깅및이슈사례조치방법**


**3. [실습] Node 로깅및이슈사례조치방법**


**POD**
**4. [실습]** **로깅및이슈사례조치방법**


**5. [실습] 보안관련로깅및이슈사례조치방법**


**DNS**
**6. [실습]** **로깅및이슈사례조치방법**


2


##### **01 .**

**Kubernetes**
**트러블슈팅방법**
**소개**


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-478-full.png)
##### **1. Kubernetes 트러블슈팅방법소개#1 01 .**

**Kubernetes**
**트러블슈팅방법**
**소개**
**kubectl을사용한트러블슈팅**

![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-478-0.png)


3


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-479-full.png)
##### **1. Kubernetes 트러블슈팅방법소개#2 01 .**

**Kubernetes**
**트러블슈팅방법**
**소개**
**Observability Tool을사용한트러블슈팅**

![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-479-0.png)


출처: https://www.stacksimplify.com/aws-eks/aws-eks-monitoring/learn-to-enable-monitoring-for-kubernetes-workloads-on-aws-eks/


4


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-480-full.png)

**2. Cluster 로깅및이슈사례조치방법**


**Cluster 로깅방법**


         **kubectl**


##### **01 .**

**Kubernetes**
**트러블슈팅방법**
**소개**



**Cluster 이슈사례**


**Cluster 자체장애**


**성능이슈**


**업데이트이슈**


**AWS 이슈**




**Container Insights**


**Log groups**



**Cluster 로깅및이슈**

**사례조치방법**


5


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-481-full.png)

**3. Node 로깅및이슈사례조치방법**


**Node 로깅방법**


         **kubectl**


         **Container Insights**


         **Log groups**


         **Worker Node Log**



**Node 로깅및이슈**

**사례조치방법**


6


##### **01 .**

**Kubernetes**
**트러블슈팅방법**
**소개**



**Node 이슈사례**


**Node Down**


**Node 성능문제**


**Node 용량문제**


**Node 업데이트문제**


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-482-full.png)

**4. POD 로깅및이슈사례조치방법**


**POD 로깅방법**


         **kubectl**


         **Container Insights**


         **Log groups**


         **crictl**



**POD 로깅및이슈사례**

**조치방법**


7


##### **01 .**

**Kubernetes**
**트러블슈팅방법**
**소개**



**POD 이슈사례**


**CrashLoopBackOff**


**Pending**


**ImagePullBackOff**


**Evicted**


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-483-full.png)

**5. 보안관련로깅및이슈사례조치방법**


**보안로깅방법**


         **Access Log**


##### **01 .**

**Kubernetes**
**트러블슈팅방법**
**소개**



**보안이슈사례**


**침입탐지**


**보안취약점발견**


**특이API호출발견**


**공격시도탐지**




**Audit Log**


**CloudTrail Log**


**WAF Log**



**보안관련로깅및이슈**

**사례조치방법**


8


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-484-full.png)

**6. DNS 로깅및이슈사례조치방법**


**DNS 로깅방법**


         **CoreDNS Log**


         **nslookup**


         **dig**


         **Route53 Log**



**DNS 로깅및이슈사례**

**조치방법**


9


##### **01 .**

**Kubernetes**
**트러블슈팅방법**
**소개**



**DNS 이슈사례**


**DNS 쿼리이슈**


**DNS 성능이슈**


**CoreDNS 튜닝**


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-485-full.png)
# **9 Kubernetes 트러블슈팅방법**

**02**
**Cluster 로깅및이슈사례조치방법**


1


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-486-full.png)

**소개및실습내용**


**순서**


**1. Cluster 로깅방법소개**


**2. Cluster 이슈사례소개**


**3. Container Insight 연동을위한EKS 구성방법**


**4. Cluster 로깅방법실습**


**5. Cluster 이슈사례발생시확인방법실습**


**실습예제코드경로**


**Chapter09 > Ch09_02-cluster-troubleshooting**


2


##### **02 .**

**Cluster 로깅및**
**이슈사례**
**조치방법**


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-487-full.png)

**1. Cluster 로깅방법소개**


##### **02 .**

**Cluster 로깅및**
**이슈사례**
**조치방법**





|구분|상세 설명|
|---|---|
|**kubectl**|•** kubectl를이용한Cluster 정보및상태확인**<br>•** EKS Cluster 내Object에대한전체정보및상태를Dump후확인가능**|
|**Container Insights**|•** EKS Cluster에서수집된Metrics값을종합해서출력**<br>•** 그래프및연결토폴로지맵, 리스트형태현황제공**|
|**Log groups**|•** EKS Cluster의Log 수집및검색가능**<br>•** 사용자가접근이어려운EKS Control Plane(Master Node) Log 확인가능**|


3


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-488-full.png)

**2. Cluster 이슈사례소개**


##### **02 .**

**Cluster 로깅및**
**이슈사례**
**조치방법**









|구분|상세 설명|
|---|---|
|**Cluster 자체장애**|**• EKS Cluster 자체가기동이안되는사례**<br>**->Key 암호화를KMS로걸었을때**<br>**->KMS 문제발생시(삭제, 기간만료, 권한변경등)**|
|**성능이슈**|**• EKS Control Plane 성능문제로느려질때**<br>**->EKS 클러스터생성시최소2개이상의Subnet을다른AZ에서생성해야함**<br>**->서비스IPv4 범위가Subnet IP 대역과겹치면안됨**|
|**업데이트이슈**|**• 업데이트가느리거나문제있는상황**<br>**->문제가있을경우AWS Support를통해서만해결가능**|
|**AWS 이슈**|**• AWS DNS 서버문제로DNS 쿼리가느려지거나안될때발생**<br>**->몇년에1번생길수있는사례**|


4


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-489-full.png)

**3. Container Insight 연동을위한EKS 구성방법**


**(1) K8s Manifest를이용한CloudWatch Agent 및Fluent Bit 설치**


**- Chapter09 > Ch09_02-cluster-troubleshooting**


**$ kubectl apply ‒f cwagent-fluentbit.yaml**


**(2) CloudWatch Agent 및Fluent Bit 설치확인**


**$ kubectl get all -n amazon-cloudwatch**


5


##### **02 .**

**Cluster 로깅및**
**이슈사례**
**조치방법**


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-490-full.png)

**4. Cluster 로깅방법실습#1**


**(1) kubectl을통한kubernetes cluster 상태확인**


**$ kubectl cluster-info**


##### **02 .**

**Cluster 로깅및**
**이슈사례**
**조치방법**



**(2) kubernetes cluster의현재기준모든Resource 및Object 상태정보확인**


**$ kubectl cluster-info dump**


6


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-491-full.png)

**4. Cluster 로깅방법실습#2**


##### **02 .**

**Cluster 로깅및**
**이슈사례**
**조치방법**



**(3) Container Insight를통한kubernetes cluster 메트릭모니터링현황확인**


**- AWS CloudWatch > 인사이트> Container Insights**


**(4) Log Group을통한kubernetes cluster 로그수집현황확인**


**- AWS CloudWatch > 로그> 로그그룹> /aws/eks/test-eks-cluster/cluster**


7


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-492-full.png)

**5. Cluster 이슈사례발생시확인방법실습#1**


**(1) EKS의Key 관리를KMS에서처리하고있는지확인**


##### **02 .**

**Cluster 로깅및**
**이슈사례**
**조치방법**




**- AWS EKS > 클러스터> (생성된Cluster명) > 구성> 세부정보> 암호암호화**


**(2) KMS 적용했다면다음의경로에서확인가능**


**- AWS Key Management Service (KMS)> 고객관리형키**


8


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-493-full.png)

**5. Cluster 이슈사례발생시확인방법실습#2**


**(3) EKS의Subnet이몇개생성되어있는지확인**


**- AWS EKS > 클러스터> (생성된Cluster명) > 구성> 네트워킹> 서브넷**


**(4) EKS의서비스IPv4 범위확인**


##### **02 .**

**Cluster 로깅및**
**이슈사례**
**조치방법**




**- AWS EKS > 클러스터> (생성된Cluster명) > 구성> 네트워킹> 서비스IPv4 범위**


9


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-494-full.png)

**5. Cluster 이슈사례발생시확인방법실습#3**


**(5) EKS의업데이트진행시**


**- AWS EKS > 클러스터> (생성된Cluster명) > 구성> 클러스터구성**


**(6) EKS의업데이트진행시문제가발생될때AWS Support 요청방법**


##### **02 .**

**Cluster 로깅및**
**이슈사례**
**조치방법**




**- AWS Support > Open support cases > Create case > Technical support**


10


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-495-full.png)

**5. Cluster 이슈사례발생시확인방법실습#3**


**(7) AWS 이슈확인방법**


**- AWS Health Dashboard > General service events**


**>**
**Open and recent issues**


11


##### **02 .**

**Cluster 로깅및**
**이슈사례**
**조치방법**


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-496-full.png)
# **9 Kubernetes 트러블슈팅방법**

**03**
**Node 로깅및이슈사례조치방법**


1


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-497-full.png)

**실습내용**


**순서**


**1. Node 로깅방법소개**


**2. Node 이슈사례소개**


**3. Node 로깅방법실습**


**4. Node 이슈사례발생시확인방법실습**


2


##### **03 .**

**Node 로깅및**
**이슈사례**
**조치방법**


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-498-full.png)

**1. Node 로깅방법소개**


##### **03 .**

**Node 로깅및**
**이슈사례**
**조치방법**





|구분|상세 설명|
|---|---|
|**kubectl**|•** kubectl를이용한Node 정보및상태확인**<br>•** EKS Worker Node의상태및이벤트확인가능**|
|**Container Insights**|•** EKS Worker Node에서수집된Metrics값을종합해서출력**<br>•** 그래프및연결토폴로지맵, 리스트형태현황제공**|
|**Log groups**|•** EKS Worker Node의Log 수집및검색가능**<br>•** EKS Worker Node용Daemon, System Log, 성능/용량로그확인**|
|**Worker Node Log**|•** EKS Worker Node내기동중인Daemon Log 확인가능**<br>•** EKS Worker Node 자체System 로그확인**|


3


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-499-full.png)

**2. Node 이슈사례소개**


##### **03 .**

**Node 로깅및**
**이슈사례**
**조치방법**





|구분|상세 설명|
|---|---|
|**Node Down**|**• EKS Worker Node 자체가Down되는사례**<br>**->OS Hang 발생**<br>**->서버(VM) 중지및VM 삭제발생**|
|**Node 성능문제**|**• EKS Worker Node 성능문제로느려질때**<br>**->CPU, Memory 부족**<br>**->Network 트래픽과부하**|
|**Node 용량문제**|**• EKS Node 용량문제로느려지거나로깅쓰기가안되거나Evicted가발생**<br>**->파일시스템내용량문제를찾아해결**<br>**->용량이더큰파일시스템으로Mount (EBS볼륨)**|
|**Node 업데이트문제**|**• EKS Worker Node 업데이트가안될때발생**<br>**->네트워크이슈**<br>**->Autoscaling 설정확인**|


4


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-500-full.png)

**3. Node 로깅방법실습#1**


**(1) kubectl을통한Worker Node 상태확인**


**$ kubectl describe <Worker Node명>**


**(2) EKS Worker Node의현재기준CPU, Memory 사용량정보확인**


**$ kubectl top node <Worker Node명>**


##### **03 .**

**Node 로깅및**
**이슈사례**
**조치방법**




**- top 기능을사용하기위해metrics-server 설치필요(배포코드는아래경로참조)**


**- Chapter09 > Ch09_03-node-troubleshooting**


**$ kubectl apply ‒f metrics-server.yaml**


5


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-501-full.png)

**3. Node 로깅방법실습#2**


##### **03 .**

**Node 로깅및**
**이슈사례**
**조치방법**



**(3) Container Insight를통한EKS Worker Node 메트릭모니터링현황확인**


**- AWS CloudWatch > 인사이트> Container Insights**


**(4) Log Group을통한EKS Worker Node 로그수집현황확인**


**- AWS CloudWatch > 로그> 로그그룹> /aws/containerinsights/<EKS명>/dataplane**


**- AWS CloudWatch > 로그> 로그그룹> /aws/containerinsights/<EKS명>/host**


**- AWS CloudWatch > 로그> 로그그룹> /aws/containerinsights/<EKS명>/performance**


6


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-502-full.png)

**4. Node 이슈사례발생시확인방법실습#1**


**(1) Node가Down되었는지를확인하는방법**


**$ kubectl get node**


**- AWS EC2 > 인스턴스> 인스턴스> 인스턴스상태**


**(2) Node 성능문제는다음의경로에서확인가능**


**$ kubectl describe <Worker Node명>**


**$ kubectl top node <Worker Node명>**


**- AWS CloudWatch > 인사이트> Container Insights**


7


##### **03 .**

**Node 로깅및**
**이슈사례**
**조치방법**


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-503-full.png)

**4. Node 이슈사례발생시확인방법실습#2**


**(3) Node 용량문제가발생하였는지확인**


**$ kubectl describe <Worker Node명>**


**- AWS CloudWatch > 인사이트> Container Insights**


**- EKS Worker Node SSH 접속> 쉘에서** **df ‒h 명령어입력**


**(4) Node 업데이트문제확인**


**- AWS EKS > 클러스터> (생성된Cluster명) > 구성> 컴퓨팅> 노드그룹**


**> 생성된노드그룹이름클릭> 상태문제, 업데이트기록** **확인**


8


##### **03 .**

**Node 로깅및**
**이슈사례**
**조치방법**


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-504-full.png)
# **9 Kubernetes 트러블슈팅방법**

**04**
**POD 로깅및이슈사례조치방법**


1


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-505-full.png)

**실습내용**


**순서**


**1. POD 로깅방법소개**


**2. POD 이슈사례소개**


**3. POD 로깅방법실습**


**4. POD 이슈사례발생시확인방법실습**


2


##### **04.**

**POD 로깅및**
**이슈사례**
**조치방법**


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-506-full.png)

**1. POD 로깅방법소개**


##### **04.**

**POD 로깅및**
**이슈사례**
**조치방법**





|구분|상세 설명|
|---|---|
|**kubectl**|•** kubectl를이용한POD 정보및상태확인**<br>•** EKS Namespace 내POD의상태및이벤트확인가능**|
|**Container Insights**|•** EKS POD에서수집된Metrics값을종합해서출력**<br>•** 그래프및연결토폴로지맵, 리스트형태현황제공**|
|**Log groups**|•** EKS POD의Log 수집및검색가능**<br>•** Micro Service별각Container POD의로그별로조회가능**|
|**crictl**|•** Open Source Kubernetes의경우, 1.20 버전부터Runtime CRI-O로변경**<br>•** AWS EKS는1.22 버전까지도Runtime으로Docker 지원**|


3


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-507-full.png)

**2. POD 이슈사례소개**


##### **04.**

**POD 로깅및**
**이슈사례**
**조치방법**





|구분|상세 설명|
|---|---|
|**CrashLoopBackOff**|**• POD가시작과비정상종료를연속해서반복하는상태**<br>**->Container 자체의문제로정상기동(Running)이안되는상태**<br>**->Container Log 확인**|
|**Pending**|**• POD 스케쥴링(생성)시필요한자원이할당되지않았을때의상태**<br>**->CPU, Memory 부족으로스케쥴링할새Node가필요할때**<br>**->Mount할Persistent Volume이필요할때**|
|**ImagePullBackOff**|**• POD를실행할Container Image Pull이실패했을때**<br>**->Container Image를Pull할특정Registry와의네트워크연결가능여부확인**<br>**->특정Registry로의로그인혹은인증을위한Secret 등록확인**|
|**Evicted**|**• EKS Worker Node의용량이부족시발생**<br>**->Node 메모리용량**<br>**->Node 디스크(파일시스템) 용량**|


4


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-508-full.png)

**3. POD 로깅방법실습#1**


**(1) kubectl을통한POD 상태확인**


**$ kubectl describe <POD명>**


**(2) EKS POD의현재기준CPU, Memory 사용량정보확인**


**$ kubectl top POD < POD명>**


**(3) EKS POD의로그확인(Standard Output)**


**$ kubectl logs < POD명>**


5


##### **04.**

**POD 로깅및**
**이슈사례**
**조치방법**


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-509-full.png)

**3. POD 로깅방법실습#2**


**(4) Container Insight를통한EKS POD 메트릭모니터링현황확인**


**- AWS CloudWatch > 인사이트> Container Insights**


**(5) Log Group을통한EKS POD 로그수집현황확인**


##### **04.**

**POD 로깅및**
**이슈사례**
**조치방법**




**- AWS CloudWatch > 로그> 로그그룹> /aws/containerinsights/<EKS명>/application**


6


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-510-full.png)

**3. POD 로깅방법실습#3**


**(6) crictl를통한EKS POD 현황및상태확인(EKS는적용불가)**


**- Kubernetes Worker Node SSH 접속> crictl 설치후확인**


  **Open Source Kubernetes의경우, 1.20 버전부터Docker Runtime 사용중단**


  **대체할Runtime으로는containerd 및CRI-O를사용**


  **CRI-O의경우CNCF에서인큐베이팅중인공식프로젝트임(https://cri-o.io)**


  **CRI-O를사용하려면반드시crictl을사용해야하며, 설치방법은아래링크참고**


##### **04.**

**POD 로깅및**
**이슈사례**
**조치방법**



**https://github.com/kubernetes-sigs/cri-tools/blob/master/docs/crictl.md**


**AWS EKS의경우, 1.22버전까지도Docker를Runtime으로사용, cri-o 및crictl 적용불가**


7


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-511-full.png)

**4. POD 이슈사례발생시확인방법실습#1**


**(1) POD가CrashLoopBackOff 원인확인하는방법**


**$ kubectl logs <POD명>**


##### **04.**

**POD 로깅및**
**이슈사례**
**조치방법**




**- AWS CloudWatch > 로그> 로그그룹> /aws/containerinsights/<EKS명>/application**


**(2) POD Pending 문제는다음의경로에서확인가능**


**$ kubectl describe <POD명>**


**$ kubectl top POD <POD명>**


8


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-512-full.png)

**4. POD 이슈사례발생시확인방법실습#2**


**(3) POD ImagePullBackOff 원인확인**


**$ kubectl describe <POD명>**


**- Registry 로그인정보를Secret으로등록명령어**


**$ kubectl create secret generic <Secret명> \**


**--from-file=.dockerconfigjson=$HOME/.docker/config.json \**


**--type=kubernetes.io/dockerconfigjson**


9


##### **04.**

**POD 로깅및**
**이슈사례**
**조치방법**


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-513-full.png)

**4. POD 이슈사례발생시확인방법실습#3**


**- Registry 로그인정보를Secret 데이터확인명령어**


**$ kubectl get secret <Secret명> -o yaml**


##### **04.**

**POD 로깅및**
**이슈사례**
**조치방법**




**- Deployment 혹은POD에Secret Mount 구문(Manifest 혹은kubectl edit 적용)**


**apiVersion: v1**


**kind: Pod**


**spec:**


**containers:**


**- name: private-reg-container**


**image: <Container Image명>**


**imagePullSecrets:**


**- name: <Secret명>**


10


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-514-full.png)

**4. POD 이슈사례발생시확인방법실습#4**


**(4) POD Evicted 문제확인**


**$ kubectl describe <POD명>**


**$ kubectl top POD <POD명>**


**- AWS CloudWatch > 인사이트> Container Insights**


11


##### **04.**

**POD 로깅및**
**이슈사례**
**조치방법**


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-515-full.png)
# **9 Kubernetes 트러블슈팅방법**

**05**
**보안관련로깅및이슈사례조치방법**


1


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-516-full.png)

**실습내용**


**순서**


**1. 보안로깅방법소개**


**2. 보안이슈사례소개**


**3. 보안로깅방법실습**


**4. 보안이슈사례발생시확인방법실습**


2


##### **05 .**

**보안관련로깅및**
**이슈사례**
**조치방법**


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-517-full.png)

**1. 보안로깅방법소개**


##### **05 .**

**보안관련로깅및**
**이슈사례**
**조치방법**





|구분|상세 설명|
|---|---|
|**Access Log**|•** API 서버에request 및처리현황로깅**<br>•** AWS IAM 자격증명을사용한RBAC 인증내역로깅**|
|**Audit Log**|•** EKS 클러스터에접속해API, 명령어를사용하는사용자의감시로깅**<br>•** EKS 클러스터내부및외부시스템에서API를사용해처리된부분감시로깅**|
|**CloudTrail Log**|•** AWS Resource 사용을위한API 호출이벤트로깅**<br>•** AWS Management Console 내에서사용한계정이벤트로깅**|
|**WAF Log**|•** 인터넷에서사용자의웹서비스에접속하려는모든행위에대한로깅**<br>•** 해킹, 침입탐지, Bot, DDoS 공격등의취약점에대한보안로깅**|


3


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-518-full.png)

**2. 보안이슈사례소개**


**침입탐지** **보안취약점발견**

![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-518-0.png)


**특이API호출발견** **공격시도탐지**


4


##### **05 .**

**보안관련로깅및**
**이슈사례**
**조치방법**


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-519-full.png)

**3. 보안로깅방법실습#1**


**(1) Access Log를통한접속및처리내역확인**


**- AWS CloudWatch > 로그> 로그그룹> /aws/eks/<EKS명>/cluster/authenticator**

###### **(2) Audit Log를통한보안상태및보안취약점 확인**


##### **05 .**

**보안관련로깅및**
**이슈사례**
**조치방법**




**- AWS CloudWatch > 로그> 로그그룹> /aws/eks/<EKS명>/cluster/kube-apiserver-audit**


5


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-520-full.png)

**3. 보안로깅방법실습#2**


**(3) CloudTrail Log를통한AWS API Audit 로그확인**


**- AWS CloudWatch > 로그> 로그그룹> aws-cloudtrail-logs**


**(4) WAF Log를통한웹보안침입탐지로그확인**


**- AWS CloudWatch > 로그> 로그그룹> aws-waf-logs**


6


##### **05 .**

**보안관련로깅및**
**이슈사례**
**조치방법**


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-521-full.png)

**4. 보안이슈사례발생시확인방법실습**


**(1) 침입탐지/보안취약점발견(WAF)**


**- AWS WAF > Web ACLs > (생성된Web ACLs 선택) > Overview**


**(2) 특이API호출발견/공격시도탐지(CloudTrail)**


**- AWS CloudTrail > 이벤트기록> 전체이벤트기록보기**


7


##### **05 .**

**보안관련로깅및**
**이슈사례**
**조치방법**


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-522-full.png)

**실습아키텍처구성사항#1**


**1. AWS Network 구성**


**- VPC1개, Public Subnet 2개**


**- Internet Gateway 1개**


**2. AWS EKS 구성**


**- EKS Cluster 1개, EKS NodeGroup1개(2개Worker Node 생성)**


8


##### **05 .**

**보안관련로깅및**
**이슈사례**
**조치방법**


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-523-full.png)

**실습아키텍처구성사항#2**


**3.1 Terraform으로Backend생성**


##### **05 .**

**보안관련로깅및**
**이슈사례**
**조치방법**




**- IaC 경로: Ch09_05-security-troubleshooting > terraform-backend**


**3.2 terraform 명령어실행**


**$ terraform init**


**$ terraform plan**


**$ terraform apply**


9


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-524-full.png)

**실습아키텍처구성사항#3**


**4.1 Terraform으로AWS 클라우드아키텍처구성경로**


**- IaC 경로: Ch09_05-security-troubleshooting > terraform-codes**


**4.2 terraform 명령어실행하여전체아키텍처구성**


**$ terraform init**


**$ terraform plan**


**$ terraform apply**


10


##### **05 .**

**보안관련로깅및**
**이슈사례**
**조치방법**


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-525-full.png)

**실습아키텍처구성사항#4**


**5.1 Ingress 구성을위한IAM Policy 적용을위한예제코드경로로이동**


**>**

**- 경로: Ch09_05-security-troubleshooting** **iam-policy**


**5.2 Ingress 구성을위한IAM Policy 적용**


**$ aws iam create-policy --policy-name**


**AWSLoadBalancerControllerIAMPolicy --policy-document**


**file://iam_policy.json**


11


##### **05 .**

**보안관련로깅및**
**이슈사례**
**조치방법**


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-526-full.png)

**실습아키텍처구성사항#5**


**5.3 Ingress 구성을위한eksctl을통한Service Account 및IAM Role 설정**


**$ eksctl create iamserviceaccount \**


**--cluster=<EKS Cluster명> \**


**--namespace=kube-system \**


**--name=aws-load-balancer-controller \**


**--role-name "AmazonEKSLoadBalancerControllerRole" \**


##### **05 .**

**보안관련로깅및**
**이슈사례**
**조치방법**



**--attach-policy-arn=arn:aws:iam::<AWS 계정ID>:policy/AWSLoadBalancerControllerIAMPolicy \**


**--approve**


12


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-527-full.png)

**실습아키텍처구성사항#6**


**5.4 Ingress 구성을위한Helm Chart Repository 등록**


**$ helm repo add eks https://aws.github.io/eks-charts**


**5.5 Ingress 구성을위한AWS Load Balancer Controller를배포**


##### **05 .**

**보안관련로깅및**
**이슈사례**
**조치방법**



**$ helm install aws-load-balancer-controller eks/aws-load-balancer-**


**controller \**


**-n kube-system \**


**--set clusterName=<EKS 클러스터명> \**


**--set serviceAccount.create=false \**


**--set serviceAccount.name=aws-load-balancer-controller**


13


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-528-full.png)

**실습아키텍처구성사항#7**


**6.1 예제를위한마이크로서비스배포경로**


**- 경로: Ch09_05-security-troubleshooting > k8s-manifests**


**6.2 마이크로서비스의Deployment(POD), Service, Ingress 배포**


**$ kubectl apply -f ./**


14


##### **05 .**

**보안관련로깅및**
**이슈사례**
**조치방법**


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-529-full.png)
# **9 Kubernetes 트러블슈팅방법**

**06**
**DNS 로깅및이슈사례조치방법**


1


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-530-full.png)

**실습내용**


**순서**


**1. DNS 로깅방법소개**


**2. DNS 이슈사례소개**


**3. CoreDNS 튜닝설정**


**4. DNS 로깅방법실습**


**5. DNS 이슈사례발생시확인방법실습**


2


##### **06 .**

**DNS 로깅및이슈**
**사례조치방법**


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-531-full.png)

**1. DNS 로깅방법소개**


##### **06 .**

**DNS 로깅및이슈**
**사례조치방법**





|구분|상세 설명|
|---|---|
|**CoreDNS Log**|•** Kubernetes(EKS) 클러스터내모든DNS 쿼리를로깅**<br>•** DNS 쿼리를통한에러나성능저하요소확인**|
|**nslookup**|•** 기본적인DNS 쿼리툴**<br>•** 간단한명령과옵션으로각종DNS 쿼리가능**|
|**dig**|•** 전문적인DNS 쿼리툴**<br>•** 다양한명령과옵션으로고급DNS 쿼리가능**|
|**Route53 Log**|•** AWS Route53에등록된DNS 쿼리로깅**<br>•** DNS 쿼리를수행한Client의정보확인가능**|


3


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-532-full.png)

**2. DNS 이슈사례소개**


##### **06 .**

**DNS 로깅및이슈**
**사례조치방법**





|구분|상세 설명|
|---|---|
|**DNS 쿼리이슈**|**• POD의DNS 쿼리가안될시**<br>**-> DNS 디버깅용임시POD 배포(nslookup, dig 명령어수행가능)**<br>**->POD 내Shell 내부에서/etc/resolv.conf 설정**|
|**DNS 성능이슈**|**• DNS 쿼리과부하로성능이슈가발생할때**<br>**->Deployment에dnsConfig 설정**<br>**->ndot 적용및DNS 도메인FQDN화**|
|**CoreDNS 튜닝**|**• CoreDNS 설정변경으로성능및가용성을향상하고자할때**<br>**->cache 시간변경(TTL 시간증가)**<br>**->AWS Route53 직접연동**|


4


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-533-full.png)

**3. CoreDNS 튜닝설정**


**$ kubectl edit cm coredns -n kube-system**


**data:**


**Corefile: |**


**fastcampus.click { # DNS 도메인명추가**


**route53 fastcampus.click.:Z09958083P088Y5E7ZP8H # Route53 Hosted Zone ID 추가**


**}**


**.:53 {**


**errors**


**health**


**kubernetes cluster.local in-addr.arpa ip6.arpa {**


**pods insecure**


**fallthrough in-addr.arpa ip6.arpa**


**}**


**prometheus :9153**


**forward . /etc/resolv.conf**


**cache 60 # 30 -> 60 변경**


**loop**


**reload**


**loadbalance**


**log # 추가**


**}**


5


##### **06 .**

**DNS 로깅및이슈**
**사례조치방법**


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-534-full.png)

**4. DNS 로깅방법실습#1**


**(1) CoreDNS 로깅활성화**


**- 3번에명시된** **ConfigMap 내에서"log" 추가**


**(2) nslookup 명령어**


**- 기본쿼리**


**$ nslookup <DNS 도메인명>**


**- CNAME 쿼리**


**$ nslookup -q=cname <DNS 도메인명>**


**- 특정DNS 서버적용한쿼리**


**$ nslookup <DNS 도메인명> <특정DNS 서버IP>**


6


##### **06 .**

**DNS 로깅및이슈**
**사례조치방법**


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-535-full.png)

**4. DNS 로깅방법실습#2**


**(3) dig 명령어**


**- 기본쿼리**


**$ dig <DNS 도메인명>**


**- 요약쿼리**


**$ dig +short <DNS 도메인명>**


**- CNAME 쿼리**


**$ dig cname <DNS 도메인명>**


**- 특정DNS 서버적용한쿼리**


**$ dig @<특정DNS 서버IP> <DNS 도메인명>**


**- DNS 쿼리추적**


**$ dig +trace <DNS 도메인명>**


7


##### **06 .**

**DNS 로깅및이슈**
**사례조치방법**


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-536-full.png)

**4. DNS 로깅방법실습#3**


**(4) Route53 로깅(글로벌서비스는us-east1 리전선택)**


**- AWS CloudWatch > 로그> 로그그룹> /aws/route53/<지정한로그그룹명>**


8


##### **06 .**

**DNS 로깅및이슈**
**사례조치방법**


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-537-full.png)

**5. DNS 이슈사례발생시확인방법실습#1 - DNS 쿼리이슈**

###### **(1) DNS 디버깅용임시POD 배포(nslookup, dig 명령어수행가능)**


##### **06 .**

**DNS 로깅및이슈**
**사례조치방법**



**$ kubectl apply -f https://k8s.io/examples/admin/dns/dnsutils.yaml**


**(2) POD 내Shell 내부에서/etc/resolv.conf 설정**


**$ kubectl exec -it <대상POD명> ‒ sh**


**resolv.conf** **10.100.0.10**
**$ vi /etc/** **설정및$ nslookup kubernetes** **쿼리수행**


**nameserver 10.100.0.10**


**search default.svc.cluster.local svc.cluster.local cluster.local ec2.internal**


**options ndots:5**


9


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-538-full.png)

**5. DNS 이슈사례발생시확인방법실습#2 - DNS 성능이슈**


**(3) Deployment에dnsConfig 설정**


**- Manifest 수정혹은kubectl edit (spec.template.spec.dnsConfig 부분)**


**dnsPolicy: ClusterFirst**


**dnsConfig:**


**options:**


**- name: ndots**


**value: "1"**


**(4) ndot 적용및DNS 도메인FQDN화**


**- ndot:5가기본값이라모든DNS 도메인은최대5번까지쿼리수행**


##### **06 .**

**DNS 로깅및이슈**
**사례조치방법**




**- 특정도메인명맨끝에'.'(Dot)을추가하면해당도메인은FQDN으로인식해1번만쿼리**


10


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-539-full.png)

**5. DNS 이슈사례발생시확인방법실습#3 - CoreDNS 튜닝**


**$ kubectl edit cm coredns -n kube-system**


**data:**


**Corefile: |**


**fastcampus.click { # DNS 도메인명추가**


**route53 fastcampus.click.:Z09958083P088Y5E7ZP8H # Route53 Hosted Zone ID 추가**


**}**


**.:53 {**


**errors**


**health**


**kubernetes cluster.local in-addr.arpa ip6.arpa {**


**pods insecure**


**fallthrough in-addr.arpa ip6.arpa**


**}**


**prometheus :9153**


**forward . /etc/resolv.conf**


**cache 60 # 30 -> 60 변경**


**loop**


**reload**


**loadbalance**


**log # 추가**


**}**


11


##### **06 .**

**DNS 로깅및이슈**
**사례조치방법**


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-540-full.png)
# **10. Go를활용한Kubernetes CLI 개발**

**01**
**Go를활용한Kubernetes CLI 개발소개**


1


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-541-full.png)
###### **챕터소개**

**1.**
**Go를활용한Kubernetes CLI 개발소개**


**2. Go언어필수문법소개**


**3. Kubernetes Custom CLI 설계**


**4. [실습] Kubernetes API 활용모듈구현**


**5. [실습] Kubernetes CLI 빌드및실행**


2


##### **01 .**

**Go를활용한**
**Kubernetes**
**CLI 개발소개**


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-542-full.png)
###### **소개순서**

**1. Kubernetes Life Cycle 적용방법**


**2. YAML**
**방식의장점과단점**


**CLI**
**3. Go를활용한Kubernetes** **개발흐름**


**4. CDK8s**
**소개**


**5. CDK8s**
**특징**


**6. CDK8s**
**워크플로우**


3


##### **01 .**

**Go를활용한**
**Kubernetes**
**CLI 개발소개**


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-543-full.png)
##### **1. Kubernetes Life Cycle 적용방법 01 .**

**Go를활용한**
**Kubernetes**
**CLI 개발소개**


       선언적프로그래밍(명세)가가능한YAML 파일로작성후적용

       적용하고자하는 Desired State(원하는상태)를명시해적용

       kubectl 이나helm, kustomize등 Kubernetes CLI를통해적용

![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-543-0.png)


출처- https://aws.amazon.com/ko/blogs/korea/using-cdk8s-for-kubernetes-applications/


4


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-544-full.png)
##### **2. YAML 방식의장점과단점 01 .**

**Go를활용한**
**Kubernetes**
**CLI 개발소개**



**장점**


**사람이읽기쉬운형태**


**어디서든사용가능**


**선언적프로그래밍**


**원하는상태로배포/관리**


**Static한파일명세**



**YAML**
**(K8s Manifest,**

**Helm Charts,**

**Kustomize)**


5



**단점**


**다수자원, 환경일경우**


**중복부분처리필요**


**별도툴을이용해관리**


**코드가기존언어와상이**


**코드업데이트가복잡함**


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-545-full.png)
##### **3. Go를활용한Kubernetes CLI 개발흐름 01 .**

**Go를활용한**
**Kubernetes**
**CLI 개발소개**



![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-545-0.png)









6


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-546-full.png)
##### **4. CDK8s 소개#1 01 .**

**Go를활용한**
**Kubernetes**
**CLI 개발소개**


     CDK8s란, 개발자친화적인 프로그래밍언어와풍부한 객체지향API를


이용하여Kubernetes 애플리케이션과재사용가능한추상화를정의할수


있는소프트웨어개발 프레임워크


     CDK8s를통해각언어에서구성하고자하는Kubernetes 리소스를


작성하고, 배포할수있는 YAML 파일생성가능


     중앙에서모든 Addon 및Kuberentes Cluster 자원버전/설정 관리


     Git을통한 버전 관리및 확장 가능


7


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-547-full.png)
##### **4. CDK8s 소개#2 01 .**

**Go를활용한**
**Kubernetes**
**CLI 개발소개**

![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-547-0.png)


8


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-548-full.png)
##### **5. CDK8s 특징 01 .**

**Go를활용한**
**Kubernetes**
**CLI 개발소개**

|특징|상세내용|
|---|---|
|**K8s App 정의용이**|• 익숙한프로그래밍언어로Kubernetes 애플리케이션을정의<br>• Go, Java, Python, Typescript|
|**모든K8s 환경에서실행**|• 로컬환경에서실행가능및YAML 파일생성후K8s 클러스터에배포가능<br>• Public 및On-Premise 클라우드에서도동일한코드로표준화가능|
|**코드라이브러리작성및공유**|• 템플릿보다관리가용이한라이브러리형태로작성및공유가능<br>• K8s 애플리케이션정의를위한라이브러리를표준화및재사용가능|
|**App 워크플로우단순화**|• 애플리케이션을개발하는것과동일한툴을사용해워크플로우정의<br>• 작성한코드를CI/CD Pipeline을통해K8s에자동화된배포가능|



9


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-549-full.png)
##### **6. CDK8s 워크플로우 01 .**

**Go를활용한**
**Kubernetes**
**CLI 개발소개**


   개발자는자기가원하는언어로 코드를작성하고, CDK8s CLI를통해서
코드를쿠버네티스매니페스트 YAML 파일로전환이가능

   전환된 YAML은 kubectl CLI를통해서kubernetes Cluster에 배포하거나,
버전/형상관리 및배포가능
GitOps Repository를활용해

![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-549-0.png)


출처- https://aws.amazon.com/ko/blogs/korea/using-cdk8s-for-kubernetes-applications/


10


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-550-full.png)
# **10. Go를활용한Kubernetes CLI 개발**

**02**
**Go언어필수문법소개**


1


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-551-full.png)
###### **소개내용**

**1. Go언어소개**


**2. Go언어설치**


**3. Go언어필수문법1 - 함수**


**4. Go언어필수문법2 - 구조체**


**5. Go언어필수문법3 ‒ 패키지**


**6. Go언어필수문법4 ‒ 메서드**


**7. go.mod 및go.sum 파일소개**


##### **02 .**

**Go언어필수문법**
**소개**



2


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-552-full.png)
##### **02 .**
###### **1. Go언어소개**

**Go언어필수문법**
**소개**


Go는2009년구글에서일하는로버트그리즈머, 롭파이크, 켄톰프슨이개발한
프로그래밍언어이다.
가비지컬렉션기능이있고, 병행성(concurrent)을잘지원하는 컴파일언어다. 구문이C와
비슷하지만메모리보안, 가비지컬렉션, 구조타이핑, CSP 스타일병행성을제공한다.
이언어는golang.org이라는도메인이름때문에종종고랭(Golang)으로도호칭되지만
정확한명칭은Go이다.
2개의주요구현체가있다. 하나는구글의셀프호스팅 컴파일러 툴체인으로서여러운영체제,
모바일장치, 웹어셈블리를대상으로한다. 나머지하나는GCC 프론트엔드인 가있다.
gccgo
서드파티트랜스파일러GopherJS는프론트엔드웹개발을위해Go를자바스크립트로
컴파일한다.

![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-552-0.png)


출처- https://ko.wikipedia.org/wiki/Go_(%ED%94%84%EB%A1%9C%EA%B7%B8%EB%9E%98%EB%B0%8D_%EC%96%B8%EC%96%B4)


3


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-553-full.png)
###### **2. Go언어설치#1**

**(1) 설치파일다운로드URL**


**https://go.dev/doc/install**


**(2) MacOS 및Windows 설치방법**


**- 설치파일** **다운로드후실행해서설치**


##### **02 .**

**Go언어필수문법**
**소개**



4


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-554-full.png)
###### **2. Go언어설치#1**

**(3) Linux설치방법**


**- 다운로드된파일을** **/usr/local/go에압축을품**


**$ tar -C /usr/local -xzf <다운로드받은go 압축파일>**


**-**
**PATH 환경변수** **추가방법**


**>**
**/etc/profile 혹은** **$HOME/.bash_profile에다음의구문을추가**


**PATH=$PATH:/usr/local/go/bin**


5


##### **02 .**

**Go언어필수문법**
**소개**


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-555-full.png)
###### **3. Go언어필수문법1 ‒ 함수#1**


  함수(func)는여러문장을묶어서실행하는 코드블럭의단위


  Go에서함수는func 키워드를사용하여정의


  func 뒤에함수명을적고, 괄호( ) 안에그함수에전달하는 파라미터를명시


##### **02 .**

**Go언어필수문법**
**소개**




함수파라미터는0개이상사용할수있는데, 각파라미터는파라미터명뒤에 int,


string 등의파라미터타입을적어서정의


함수의리턴타입은 파라미터괄호( ) 뒤에적게 되는데, 이는C와같은다른언어에서


리턴타입을함수명앞에쓰는것과는다른형태임


함수는패키지안에정의되며, 호출되는함수가호출하는함수의 반드시앞에위치해야


할필요는없음


6


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-556-full.png)

**3. Go언어필수문법1 ‒ 함수#2**


func NewMyChart(scope constructs.Construct, id string, props *MyChartProps) cdk8s.Chart {

var cprops cdk8s.ChartProps
if props != nil {

cprops = props.ChartProps
}
chart := cdk8s.NewChart(scope, jsii.String(id), &cprops)


.. 중략 ..


return chart
}


func main() {

app := cdk8s.NewApp(nil)
NewMyChart(app, "hello", nil)
app.Synth()
}


7


##### **02 .**

**Go언어필수문법**
**소개**


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-557-full.png)
###### **4. Go언어필수문법2 - 구조체#1**


  Go에서 구조체(struct)는 을표현하는데사용되며,
Custom Data Type


필드들의집합체로사용


  구조체는 필드데이타만을가지며, 행위를표현하는메서드를갖지않음


##### **02 .**

**Go언어필수문법**
**소개**




Go 언어는객체지향프로그래밍(Object Oriented Programming, OOP)을고유의


방식으로지원하기때문에 클래스, 객체, 상속개념이없음


OOP의 클래스(class)는Go 언어에서Custom 타입을정의하는 struct로표현


전통적인OOP의클래스가필드와메서드를함께갖는것과달리Go 언어의구조체는


필드만을가지며, 메서드는별도로분리하여정의


8


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-558-full.png)

**4. Go언어필수문법2 - 구조체#2**


type MyChartProps struct {

cdk8s.ChartProps
}


##### **02 .**

**Go언어필수문법**
**소개**



9


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-559-full.png)
###### **5. Go언어필수문법3 ‒ 패키지#1**


  Go는 패키지(Package)를통해 코드의모듈화, 코드의재사용 기능을제공


##### **02 .**

**Go언어필수문법**
**소개**




Go는패키지를사용해서작은단위의 컴포넌트를작성하고, 이러한작은 패키지들을


활용해서프로그램을작성할것을권장


Go는실제프로그램개발에필요한많은패키지들을 표준라이브러리로제공


main 패키지인경우, 컴파일러는해당패키지를공유라이브러리가아닌


실행(executable) 프로그램으로만듬


main 패키지안의 main() 함수가프로그램의시작점(EntryPoint)가된다. 패키지를


공유라이브러리로만들때에는, main 패키지나main 함수를사용해서는안됨


import는다른패키지를프로그램에서사용하기위해서는 패키지를포함시키는방법


10


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-560-full.png)

**5. Go언어필수문법3 ‒ 패키지#2**


package main


import (

"example.com/hello-k8s/imports/k8s"
"github.com/aws/constructs-go/constructs/v3"
"github.com/aws/jsii-runtime-go"
"github.com/cdk8s-team/cdk8s-core-go/cdk8s"
)


.. 중략 ..


func main() {

app := cdk8s.NewApp(nil)
NewMyChart(app, "hello", nil)
app.Synth()
}


##### **02 .**

**Go언어필수문법**
**소개**



11


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-561-full.png)
###### **6. Go언어필수문법4 ‒ 메서드#1**


##### **02 .**

**Go언어필수문법**
**소개**




타언어의OOP의클래스가필드와메서드를함께갖는것과달리Go 언어에서는


struct가필드만을가지며, 메서드는별도로분리되어정의


Go 메서드는특별한형태의func 함수임


메서드는함수정의에서func 키워드와함수명사이에"그함수가어떤struct를


위한메서드인지"를표시하며, 흔히receiver로불리우는이부분은 메서드가속한


struct 타입과struct 변수명을지정


struct 변수명은함수내에서마치 입력파라미터처럼사용


12


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-562-full.png)

**6. Go언어필수문법4 ‒ 메서드#2**


13



import (

"example.com/hello-k8s/imports/k8s"
"github.com/aws/constructs-go/constructs/v3"
"github.com/aws/jsii-runtime-go"
"github.com/cdk8s-team/cdk8s-core-go/cdk8s"
)


type MyChartProps struct {

cdk8s.ChartProps
}


func NewMyChart(scope constructs.Construct, id string, props *MyChartProps) cdk8s.Chart {

var cprops cdk8s.ChartProps
if props != nil {

cprops = props.ChartProps
}
chart := cdk8s.NewChart(scope, jsii.String(id), &cprops)


label := map[string]*string{"app": jsii.String("hello-k8s")}


k8s.NewKubeDeployment(chart, jsii.String("deployment"), &k8s.KubeDeploymentProps{

Spec: &k8s.DeploymentSpec{

Replicas: jsii.Number(2),
Selector: &k8s.LabelSelector{

MatchLabels: &label,
},
Template: &k8s.PodTemplateSpec{

Metadata: &k8s.ObjectMeta{

Labels: &label,
},
Spec: &k8s.PodSpec{

Containers: &[]*k8s.Container{{

Name: jsii.String("hello-kubernetes"),
Image: jsii.String("paulbouwer/hello-kubernetes:1.7"),
Ports: &[]*k8s.ContainerPort{{ContainerPort: jsii.Number(8080)}},
}},
},
},
},
})
return chart
}


##### **02 .**

**Go언어필수문법**
**소개**


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-563-full.png)
###### **7. go.mod 및go.sum 파일소개**


##### **02 .**

**Go언어필수문법**
**소개**




**go.mod 파일은** **모듈즉, 패키지(Package)의모음으로, 한개의모듈은다수의**


**패키지를포함**


**go.mod 내명시된모듈을통해Go언어는** **패키지들의종속성(Dependency)를**


**관리할수있으며, 모듈은패키지관리기반으로활용**


**모듈은패키지를트리형식으로관리하며, Go프로젝트root 디렉토리에go.mod**


**파일을생성해모듈을정의하고, 종속성정보를관리**


**파일은** **를위해자동생성**
**go.sum** **go.mod로받은패키지의무결성(중복방지)**


**go.sum으로** **Go프로젝트재실행시모든패키지를다시설치하지않음**


14


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-564-full.png)
# **10. Go를활용한Kubernetes CLI 개발**

**03**
**Kubernetes Custom CLI 설계**


1


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-565-full.png)
###### **소개내용**

**1.**
**GitOps에CDK8s를통합하기**


**Construct**
**2. CDK8s의** **자세히살펴보기**


**3. CDK8s를이용한Go 언어기반Kubernetes Custom CLI 모듈작성** **예**


##### **03 .**

**Kubernetes**

**Custom CLI**
**설계**



**4. CDK8s를이용한Go 언어기반** **CLI 모듈빌드** **및실행후** **Manifest 생성** **예**


**5. CDK8s를이용한Go 언어기반Kubernetes Custom CLI 모듈생성실습**


2


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-566-full.png)
###### **1. GitOps에CDK8s를통합하기**


##### **03 .**

**Kubernetes**

**Custom CLI**
**설계**



![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-566-0.png)























3


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-567-full.png)
##### **2. CDK8s의Construct 자세히살펴보기 03 .**

**Kubernetes**

**Custom CLI**
**설계**


    **Construct**
**CDK8s에서** **는K8s API 제공객체형태로K8s 리소스를정의**

    **Construct는** **트리** **구조형태로하위Construct를** **OOP방식의객체로구현**

    **상위Construct로여러개의** **Construct를묶어** **다수의K8s 객체를생성가능**

![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-567-0.png)


4


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-568-full.png)

**3. CDK8s를이용한Go 언어기반Kubernetes Custom CLI 모듈작성예**


**func NewMyChart(scope constructs.Construct, id string, props *MyChartProps) cdk8s.Chart {**

**var cprops cdk8s.ChartProps**
**if props != nil {**

**cprops = props.ChartProps**
**}**
**chart := cdk8s.NewChart(scope, jsii.String(id), &cprops)**


**label := map[string]*string{"app": jsii.String("hello-k8s")}**


**k8s.NewKubeDeployment(chart, jsii.String("deployment"), &k8s.KubeDeploymentProps{**

**Spec: &k8s.DeploymentSpec{**

**Replicas: jsii.Number(2),**
**Selector: &k8s.LabelSelector{**

**MatchLabels: &label,**
**},**
**Template: &k8s.PodTemplateSpec{**

**Metadata: &k8s.ObjectMeta{**

**Labels: &label,**
**},**
**Spec: &k8s.PodSpec{**

**Containers: &[]*k8s.Container{{**

**Name: jsii.String("hello-kubernetes"),**
**Image: jsii.String("paulbouwer/hello-kubernetes:1.7"),**
**Ports: &[]*k8s.ContainerPort{{ContainerPort: jsii.Number(8080)}},**
**}},**
**},**
**},**
**},**
**})**
**return chart**
**}**


5


##### **03 .**

**Kubernetes**

**Custom CLI**
**설계**


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-569-full.png)

**4. CDK8s를이용한Go 언어기반CLI 모듈빌드및실행후Manifest 생성예**


**apiVersion: apps/v1**
**kind: Deployment**
**metadata:**

**name: hello-go-deployment-c8765698**
**spec:**

**replicas: 2**
**selector:**

**matchLabels:**

**app: hello-k8s**
**template:**

**metadata:**

**labels:**

**app: hello-k8s**
**spec:**

**containers:**

**- image: paulbouwer/hello-kubernetes:1.7**

**name: hello-kubernetes**

**ports:**

**- containerPort: 8080**


6


##### **03 .**

**Kubernetes**

**Custom CLI**
**설계**


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-570-full.png)

**5. CDK8s를이용한Go 언어기반Kubernetes Custom CLI 모듈생성실습**


**(1) 수행경로**


**src**

**- $GOPATH/**


**$ mkdir hello; cd hello**


**(2) CDK8s를이용한Go 언어기반Kubernetes Custom CLI 모듈생성**


**$ cdk8s init go-app**


7


##### **03 .**

**Kubernetes**

**Custom CLI**
**설계**


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-571-full.png)
# **10. Go를활용한Kubernetes CLI 개발**

**04**
**Kubernetes API 활용모듈구현**


1


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-572-full.png)

**실습내용**


**순서**


**1. cdk8s 설치**


**2. go 언어기반모듈디렉토리구조**


**3. Kubernetes API 활용모듈구현된부분확인**


**예제코드경로**


**Chapter10**


2


##### **04 .**

**Kubernetes**
**API 활용모듈**
**구현**


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-573-full.png)

**1. cdk8s 설치**


**(1) MacOS 설치**


**$ brew install cdk8s**


**(2) Linux 및Windows 설치**


**- npm**


**$**
**npm install -g cdk8s-cli**


**- yarn**


**$**
**yarn global add cdk8s-cli**


##### **04 .**

**Kubernetes**
**API 활용모듈**
**구현**



3


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-574-full.png)

**2. go 언어기반모듈디렉토리구조**


**.**


**├── cdk8s.yaml**


**├── dist**


**│└── <K8s Manifest Name>.yaml**


**├── go.mod**


**├── go.sum**


**├── imports**


**│└── k8s**


**│** **├── internal**


**│** **│└── types.go**


**│** **├── jsii**


**│** **│├── jsii.go**


**│** **│└── k8s-0.0.0.tgz**


**│** **├── k8s.go**


**│** **├── k8s.init.go**


**│** **└── version**


**├── main.go**


**└── package.json**


##### **04 .**

**Kubernetes**
**API 활용모듈**
**구현**



4


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-575-full.png)

**3. Kubernetes API 활용모듈구현된부분확인**


##### **04 .**

**Kubernetes**
**API 활용모듈**
**구현**





|구분|상세 설명|
|---|---|
|**cdk8s.ChartProps**<br>**(struct)**|•** ChartProperties를구현하는구조체**<br>•** 기본적인K8sManifest 및HelmChart구조를포괄해서구현가능**|
|**k8s.NewKubeService**<br>**(func)**|•** kubernetes상의ServiceObject를생성하기위해사용**<br>•** type을ClusterIP, NodePort, LoadBalancer등지정가능**<br>•** Port및Target Port지정가능**|
|**k8s.NewKubeDeployment**<br>**(func)**|•** kubernetes상의Deployment Object를생성하기위해사용**<br>•** Replicas 및Selector와같은공통적인Property 적용가능**<br>•** POD를위한Container명과Image URL(Tag) 및Port등적용가능**|


5


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-576-full.png)
# **10. Go를활용한Kubernetes CLI 개발**

**05**
**Kubernetes CLI 빌드및실행**


1


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-577-full.png)

**실습내용**


**순서**


**1. go 언어기반Microservice 컨테이너빌드** **및AWS ECR Push**


**2. go 언어기반** **모듈로Kubernetes Custom CLI 빌드** **및실행**


**3. 생성된K8s Manifest 배포** **및기동**


**예제코드경로**


**Chapter10**


2


##### **05 .**

**Kubernetes**
**CLI 빌드및실행**


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-578-full.png)

**1. go 언어기반Microservice 컨테이너빌드및AWS ECR Push**


**(1) go 언어기반Microservice 컨테이너빌드명령어**


**- 소스코드경로: Chapter10 > container**


**.**
**$ docker build -t <AWS ECR Repository명>:<Tag명>**


**(2) AWS ECR 로그인**


**$ aws ecr get-login-password --region ap-northeast-2 | docker login \**


**--username AWS --password-stdin <AWS ECR Repository명>**


**(3) AWS ECR로의빌드된컨테이너Push**


**$ docker push <AWS ECR Repository명>:<Tag명>**


3


##### **05 .**

**Kubernetes**
**CLI 빌드및실행**


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-579-full.png)

**2. go 언어기반모듈로Kubernetes Custom CLI 빌드및실행**


##### **05 .**

**Kubernetes**
**CLI 빌드및실행**



**(1) go 언어기반모듈로Kubernetes CLI 빌드를위한Dependency Import**


**- 소스코드경로: Chapter10 > cdk8s**


**$ cdk8s import**


**(2) go 언어기반모듈로Kubernetes Custom CLI 빌드및실행**


**$ cdk8s synth**


4


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-580-full.png)

**3. 생성된K8s Manifest 배포및기동**


**(1) Kubernetes CLI 빌드및실행후생성된K8s Manifest 배포및기동**


**- 소스코드경로: Chapter10 > cdk8s**


**$ kubectl apply -f dist/<지정한애플리케이션명>.k8s.yaml**


**(2) K8s Manifest 배포후정상기동확인**


**$ kubectl get pods**


**$ kubectl get services**


**(3) 웹애플리케이션접속**


**http://<Service의EXTERNAL-IP(DNS주소명)>:80/edit/ANewPage**


5


##### **05 .**

**Kubernetes**
**CLI 빌드및실행**


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-581-full.png)
### **11. Kubernetes 활용미니프로젝트수행하기**

**01**
**Kubernetes 활용미니프로젝트소개**


1


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-582-full.png)

**1. 어떤기술을사용할것인가?**


   AWS
클라우드:


   Docker
컨테이너런타임:


   Kubernetes
컨테이너플랫폼:


   AWS ECR
컨테이너레지스트리:


   Github
버전제어시스템(VCS) :


   CI(Continuous Integration) : Jenkins


   CD(Continuous Delivery) : ArgoCD, Argo Rollout


2


##### **01 .**

**Kubernetes**
**활용**
**미니프로젝트**
**소개**


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-583-full.png)

**2. Kubernetes 활용미니프로젝트소개**


##### **01 .**

**Kubernetes**
**활용**
**미니프로젝트**
**소개**



![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-583-0.png)























3


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-584-full.png)

**3. 미니프로젝트구성아키텍처소개**


Internet


##### **01 .**

**Kubernetes**
**활용**
**미니프로젝트**
**소개**



Inbound Traffic


Outbound Traffic



User



Registry

















![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-584-0.png)

![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-584-1.png)


|AWS Cloud<br>Route53<br>Internet gateway<br>Elastic Container Registry<br>VPC (Primary : 172.31.0.0/16)<br>Router<br>(ap-northeast-2c)<br>Availability Zone (ap-northeast-2a) Availability Zone<br>Public subnet1 (172.31.0.0/20) Public subnet3 (172.31.16.0/20)<br>S3 Bucket<br>Application<br>(Terraform State)<br>Load Balancer<br>EKS Cluster<br>EKS Namespace<br>POD POD<br>DynamoDB (Container) (Container)<br>(Terraform Lock) Ingress<br>POD POD<br>Service<br>(Container) (Container)<br>API Server<br>1<br>EKS Node Group<br>EKS Worker Node EKS Worker Node<br>4|Col2|Col3|Col4|Col5|Col6|Col7|Col8|
|---|---|---|---|---|---|---|---|
|4<br>AWS Cloud<br>VPC (Primary : 172.31.0.0/16)<br>Availability Zone (ap-northeast-2a)<br>Public subnet1 (172.31.0.0/20)<br>Availability Zone(ap-northeast-2c)<br>Internet gateway<br>EKS Cluster<br>EKS Node Group1<br>S3 Bucket<br>(Terraform State)<br>DynamoDB<br>(Terraform Lock)<br>Public subnet3 (172.31.16.0/20)<br>Application<br>Load Balancer<br>EKS Worker Node<br>EKS Worker Node<br>Router<br>POD<br>(Container)<br>POD<br>(Container)<br>EKS Namespace<br>Ingress<br>Service<br>API Server<br>POD<br>(Container)<br>POD<br>(Container)<br>Route53<br>Elastic Container Registry|4<br>AWS Cloud<br>VPC (Primary : 172.31.0.0/16)<br>Availability Zone (ap-northeast-2a)<br>Public subnet1 (172.31.0.0/20)<br>Availability Zone(ap-northeast-2c)<br>Internet gateway<br>EKS Cluster<br>EKS Node Group1<br>S3 Bucket<br>(Terraform State)<br>DynamoDB<br>(Terraform Lock)<br>Public subnet3 (172.31.16.0/20)<br>Application<br>Load Balancer<br>EKS Worker Node<br>EKS Worker Node<br>Router<br>POD<br>(Container)<br>POD<br>(Container)<br>EKS Namespace<br>Ingress<br>Service<br>API Server<br>POD<br>(Container)<br>POD<br>(Container)<br>Route53<br>Elastic Container Registry|Availability Zone (ap-northeast-2a)<br>Public subnet1 (172.31.0.0/20)|Availability Zone (ap-northeast-2a)<br>Public subnet1 (172.31.0.0/20)|Availability Zone (ap-northeast-2a)<br>Public subnet1 (172.31.0.0/20)|Availability Zone (ap-northeast-2a)<br>Public subnet1 (172.31.0.0/20)|Availability Zone(ap-northeast-2c)<br>Public subnet3 (172.31.16.0/20)<br>EKS Worker Node<br>POD<br>(Container)<br>POD<br>(Container)|Availability Zone(ap-northeast-2c)<br>Public subnet3 (172.31.16.0/20)<br>EKS Worker Node<br>POD<br>(Container)<br>POD<br>(Container)|
|4<br>AWS Cloud<br>VPC (Primary : 172.31.0.0/16)<br>Availability Zone (ap-northeast-2a)<br>Public subnet1 (172.31.0.0/20)<br>Availability Zone(ap-northeast-2c)<br>Internet gateway<br>EKS Cluster<br>EKS Node Group1<br>S3 Bucket<br>(Terraform State)<br>DynamoDB<br>(Terraform Lock)<br>Public subnet3 (172.31.16.0/20)<br>Application<br>Load Balancer<br>EKS Worker Node<br>EKS Worker Node<br>Router<br>POD<br>(Container)<br>POD<br>(Container)<br>EKS Namespace<br>Ingress<br>Service<br>API Server<br>POD<br>(Container)<br>POD<br>(Container)<br>Route53<br>Elastic Container Registry|EKS<br>API Server|4<br> Cluster<br>EKS Worker Node<br>POD<br>(Container)<br>POD<br>(Container)|4<br> Cluster<br>EKS Worker Node<br>POD<br>(Container)<br>POD<br>(Container)|4<br> Cluster<br>EKS Worker Node<br>POD<br>(Container)<br>POD<br>(Container)||EKS Worker Node<br>POD<br>(Container)<br>POD<br>(Container)|EKS Worker Node<br>POD<br>(Container)<br>POD<br>(Container)|
|4<br>AWS Cloud<br>VPC (Primary : 172.31.0.0/16)<br>Availability Zone (ap-northeast-2a)<br>Public subnet1 (172.31.0.0/20)<br>Availability Zone(ap-northeast-2c)<br>Internet gateway<br>EKS Cluster<br>EKS Node Group1<br>S3 Bucket<br>(Terraform State)<br>DynamoDB<br>(Terraform Lock)<br>Public subnet3 (172.31.16.0/20)<br>Application<br>Load Balancer<br>EKS Worker Node<br>EKS Worker Node<br>Router<br>POD<br>(Container)<br>POD<br>(Container)<br>EKS Namespace<br>Ingress<br>Service<br>API Server<br>POD<br>(Container)<br>POD<br>(Container)<br>Route53<br>Elastic Container Registry|EKS<br>API Server|4<br> Cluster<br>EKS Worker Node<br>POD<br>(Container)<br>POD<br>(Container)|POD<br>(Container)<br>POD<br>(Container)|POD<br>(Container)<br>POD<br>(Container)|EKS Namespace<br>Ingress<br>Service|POD<br>(Container)<br>POD<br>(Container)|POD<br>(Container)<br>POD<br>(Container)|
|4<br>AWS Cloud<br>VPC (Primary : 172.31.0.0/16)<br>Availability Zone (ap-northeast-2a)<br>Public subnet1 (172.31.0.0/20)<br>Availability Zone(ap-northeast-2c)<br>Internet gateway<br>EKS Cluster<br>EKS Node Group1<br>S3 Bucket<br>(Terraform State)<br>DynamoDB<br>(Terraform Lock)<br>Public subnet3 (172.31.16.0/20)<br>Application<br>Load Balancer<br>EKS Worker Node<br>EKS Worker Node<br>Router<br>POD<br>(Container)<br>POD<br>(Container)<br>EKS Namespace<br>Ingress<br>Service<br>API Server<br>POD<br>(Container)<br>POD<br>(Container)<br>Route53<br>Elastic Container Registry|EKS<br>API Server|4<br> Cluster<br>EKS Worker Node<br>POD<br>(Container)<br>POD<br>(Container)|POD<br>(Container)<br>POD<br>(Container)|POD<br>(Container)<br>POD<br>(Container)||||
|4<br>AWS Cloud<br>VPC (Primary : 172.31.0.0/16)<br>Availability Zone (ap-northeast-2a)<br>Public subnet1 (172.31.0.0/20)<br>Availability Zone(ap-northeast-2c)<br>Internet gateway<br>EKS Cluster<br>EKS Node Group1<br>S3 Bucket<br>(Terraform State)<br>DynamoDB<br>(Terraform Lock)<br>Public subnet3 (172.31.16.0/20)<br>Application<br>Load Balancer<br>EKS Worker Node<br>EKS Worker Node<br>Router<br>POD<br>(Container)<br>POD<br>(Container)<br>EKS Namespace<br>Ingress<br>Service<br>API Server<br>POD<br>(Container)<br>POD<br>(Container)<br>Route53<br>Elastic Container Registry|EKS<br>API Server|4<br> Cluster<br>EKS Worker Node<br>POD<br>(Container)<br>POD<br>(Container)|4<br>EKS Worker Node|4<br>EKS Worker Node|EKS Node Group1|EKS Worker Node|EKS Worker Node|
|4<br>AWS Cloud<br>VPC (Primary : 172.31.0.0/16)<br>Availability Zone (ap-northeast-2a)<br>Public subnet1 (172.31.0.0/20)<br>Availability Zone(ap-northeast-2c)<br>Internet gateway<br>EKS Cluster<br>EKS Node Group1<br>S3 Bucket<br>(Terraform State)<br>DynamoDB<br>(Terraform Lock)<br>Public subnet3 (172.31.16.0/20)<br>Application<br>Load Balancer<br>EKS Worker Node<br>EKS Worker Node<br>Router<br>POD<br>(Container)<br>POD<br>(Container)<br>EKS Namespace<br>Ingress<br>Service<br>API Server<br>POD<br>(Container)<br>POD<br>(Container)<br>Route53<br>Elastic Container Registry|EKS<br>API Server|4<br> Cluster<br>EKS Worker Node<br>POD<br>(Container)<br>POD<br>(Container)|4<br>EKS Worker Node|4<br>EKS Worker Node||||
|||||||||


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-585-full.png)
###### **4. 미니프로젝트를통해실습해볼수있는것들**

**(1) AWS와Terraform 알아보기**


**(2) Terraform을활용한Kubernetes(EKS) 구축하기**


**알아보기**
**(3) Kubernetes(EKS)**


**/**
**에배포** **실행하기**
**(4) Kubernetes(EKS)**


**Kubernetes**
**애플리케이션을** **에서구축하기**
**(5)**


**(6) Ingress를Kubernetes(EKS)에구성하기**


**(7) 애플리케이션을빌드/배포하기위한사전준비**


**(8) 애플리케이션을CI/CD Pipeline으로빌드/배포하기**


**(9) AWS ECR 활용및컨테이너Push**


5


##### **01 .**

**Kubernetes**
**활용**
**미니프로젝트**
**소개**


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-586-full.png)
###### **4.1 AWS와Terraform 알아보기**


      DevOps를수행하기위한가장기본적인단계는서비스를배포하고


기동할환경을구성한다.


      AWS 계정을준비하고, AWS내에환경및리소스를구성할수있다.


      Terraform을사용할수있도록미리Local PC에설치를진행한다.


6


##### **01 .**

**Kubernetes**
**활용**
**미니프로젝트**
**소개**


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-587-full.png)
###### **4.2 Terraform을활용한Kubernetes(EKS) 구축하기**


##### **01 .**

**Kubernetes**
**활용**
**미니프로젝트**
**소개**




AWS 클라우드의Kubernetes 서비스인EKS를Terraform으로구성하여


실무에서도필요시손쉽게Kubernetes를만들수있는방법을배운다.


Terraform으로AWS 리소스및Kubernetes(EKS)를프로비저닝가능하다.


구축이완료되면kubectl, eksctl을설치및설정후kubernetes(EKS)를제어


할수있다.


7


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-588-full.png)
###### **4.3** **알아보기** **Kubernetes(EKS)**


       Kubernetes는마이크로서비스아키텍처(MSA) 기반의컨테이너들을


##### **01 .**

**Kubernetes**
**활용**
**미니프로젝트**
**소개**



하나의관리영역에모와안정적으로운영하고확장성있게사용하면서


자동화된관리방법으로적용하기위한대표적인컨테이너플랫폼이자


컨테이너오케스트레이션이다.


Kubernetes(EKS) 배포를통해Kubernetes 리소스종류파악및정리를


수행한다.


kubectl로자주쓰이는명령어실행및결과를확인할수있다.


Helm으로자주쓰이는명령어실행및결과를확인할수있다.


8


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-589-full.png)
###### **4.4** **에배포/실행하기** **Kubernetes(EKS)**


##### **01 .**

**Kubernetes**
**활용**
**미니프로젝트**
**소개**




Kubernetes(EKS)로의배포된서비스POD로의접근을하기위한Ingress를


구성하기위해AWS Load Balancer Controller 배포를한다.


컨테이너Kubernetes에배포할Manifest 작성및배포, Ingress를통한접속


확인을수행할수있다.


Helm Charts 생성및코드변경후Kubernetes(EKS)에Helm Chart를통한


배포, Ingress를통한접속확인을수행할수있다.


9


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-590-full.png)
###### **Kubernetes** **4.5 애플리케이션을 에서구축하기**


       애플리케이션을구성하기위해자동화된CI/CD Pipeline이필요하다.


       CI는Jenkins을통해마이크로서비스를컨테이너로빌드하고, CD로


##### **01 .**

**Kubernetes**
**활용**
**미니프로젝트**
**소개**



ArgoCD를사용해Kubernetes에컨테이너를POD로배포하고기동한다.


배포된마이크로서비스가정상동작하는지기능을확인한다.


10


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-591-full.png)
###### **4.6 Ingress를Kubernetes(EKS)에구성하기**


##### **01 .**

**Kubernetes**
**활용**
**미니프로젝트**
**소개**




Ingress란웹통신을라우팅및각종웹관련서비스를처리할수있도록기능을


제공하는L7 레이어의Inbound용Reverse Proxy(Load Balancer)이다.


Ingress를사용해API Gateway로의기능도사용이가능하며, 각URI Path별로


라우팅처리를할수있도록적용가능하다.


HTTPS 암호화통신구현을위해TLS 인증서를적용하여TLS Offload를구현해


암호화통신을적용할수있다.


11


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-592-full.png)
###### **4.7 애플리케이션을빌드/배포하기위한사전준비**

**1. Jenkins**


##### **01 .**

**Kubernetes**
**활용**
**미니프로젝트**
**소개**




  Jenkins는 CI(Continuous Integration, 지속통합)와 CD(Continuous Deployment,


지속배포)를위한서비스이다.


  Jenkins에서가장상위개념인Pipeline은자동화해놓은작업과정을의미한다.


**2. ArgoCD**


  는오픈소스CD툴로Kubernetes에서많이사용되는툴중하나임
ArgoCD


  특정Git Repo에서관리되는Kubernetes로배포가능한선언적프로그래밍코드를


배포하고Sync(동기화)를하여상태값을유지하면서관리할수있도록제공하는툴


12


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-593-full.png)
###### **4.8 애플리케이션을CI/CD Pipeline으로빌드/배포하기**


    예제코드중특정부분의코드를추가/수정/삭제이후Commit/Push를수행


    Branch는main으로진행


    Code가Push됨과동시에CI 빌드가수행


##### **01 .**

**Kubernetes**
**활용**
**미니프로젝트**
**소개**




CI 빌드수행부분은Jenkins 메인화면에서" " 탭을클릭하면전체
mini-project


Pipeline 현황을확인할수있다.


CI/CD Pipeline 수행결과, 서비스의컨테이너이미지Tag가업데이트되고빌드된


컨테이너를AWS ECR에Push해서저장함


CI/CD Pipeline 수행때마다AWS ECR에버전업된컨테이너이미지저장


13


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-594-full.png)
###### **4.9 AWS ECR 활용및컨테이너Push**

**1. AWS ECR**


     컨테이너이미지를관리를하기위해제공하는AWS 서비스로AWS ECR에


##### **01 .**

**Kubernetes**
**활용**
**미니프로젝트**
**소개**



Repository를생성하면, 해당Repository의URL를포함하는Tag를가져야Push가


가능함(다른이름의Tag로는AWS ECR로의Push가불가)


  AWS ECR은AWS CLI를통해Registry 로그인이가능함


  생성된AWS ECR Registry에접근이가능한AWS IAM 사용자계정의Access


Key와Secret Key가미리aws configure를통해Local-PC에등록되어있어야함


**2. 컨테이너Push**


  AWS ECR URL을포함한변경된Tag명을가진컨테이너이미지를


Push(내보내기)를수행하고, AWS ECR Management Console에서해당이미지가


정상적으로Push 되었는지확인가능


14


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-595-full.png)

**5.1 AWS 인프라구성내역소개#1**


**(1) 네트워크**


**- VPC : AWS**
**네트워크** **구성**


**Available Zone**

**- Public Subnet : 2개**


**인터넷** **연결용(User 접속, Dockerhub 연결)**

**- Internet Gateway :**


**- Route Table : 2개Subnet 라우팅용**


15


##### **01 .**

**Kubernetes**
**활용**
**미니프로젝트**
**소개**


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-596-full.png)

**5.2 AWS 인프라구성내역소개#2**


**(2) 스토리지**


##### **01 .**

**Kubernetes**
**활용**
**미니프로젝트**
**소개**




**- Elastic Container Registry(ECR) : 컨테이너** **이미지Push/Pull, 저장용**


**Persistent Volume**
**제공용**

**- Elastic Block Storage(EBS) :**


**- S3 Bucket : Terraform**
**State 파일저장**


**Lock 저장/관리**

**- DynamoDB : Terraform**


16


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-597-full.png)

**5.3 Kubernetes(EKS) 플랫폼구성내역소개**


**(1) EKS Cluster**


**- EKS Cluster : 컨테이너** **플랫폼용**


**Node 관리용**

**- EKS NodeGroup : EKS Worker**


**(2) EKS 관리용추가플러그인**


##### **01 .**

**Kubernetes**
**활용**
**미니프로젝트**
**소개**




**- AWS Load Balancer Controller :**
**Ingress 생성시자동ALB 생성및연동용**


**- AWS CSI Driver :**
**StorageClass 적용및Persistent Volume 생성용**


17


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-598-full.png)

**5.4 Kubernetes(EKS) 플랫폼구성내역소개**


**(1) EKS Cluster**


**- EKS Cluster : 컨테이너** **플랫폼용**


**Node 관리용**

**- EKS NodeGroup : EKS Worker**


**(2) EKS 관리용추가플러그인**


##### **01 .**

**Kubernetes**
**활용**
**미니프로젝트**
**소개**




**- AWS Load Balancer Controller :**
**Ingress 생성시자동ALB 생성및연동용**


**- AWS CSI Driver :**
**StorageClass 적용및Persistent Volume 생성용**


18


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-599-full.png)
###### **6. 리소스생성순서**

1.
AWS Configure 설정: Terraform 실행할환경에AWS의API Key 설정


->
2. Terraform Backend 생성: S3 Bucket
DynamoDB


##### **01 .**

**Kubernetes**
**활용**
**미니프로젝트**
**소개**



3. VPC -> Subnet -> -> Route Table ->
네트워크:
Internet Gateway Security Group


->
4. IAM : AWS EKS Cluster Role AWS EKS Node Group Role


5. EKS : AWS EKS Cluster -> AWS EKS Node Group


19


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-600-full.png)
###### **6.1 Terraform 사전준비– AWS Configure 설정확인**


##### **01 .**

**Kubernetes**
**활용**
**미니프로젝트**
**소개**




Local-PC에미리설치한AWS CLI에AWS 계정의Access Key와Secret Key가


설정되어있는지를확인한다.


설정된계정이Admin 권한이있는지를IAM에서확인한다.

![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-600-0.png)


20


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-601-full.png)
###### **6.2 Terraform Backend 프로비저닝수행#1 – 코드경로**


     **Terraform Backend 경로**


Part4_Kubernetes/Chapter11/terraform/terraform-backend


     **코드변경파일**


terraform-backend.tf
파일명:


변경내역#1 : S3 bucket명및tags.name을할당받은이름으로변경


예) mini-project-s3-tf-state


변경내역#2 : DynamoDB name 및tags.name을할당받은이름으로변경


예) mini-project-ddb-lock-table


21


##### **01 .**

**Kubernetes**
**활용**
**미니프로젝트**
**소개**


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-602-full.png)
###### **6.3 Terraform Backend 프로비저닝수행#3 - 명령어**

1. Terraform 초기화(Init)


$ terraform init


2. Terraform 프로비저닝코드검증(Dry Run)


$ terraform plan


3. Terraform 프로비저닝수행(Run)


$ terraform apply


22


##### **01 .**

**Kubernetes**
**활용**
**미니프로젝트**
**소개**


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-603-full.png)
###### **6.4 Terraform Codes 프로비저닝수행#1 – 코드경로**


     **Terraform Codes 경로**


Part4_Kubernetes/Chapter11/terraform/terraform-codes


     **코드변경파일**


파일명:
providers.tf


변경내역#1 : S3 bucket명을할당받은이름으로변경


예) mini-project-s3-tf-state


변경내역#2 : DynamoDB name을할당받은이름으로변경


예) mini-project-ddb-lock-table


23


##### **01 .**

**Kubernetes**
**활용**
**미니프로젝트**
**소개**


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-604-full.png)
###### **7.1 AWS Management Console에서리소스확인#1 – Backend**


    S3 Bucket


    
![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-604-0.png)
DynamoDB Table

![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-604-1.png)


24


##### **01 .**

**Kubernetes**
**활용**
**미니프로젝트**
**소개**


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-605-full.png)
###### **7.2 AWS Management Console에서리소스확인#2 - 네트워크**


    VPC

![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-605-0.png)


25


##### **01 .**

**Kubernetes**
**활용**
**미니프로젝트**
**소개**


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-606-full.png)
###### **7.3 AWS Management Console에서리소스확인#2 - 네트워크**


    Subnet

![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-606-0.png)


26


##### **01 .**

**Kubernetes**
**활용**
**미니프로젝트**
**소개**


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-607-full.png)
###### **7.4 AWS Management Console에서리소스확인#2 - 네트워크**


    Internet Gateway

![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-607-0.png)


27


##### **01 .**

**Kubernetes**
**활용**
**미니프로젝트**
**소개**


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-608-full.png)
###### **7.5 AWS Management Console에서리소스확인#2 - 네트워크**


    Route Table

![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-608-0.png)


28


##### **01 .**

**Kubernetes**
**활용**
**미니프로젝트**
**소개**


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-609-full.png)
###### **7.6 AWS Management Console에서리소스확인#2 - 네트워크**


    Security Group

![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-609-0.png)


29


##### **01 .**

**Kubernetes**
**활용**
**미니프로젝트**
**소개**


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-610-full.png)
###### **7.7 AWS Management Console에서리소스확인#3 – IAM Role**

**1. IAM Role 생성명**


     test-iam-role-eks-cluster


**2. Role내적용할Policy 목록**


     AmazonEKSVPCResourceController

     AmazonEKSClusterPolicy

![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-610-0.png)


30


##### **01 .**

**Kubernetes**
**활용**
**미니프로젝트**
**소개**


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-611-full.png)
###### **7.8 AWS Management Console에서리소스확인#4 – IAM Role**

**1. IAM Role 생성명**


     test-iam-role-eks-nodegroup
**2. Role내적용할Policy 목록**


     AmazonEC2ContainerRegistryReadOnly

     AmazonEKSWorkerNodePolicy

     AmazonEKS_CNI_Policy

![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-611-0.png)


31


##### **01 .**

**Kubernetes**
**활용**
**미니프로젝트**
**소개**


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-612-full.png)
###### **7.9 AWS Management Console에서리소스확인#5 – EKS**


    AWS EKS Cluster

![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-612-0.png)


32


##### **01 .**

**Kubernetes**
**활용**
**미니프로젝트**
**소개**


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-613-full.png)
###### **7.10 AWS Management Console에서리소스확인#5 – EKS**


    AWS EKS Node Group

![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-613-0.png)


33


##### **01 .**

**Kubernetes**
**활용**
**미니프로젝트**
**소개**


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-614-full.png)
###### **7.11 AWS Management Console에서리소스확인#5 – EKS**


    AWS EC2 VM Instance

![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-614-0.png)


34


##### **01 .**

**Kubernetes**
**활용**
**미니프로젝트**
**소개**


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-615-full.png)
###### **8. Kubernetes(EKS) 제어를위한설정파일(kubeconfig) 생성**


    **다음의문서를참고하여AWS EKS용kubeconfig 생성**


https://docs.aws.amazon.com/ko_kr/eks/latest/userguide/create-kubeconfig.html


     **명령어**


$ aws eks update-kubeconfig --region <Region명> --name <EKS명>

![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-615-0.png)


35


##### **01 .**

**Kubernetes**
**활용**
**미니프로젝트**
**소개**


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-616-full.png)

**9.1 AWS Load Balancer Controller**
**설치방법**


생성
(1) IAM Policy


      **경로**


**Part4_Kubernetes/Chapter11/aws/loadbalancer-controller**


      **명령어**
$
aws iam create-policy \


           --policy name AWSLoadBalancerControllerIAMPolicy \
--policy-document file://iam_policy.json


36


##### **01 .**

**Kubernetes**
**활용**
**미니프로젝트**
**소개**


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-617-full.png)

**9.2 AWS Load Balancer Controller**
**설치방법**


및 EKS내서비스어카운트생성
(2) IAM Role


$ eksctl create iamserviceaccount \

--cluster= <EKS Cluster \
명>
--namespace=kube-system \
--name=aws-load-balancer-controller \

--role-name "AmazonEKSLoadBalancerControllerRole" \
--attach-policy-arn=arn:aws:iam::<AWS
ID>:policy/AWSLoadBalancerControllerIAMPolicy \

--override-existing-serviceaccounts \

--approve


37


##### **01 .**

**Kubernetes**
**활용**
**미니프로젝트**
**소개**


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-618-full.png)

**9.3 AWS Load Balancer Controller**
**설치방법**


등록및정보업데이트
(3) Helm Repository


$ helm repo add eks https://aws.github.io/eks-charts
$ helm repo update
$ helm repo list


38


##### **01 .**

**Kubernetes**
**활용**
**미니프로젝트**
**소개**


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-619-full.png)

**9.4 AWS Load Balancer Controller**
**설치방법**


배포
(4) Helm Release


##### **01 .**

**Kubernetes**
**활용**
**미니프로젝트**
**소개**



$ helm install aws-load-balancer-controller eks/aws-load-balancer-controller \

-n kube-system \
--set clusterName=test-eks-cluster \

--set serviceAccount.create=false \

--set serviceAccount.name=aws-load-balancer-controller


39


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-620-full.png)

**9.5 AWS Load Balancer Controller**
**설치방법**


K8s
배포확인및 리소스생성확인
(5) Helm Release


$ helm list
$ kubectl get deployment -n kube-system aws-load-balancer-controller


40


##### **01 .**

**Kubernetes**
**활용**
**미니프로젝트**
**소개**


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-621-full.png)

**10.1 AWS EBS CSI Driver**
**설치방법**


및 EKS내서비스어카운트생성
(1) IAM Role


     **경로: Part4_Kubernetes/Chapter11/aws/ebs-csi-driver**


명령어
(2)


$ eksctl create iamserviceaccount \

--name ebs-csi-controller-sa \
--namespace kube-system \
--cluster <EKS Cluster
명> \


-attach-policy-arn arn:aws:iam::aws:policy/servicerole/AmazonEBSCSIDriverPolicy \

--approve \
--role-only \
--role-name AmazonEKS_EBS_CSI_DriverRole


41


##### **01 .**

**Kubernetes**
**활용**
**미니프로젝트**
**소개**


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-622-full.png)

**10.2 AWS EBS CSI Driver**
**설치방법**


애드온을통한설치
(2) eksctl


-$ eksctl create addon name aws-ebs-csi-driver \


-cluster <EKS
클러스터명> \

-service-account-role-arn arn:aws:iam::<AWS
계정
ID>:role/AmazonEKS_EBS_CSI_DriverRole \


-force


42


##### **01 .**

**Kubernetes**
**활용**
**미니프로젝트**
**소개**


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-623-full.png)

**10.3 AWS EBS CSI Driver**
**설치방법**


애드온을통한설치상태확인
(3) eksctl


##### **01 .**

**Kubernetes**
**활용**
**미니프로젝트**
**소개**



$ eksctl get addon --name aws-ebs-csi-driver --cluster <EKS 클러스터명>


43


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-624-full.png)

**10.4 AWS EBS CSI Driver**
**설치방법**


설치확인
(4) AWS EBS CSI Driver


$ kubectl get pods -n kube-system | grep ebs-csi-controller


44


##### **01 .**

**Kubernetes**
**활용**
**미니프로젝트**
**소개**


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-625-full.png)
### **11. Kubernetes 활용미니프로젝트수행하기**

**02**
**CI 환경설정및빌드준비하기**


1


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-626-full.png)
###### **CI 환경설정및빌드준비하기**

**(1) Jenkins 설치**


**(2) Jenkins 플러그인설치**


**(3) Jenkins 인증설정**


**(4) Jenkins에서Github Repo를SSH URL로연결시문제해결방법**


2


##### **02 .**

**CI 환경설정및**
**빌드준비하기**


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-627-full.png)

**1.1 Jenkins 설치- Jenkins용Service Account 적용**


**(1) Jenkins Namespace 생성**


**$ kubectl create namespace jenkins**


**(2) Jenkins용Service Account 적용**


##### **02 .**

**CI 환경설정및**
**빌드준비하기**




**- Manifest 경로:**
**Part4_Kubernetes/Chapter11/mini-project/management/ci/jenkins/settings**


**$ kubectl apply -f sa.yaml -n jenkins**



![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-627-0.png)
![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-628-full.png)

**1.2 Jenkins 설치- Jenkins용Persistent Volume적용**


**(3) Jenkins용Persistent Volume적용**


**- Manifest 경로: (2)번과동일**


**$ kubectl apply -f pvc.yaml -n jenkins**

![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-628-0.png)


4


##### **02 .**

**CI 환경설정및**
**빌드준비하기**


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-629-full.png)

**1.3 Jenkins 설치- Jenkins Helm Chart 설정및배포#1**


**(4) Jenkins Helm Repo 등록**


**$ helm repo add jenkinsci https://charts.jenkins.io**

![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-629-0.png)


**(5) Helm Repo내에서Jenkins Helm Chart 검색(존재확인)**


**$ helm search repo jenkinsci**

![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-629-1.png)


5


##### **02 .**

**CI 환경설정및**
**빌드준비하기**


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-630-full.png)

**1.4 Jenkins 설치- Jenkins Helm Chart 설정및배포#2**


**(6) Jenkins Helm Chart 설정**


##### **02 .**

**CI 환경설정및**
**빌드준비하기**




**- 설정파일경로:**
**Part4_Kubernetes/Chapter11/mini-project/management/ci/jenkins/helm-charts**


**$ vi values.yaml**


**- 설정항목:**
**ingress, persistence, serviceAccount**


**(7) Jenkins Helm Chart 배포**


**$ helm install jenkins -n jenkins -f values.yaml jenkinsci/jenkins**

![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-630-0.png)


6


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-631-full.png)

**1.5 Jenkins 설치- Jenkins Helm Chart 설정및배포#3**


**(8) Jenkins Ingress 정보확인**


**$ kubectl get ingress -n jenkins**

![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-631-0.png)


**(9) Jenkins admin 계정로그인용암호확인**


**$ kubectl exec --namespace jenkins -it svc/jenkins -c jenkins -- /bin/cat**


**/run/secrets/additional/chart-admin-password && echo**

![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-631-1.png)


7


##### **02 .**

**CI 환경설정및**
**빌드준비하기**


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-632-full.png)

**2. Jenkins 플러그인설치**


**(1) Jenkins 플러그인설치경로**


**-**
**메인화면> Jenkins 관리> 플러그인관리> 설치가능**


**(2) Jenkins 플러그인설치대상**


    **pipeline**


    - **aws**


    **github**


    **ssh**


    **docker**


    **kubernetes**

![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-632-0.png)


8


##### **02 .**

**CI 환경설정및**
**빌드준비하기**


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-633-full.png)

**3. Jenkins 인증설정**


**인증설정순서**


   SSH Key 생성(로컬)


   Github 인증설정(github-key)


   AWS 인증설정(aws-key)


##### **02 .**

**CI 환경설정및**
**빌드준비하기**



9


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-634-full.png)

**3.1 Jenkins 인증설정- 로컬에서Git Repo 연동을위한SSH Key 생성#1**


    로컬에서pem 키전용디렉토리생성및이동


$ mkdir -p ~/pems/jenkins


$ cd ~/pems/jenkins


##### **02 .**

**CI 환경설정및**
**빌드준비하기**




pems 디렉토리에서Git Repository 연동을위한SSH Key 생성명령어


ed25519 -a 100 -f
$ ssh-keygen -t <SSH Key명>


 - 생성될때까지Enter를눌러기본값설정


 - 2개의Key파일생성확인: <SSH Key명>, <SSH Key명>.pub


10


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-635-full.png)

**3.2 Jenkins 인증설정- 로컬에서Git Repo 연동을위한SSH Key 생성#2**


    **Git Repository 연동을위한SSH Key 생성결과**

![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-635-0.png)


11


##### **02 .**

**CI 환경설정및**
**빌드준비하기**


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-636-full.png)
###### **3.3 Jenkins 인증설정- Github Repository 연동#1**


  Github Repository(예제실습코드저장용)에Deploy Key를설정


(1) 본인의예제실습코드가저장된 에접속
Github Repository


(2) 상단Tab중" "클릭
Settings


##### **02 .**

**CI 환경설정및**
**빌드준비하기**


12



![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-636-0.png)
![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-637-full.png)
###### **3.4 Jenkins 인증설정- Github내Repository 연동#2**

(3) 좌측메뉴중Security > Deploy Keys 클릭


(4) 우측중간에있는" " 클릭
Add deploy key


##### **02 .**

**CI 환경설정및**
**빌드준비하기**


13



![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-637-0.png)
![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-638-full.png)
###### **3.5 Jenkins 인증설정- Github내Repository 연동#3**

(5) 다음의정보를입력후"Add key" 버튼클릭


    Title
(제목) 입력(ssh-key)


    Key(Public SSH Key인 ssh-key.pub 내용복사) 붙여넣기


    Allow write access
체크선택

![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-638-0.png)


14


##### **02 .**

**CI 환경설정및**
**빌드준비하기**



![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-638-1.png)
![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-639-full.png)
###### **3.6 Jenkins 인증설정- Github내Repository 연동#4**

(6) Github Repository(예제실습코드저장용)에Deploy Key가다음과


같이등록됨을확인


##### **02 .**

**CI 환경설정및**
**빌드준비하기**



![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-639-0.png)
![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-640-full.png)

**3.7 Jenkins 인증설정-** **Github 및AWS Credential 설정**


**(7) AWS Credential 설정경로(Jenkins)**


##### **02 .**

**CI 환경설정및**
**빌드준비하기**



**-**
**Amazon Credentials**
**Jenkins 관리> System Configuration > AWS > Region 선택>**


**우측Add 클릭> Jenkins 클릭후다음의항목을입력후Add 버튼클릭**


**Domain : Global credentials**


**Kind : AWS Credentials**


**Scope : Global**


**구분하기좋은임의의내용을입력**
**ID, Description :**


**(AWS 계정)**
**Access Key ID : AWS Access Key**


**(AWS 계정)**
**Secret Access Key : AWS Secret Key**


**-**

![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-640-0.png)
**IAM instance ~ 대신새로추가된** **정보를선택하고Save 버튼을눌러적용**
**Access Key ID**


16


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-641-full.png)

**4.1 Jenkins에서Github Repo를SSH URL로연결시문제해결방법#1**


(1) 개요


  Latest Jenkins
최근에 버전으로배포되는 컨테이너이미지기반으로


##### **02 .**

**CI 환경설정및**
**빌드준비하기**



Jenkins를실행한뒤, 를 SSH URL로연결시다음과같은
Github Repository


문제가발생함.

![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-641-0.png)


17


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-642-full.png)

**4.2 Jenkins에서Github Repo를SSH URL로연결시문제해결방법#2**


(2) Git Host Key Verification 설정해제


##### **02 .**

**CI 환경설정및**
**빌드준비하기**




최근에 Jenkins에서 를 SSH URL로연결시발생하는
Github Repository


문제는 문제이므로, 다음과같이해결한다.
Git Host Key Verification


Jenkins Jenkins
메인> 관리> 클릭
Security > Configure Global Security



![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-642-0.png)
![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-643-full.png)

**4.3 Jenkins에서Github Repo를SSH URL로연결시문제해결방법#3**


설정변경
(3) Git Host Key Verification Configuration


1.
페이지의맨아래끝까지스크롤을해서"
Git Host Key Verification


" 부분을확인한다.
Configuration


2. Known hosts file"로
기본값으로"


3.
설정되어있는것을확인한다.


4. "No verification
"으로값을변경한다.


5. "Save
" 버튼을클릭하여적용한다.


19


##### **02 .**

**CI 환경설정및**
**빌드준비하기**



![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-643-0.png)
![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-644-full.png)

**4.4 Jenkins에서Github Repo를SSH URL로연결시문제해결방법#4**


(4) Jenkins에서Github Repository를SSH URL로연결확인


##### **02 .**

**CI 환경설정및**
**빌드준비하기**




아래캡쳐와같이에러표시가나오지않는다면, 정상적으로연결되었음을확인



![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-644-0.png)
![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-645-full.png)
#### 11. Kubernetes 활용미니프로젝트수행하기

03 CD 환경설정및배포준비하기


1


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-646-full.png)

1.1 설치
ArgoCD


(1) ArgoCD Namespace 생성


$ kubectl
create namespace argocd

![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-646-0.png)


(2) ArgoCD 설치


   경로: Part4_Kubernetes/Chapter11/mini-project/


management/cd/argo-cd


$ kubectl apply -f install.yaml -n argocd


(3) ArgoCD 설치후생성된리소스확인


$ kubectl get all -n argocd


2


##### 03 .

CD 환경설정및
배포준비하기



![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-646-1.png)
![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-647-full.png)

1.2
Argo Rollout 설치


(1) Argo Rollout Namespace 생성


$ kubectl
create namespace argo-rollouts


(2) Argo Rollout 설치


##### 03 .

CD 환경설정및
배포준비하기



경로: Part4_Kubernetes/Chapter11/mini-project/management/cd/argo-rollout


$ kubectl apply -f install.yaml -n argo-rollouts


3


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-648-full.png)

1.3 Canary 배포적용을위한CLI 준비(MacOS)


(1) Canary 배포적용을위한CLI 준비


    MAC OS에서의Argo Rollout 플러그인설치


$ brew install argoproj/tap/kubectl-argo-rollouts


4


##### 03 .

CD 환경설정및
배포준비하기


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-649-full.png)

1.4 Canary 배포적용을위한CLI 준비(Linux)


##### 03 .

CD 환경설정및
배포준비하기




Canary 배포적용을위한CLI 준비(Linux에서의Argo Rollout 플러그인설치)


$ curl -LO https://github.com/argoproj/argo

rollouts/releases/latest/download/kubectl-argo-rollouts-linux-amd64


$ chmod +x ./kubectl-argo-rollouts-linux-amd64


$ sudo mv ./kubectl-argo-rollouts-linux-amd64 /usr/local/bin/kubectl-argo-rollouts


Argo Rollout 버전확인


$ kubectl argo rollouts version


5


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-650-full.png)

1.5 Service Repo내Canary 변경배포확인(예)


    Argo Rollout CLI를통한Canary 배포확인


##### 03 .

CD 환경설정및
배포준비하기



$ kubectl <Rollout 오브젝트명> -n <네임스페이스명>
argo rollouts get rollout

![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-650-0.png)


6


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-651-full.png)

1.6
Canary 배포적용을위한Dashboard 준비


     Argo Rollout Dashboard 백그라운드기동


$ nohup kubectl argo rollouts dashboard &


7


##### 03 .

CD 환경설정및
배포준비하기


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-652-full.png)

1.7
Argo Rollout Dashboard 접속


    Argo Rollout Dashboard URL


     http://localhost:3100


    접속후배포된rollout Object 확인방법


"

     우측상단에있는"NS: 부분에명시된드롭다운리스트클릭


     드롭다운리스트중 rollout object가배포된 NS(Namespace) 선택


8


##### 03 .

CD 환경설정및
배포준비하기


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-653-full.png)

1.8
Argo Rollout Dashboard 접속


##### 03 .

CD 환경설정및
배포준비하기



9



![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-653-0.png)

![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-653-1.png)
![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-654-full.png)

CLI 설치및비밀번호변경, 접속및로그인
2.1 ArgoCD


(1) ArgoCD CLI 설치


    MacOS


$ brew install argocd

![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-654-0.png)


10


##### 03 .

CD 환경설정및
배포준비하기


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-655-full.png)

CLI 설치및비밀번호변경, 접속및로그인
2.2 ArgoCD


    Linux


$ curl -sSL -o argocd-linux-amd64 https://github.com/argoproj/argo

cd/releases/latest/download/argocd-linux-amd64


$ sudo install -m 555 argocd-linux-amd64 /usr/local/bin/argocd


$ rm argocd-linux-amd64


11


##### 03 .

CD 환경설정및
배포준비하기


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-656-full.png)

CLI 설치및비밀번호변경, 접속및로그인
2.3 ArgoCD


    Windows (PowerShell)


##### 03 .

CD 환경설정및
배포준비하기



$ version = (Invoke-RestMethod https://api.github.com/repos/argoproj/argo

cd/releases/latest).tag_name


$ url = "https://github.com/argoproj/argo-cd/releases/download/" + $ version +


"/argocd-windows-amd64.exe"


$
output = "argocd.exe"


Invoke-WebRequest -Uri $ url -OutFile $ output


12


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-657-full.png)

CLI 설치및비밀번호변경, 접속및로그인
2.4 ArgoCD


(2) ArgoCD CLI로로그인수행


    ArgoCD 배포후최초admin 계정 비밀번호 확인


$ kubectl -n argocd get secret argocd-initial-admin-secret -o


jsonpath="{.data.password}" | base64 -d; echo

![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-657-0.png)


(3) ArgoCD 접속을위한External-IP 확인


argocd-server의External-IP를확인


$ kubectl get svc -n argocd


##### 03 .

CD 환경설정및
배포준비하기



![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-657-1.png)
![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-658-full.png)

CLI 설치및비밀번호변경, 접속및로그인
2.5 ArgoCD


    웹브라우저에서 http://<External-IP>:80으로접속(admin 계정)

![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-658-0.png)


14


##### 03 .

CD 환경설정및
배포준비하기


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-659-full.png)

CLI 설치및비밀번호변경, 접속및로그인
2.6 ArgoCD


     로그인및로그인후메인페이지(웹브라우저)


##### 03 .

CD 환경설정및
배포준비하기



![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-659-0.png)
![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-660-full.png)

3.1
ArgoCD내미니프로젝트용Repository 연동#1


(1) 배포Repository 등록을위한SSH Key 생성


$ ssh-keygen -t ed25519 -a 100 -f ./argocd-key


(생성되면디렉토리에, 2개의파일이생성됨)
argocd-key argocd-key.pub


##### 03 .

CD 환경설정및
배포준비하기



![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-660-0.png)
![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-661-full.png)

3.2
ArgoCD내미니프로젝트용Repository 연동


##### 03 .

CD 환경설정및
배포준비하기



![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-661-0.png)


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-662-full.png)

3.3
ArgoCD내미니프로젝트용Repository 연동


(3) Title(제목) 입력, Key(Public SSH Key인argocd-key.pub 내용복사) 붙여넣기,

![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-662-0.png)


18


##### 03 .

CD 환경설정및
배포준비하기


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-663-full.png)

3.4
ArgoCD내미니프로젝트용Repository 연동

![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-663-0.png)


19


##### 03 .

CD 환경설정및
배포준비하기


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-664-full.png)

3.5
ArgoCD내미니프로젝트용Repository 연동


(5) ArgoCD에서배포Repository 등록경로


##### 03 .

CD 환경설정및
배포준비하기




- 메인화면> 좌측메뉴중"Settings" > "Repositories" 클릭> 좌측상단의“CONNECT REPO” 클릭

![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-664-0.png)


20


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-665-full.png)

3.6.
ArgoCD내미니프로젝트용Repository 연동


(6) 등록정보


  Name : github-repo


  Project : default


##### 03 .

CD 환경설정및
배포준비하기




Repository URL : git@github.com:<본인의예제코드가있는Git Repository의SSH URL>.git


SSH private key data : 앞에서생성한argocd-key (Private Key)의값을복사, 붙여넣기


"

Connect" 버튼을눌러등록


21


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-666-full.png)

3.7
ArgoCD내미니프로젝트용Repository 연동


   등록정보입력예시

![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-666-0.png)


22


##### 03 .

CD 환경설정및
배포준비하기


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-667-full.png)

3.8
ArgoCD내미니프로젝트용Repository 연동


(7) 등록된배포용Repository 현황

![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-667-0.png)


23


##### 03 .

CD 환경설정및
배포준비하기


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-668-full.png)
###### 4.1예제구성을위한ArgoCD배포‒values.yaml세팅

(1) Helm 예제코드values.yaml 세팅


Part4_Kubernetes/Chapter11/mini-project/service/helm-charts


(2) 세팅부분(이미지, Subnet ID)


##### 03 .

CD 환경설정및
배포준비하기



![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-668-0.png)

![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-668-1.png)
![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-669-full.png)
###### 4.2 예제구성을위한ArgoCD배포‒Subnet 확인

(3) Subnet 확인방법
Ingress Annotation


##### 03 .

CD 환경설정및
배포준비하기




- AWS Management Console > VPC > 서브넷에서생성된2개의Subnet 목록모두체크를


클릭하여출력되는문자열을복사, 붙여넣기한다.

![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-669-0.png)


25


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-670-full.png)
###### 4.3예제구성을위한ArgoCD배포 ‒values.yaml 세팅값반영을위한Commit/Push

(4) 본인이사용중인IDE에서Commit/Push를진행


##### 03 .

CD 환경설정및
배포준비하기



![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-670-0.png)
![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-671-full.png)
###### 4.4예제구성을위한ArgoCD배포 ‒values.yaml 세팅값반영을위한Commit/Push

(5) 본인의Repository에서Push된Revision 확인


##### 03 .

CD 환경설정및
배포준비하기



![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-671-0.png)
![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-672-full.png)
###### 5.1예제구성을위한ArgoCD배포

(1) 예제구성을위한ArgoCD Application 추가#1


   - GENERAL


    - Application Name : mini-project


    - Project : default


    - SYNC POLICY : Automatic 및SELF HEAL 설정


   - SYNC OPTIONS : AUTO-CREATE NAMESPACE


    - PRUNE PROPAGATION POLICY : foreground


28


##### 03 .

CD 환경설정및
배포준비하기


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-673-full.png)
###### 5.2예제구성을위한ArgoCD배포

(2) GENERAL 설정예시


##### 03 .

CD 환경설정및
배포준비하기



![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-673-0.png)

29


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-674-full.png)
###### 5.3예제구성을위한ArgoCD배포

(3) Source 및Destination 설정예시


##### 03 .

CD 환경설정및
배포준비하기



![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-674-0.png)

30


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-675-full.png)
###### 5.4예제구성을위한ArgoCD배포

(4) Helm


    - Values Files : values.yaml


    - container.port : 8080


    - image.repository : <AWS ECR URL>/mini-project


    - image.tag : latest


    - ingress.annotations.alb.ingress.kubernetes.io : <AWS Subnet IDs>


    - replicaCount : 2


    - service.type : ClusterIP


   - 상단에있는"Create" 버튼을눌러서Application 생성


31


##### 03 .

CD 환경설정및
배포준비하기


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-676-full.png)
###### 5.5예제구성을위한ArgoCD배포

(5) 배포후POD 기동확인


$ kubectl get po -n mini-project


(6) Service 확인


$ kubectl get svc -n mini-project


(7) POD Log 확인방법


$ kubectl logs -f <POD명> -n mini-project


(8) Ingress 확인


$ kubectl get ing -n mini-project


32


##### 03 .

CD 환경설정및
배포준비하기


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-677-full.png)
###### 5.6 예제구성을위한ArgoCD배포

(9) 배포후POD 기동, Service, Ingress 확인예시

![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-677-0.png)


(10) ImagePullBackOff가발생한경우, 마이크로서비스의컨테이너이미지를Backend


이미지Pull을할수있는AWS ECR Repository에Push를해야함.


##### 03 .

CD 환경설정및
배포준비하기



(11) 이부분에대해서는CI Tool인Jenkins을통해마이크로서비스빌드및컨테이너이미지


빌드후, AWS ECR에Push할예정


33


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-678-full.png)
###### 5.7 예제구성을위한ArgoCD배포

(12) 구성된Ingress는AWS Management Console에서상세정보및Address 조회가능

![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-678-0.png)


34


##### 03 .

CD 환경설정및
배포준비하기


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-679-full.png)
###### 5.8 예제구성을위한ArgoCD배포

(13) 에러발생예시
ArgoCD Application 상세확인결과ImagePullBackOff


->
실제배포할컨테이너이미지를pull 하지못해서발생하는에러


##### 03 .

CD 환경설정및
배포준비하기



![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-679-0.png)
![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-680-full.png)
## 11. Kubernetes 활용미니프로젝트수행하기

04 CI 빌드수행및컨테이너Push, Helm Charts Push 하기


1


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-681-full.png)

1.1 컨테이너빌드를위한소스코드준비


(1) 컨테이너빌드를위한소스코드확인경로


    경로: Part4_Kubernetes/Chapter11/mini-project/service/container


     Source Code의경우, Go 언어로작성


     웹페이지에 Color Bubble의Pool을출력하는웹애플리케이션


##### 04 .

CI 빌드수행및
컨테이너Push,
Helm Charts
Push 하기




Service로바인딩된POD내랜덤하게Bubble Request를해서 Return하는Color 출력


Bubble Request 요청되는횟수(트래픽량)에따라Return하는 Color 빈도수증가


2


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-682-full.png)

1.2 CD 배포를위한Helm Charts 코드확인


(1) CD 배포를위한Helm Charts 코드확인


 경로: Part4_Kubernetes/Chapter11/mini

project/service/helm-charts


 template으로deployment 대신 rollout을사용


  Argo Rollouts를사용하기위해서는kind: Rollout인


rollout Resource 필요


  rollout Resource의경우, Argo Rollouts를통한


Canary 배포구현가능


3


##### 04 .

CI 빌드수행및
컨테이너Push,
Helm Charts
Push 하기



![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-682-0.png)
![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-683-full.png)

2.1 Jenkinsfile 작성


(1) Jenkinsfile 작성경로


      경로: Part4_Kubernetes/Chapter11/mini-project/service


(2) def 변수값입력#1


"

       def awsECRURL="<AWS ECR URL>


"

       def awsKey="<Jenkins 내AWS Credential명>


"

       def awsRegion="<ECR 적용리전>


"

       def branch="<Github repository branch명>

![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-683-0.png)


4


##### 04 .

CI 빌드수행및
컨테이너Push,
Helm Charts
Push 하기


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-684-full.png)

2.2 Jenkinsfile 작성


(3) def 변수값입력#2


"

     def commitMsg="<배포용Helm Chart Commit 메시지>


"

     def directoryPath="<Jenkinsfile이있는Path>


"

     def githubEmail="<Github 계정이메일주소>


"

     def githubKey="<Jenkins 내설정된Github Credential명>


"

     def githubSSHURL="<Github Repository의SSH URL 주소>


"

     def imageTag="<Bubble App Color>

![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-684-0.png)


5


##### 04 .

CI 빌드수행및
컨테이너Push,
Helm Charts
Push 하기


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-685-full.png)
###### 2.3Jenkinsfile변경사항Commit/Push


     IDE에서Commit/Push를수행


##### 04 .

CI 빌드수행및
컨테이너Push,
Helm Charts
Push 하기



![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-685-0.png)

6


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-686-full.png)
###### 2.4 Jenkinsfile 변경사항Commit/Push


     Push되어업데이트면Revision 내역을Github Repository에서확인


##### 04 .

CI 빌드수행및
컨테이너Push,
Helm Charts
Push 하기



![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-686-0.png)
![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-687-full.png)

2.5 Jenkinsfile변경사항반영내역


     CI/CD Pipeline 수행가능한정보가반영된Jenkinsfile 내역


##### 04 .

CI 빌드수행및
컨테이너Push,
Helm Charts
Push 하기



![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-687-0.png)
![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-688-full.png)
###### 3.1 Jenkins로CI/CD Pipeline 수행


    예제코드중특정부분의코드를추가/수정/삭제이후Commit/Push를수행


    Branch는main으로진행


    Code가Push됨과동시에CI 빌드가수행


##### 04 .

CI 빌드수행및
컨테이너Push,
Helm Charts
Push 하기




CI 빌드수행부분은Jenkins 프로젝트를클릭하면전체Workflow 진행현황을확인가능


9


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-689-full.png)
###### 3.2Jenkins로그인및CI/CD Pipeline 실행준비


     CI/CD Pipeline의경우, 새로운Item에서Pipeline Type으로프로젝트를생성

![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-689-0.png)


10


##### 04 .

CI 빌드수행및
컨테이너Push,
Helm Charts
Push 하기


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-690-full.png)

3.3
Jenkins Pipeline 설정(Configuration)


:
Project url


<mini-project Github Repository HTTP URL>


Pipeline


  - Definition : Pipeline script from SCM


   - SCM : Git


   - Repositories


    - Repository URL :


<mini-project Github Repository SSH URL>


    - Credentials : <Github Credential Key>


(선택후Github 연결확인)


   - Branches to build


main

     - Branch Specifier (blank for 'any') :


##### 04 .

CI 빌드수행및
컨테이너Push,
Helm Charts
Push 하기




- Script Path : <Jenkinsfile이있는Path>



![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-690-0.png)

11


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-691-full.png)
###### 4.1 Jenkins 프로젝트생성현황


     Jenkins CI/CD Pipeline 실행시"지금빌드" 버튼클릭


##### 04 .

CI 빌드수행및
컨테이너Push,
Helm Charts
Push 하기



![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-691-0.png)
![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-692-full.png)
###### 4.2Jenkins Pipeline Job 실행확인


     CI/CD Pipeline 실행시Build Job 카운팅및Job 진행사항확인가능

![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-692-0.png)


13


##### 04 .

CI 빌드수행및
컨테이너Push,
Helm Charts
Push 하기


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-693-full.png)
###### 4.3Jenkins Pipeline Job 실행확인


     Console Output을통해CI/CD Pipeline이수행되는과정을확인가능


##### 04 .

CI 빌드수행및
컨테이너Push,
Helm Charts
Push 하기



![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-693-0.png)
![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-694-full.png)
###### 4.4Jenkins Pipeline Job 실행결과


     Console Output을통해CI/CD Pipeline이수행결과확인가능(성공/실패)


##### 04 .

CI 빌드수행및
컨테이너Push,
Helm Charts
Push 하기



![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-694-0.png)
![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-695-full.png)
###### 4.5Jenkins Pipeline Job 실행결과


    CI/CD Pipeline 수행결과, 마이크로서비스의컨테이너이미지Tag가업데이트됨


##### 04 .

CI 빌드수행및
컨테이너Push,
Helm Charts
Push 하기



![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-695-0.png)
![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-696-full.png)
###### 4.6Jenkins Pipeline Job 실행결과


   CI/CD Pipeline 수행결과, 빌드된컨테이너를AWS ECR에Push해서저장됨


   컨테이너이미지Tag의경우, 업데이트되는대로Helm Chart values.yaml >


image.tag 부분도업데이트됨


##### 04 .

CI 빌드수행및
컨테이너Push,
Helm Charts
Push 하기



![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-696-0.png)
![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-697-full.png)
###### 5.1ArgoCDSync 현황


    Jenkins CI/CD Pipeline 이후변경된Github Repository의정보를Sync한


ArgoCD가EKS(Kubernetes)의변경된컨테이너POD의Image 정보를Update함


##### 04 .

CI 빌드수행및
컨테이너Push,
Helm Charts
Push 하기



![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-697-0.png)
![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-698-full.png)
###### 5.2ArgoRollouts Sync 현황


     ArgoCD가Sync가되면EKS(Kubernetes) 배포정보가자동적으로Argo


Rollouts에도Sync가되어새로운Revision으로Update된다.


##### 04 .

CI 빌드수행및
컨테이너Push,
Helm Charts
Push 하기



![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-698-0.png)
![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-699-full.png)
###### 5.3ArgoRollouts Sync 현황


     Update되는Revision은설정된Rollout의배포전략처럼배포를수행


     여기예시에서는Canary Deploy를30초마다25%씩점진적전환을수행함


##### 04 .

CI 빌드수행및
컨테이너Push,
Helm Charts
Push 하기



![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-699-0.png)
![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-700-full.png)
##### 5.4ArgoRollouts Sync 현황 04 .

CI 빌드수행및
컨테이너Push,
Helm Charts
Push 하기


 Argo Rollout CLI를통해서도실시간으로Canary 배포가확인가능함


$ kubectl <Rollout 오브젝트명> -n <네임스페이스명> -w
argo rollouts get rollout

![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-700-0.png)


21


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-701-full.png)
###### 5.5ArgoRollouts Sync 현황


     Update가완료되면, 완전히새로운Revision으로버전이반영됨


     반영됨과동시에배포에따른더이상의변화가발생되지않음


##### 04 .

CI 빌드수행및
컨테이너Push,
Helm Charts
Push 하기



![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-701-0.png)
![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-702-full.png)
###### 5.6ArgoCD배포결과


     Update가완료되면, Git Revision이Current Sync와Last Sync가동일함


##### 04 .

CI 빌드수행및
컨테이너Push,
Helm Charts
Push 하기




상태가Synced 및Sync OK가되면정상적으로Sync가되어정상배포완료됨



![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-702-0.png)
![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-703-full.png)
###### 5.7 배포된마이크로서비스컨테이너POD 접속

(1) 배포후POD 기동, Service, Ingress 확인

![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-703-0.png)


(2) Ingress 확인


$ kubectl get ing -n mini-project


##### 04 .

CI 빌드수행및
컨테이너Push,
Helm Charts
Push 하기



(3) Ingress의ADDRESS를웹브라우저주소창에입력해배포된마이크로서비스컨테이너POD에접속


http:// <Ingress ADDRESS>:80


24


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-704-full.png)
###### 5.8배포된마이크로서비스컨테이너POD 접속결과


 배포된마이크로서비스컨테이너POD를Ingress의ADDRESS로웹브라우저에서


접속을하면, 아래와같은 Color Bubble의Pool이"blue"로출력됨을확인


##### 04 .

CI 빌드수행및
컨테이너Push,
Helm Charts
Push 하기



![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-704-0.png)
![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-705-full.png)
#### 11. Kubernetes 활용미니프로젝트수행하기

05
CD 자동Trigger 및배포/기동상태확인하기


1


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-706-full.png)

1.1 실습전사전수행사항


(1) Jenkinsfile 내imageTag 변경


   blue -> red


(2) Commit/Push 및Github Repository 적용확인


   Jenkinsfile 반영확인


(3) 적용후Jenkins Pipeline에서"지금빌드"를수행


   CI/CD Pipeline 수행


   red Tag의컨테이너이미지 빌드 및AWS ECR로의컨테이너이미지 Push


   GitOps Repository로의 Tag값변경Commit/Push (ArgoCD Trigger 유발)


2


##### 05 .

CD 자동Trigger
및배포/기동상태
확인하기


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-707-full.png)
##### 1.2 실습전사전수행사항 05 .

CD 자동Trigger
및배포/기동상태
확인하기
기존Jenkinsfile에설정되어있는Image Tag 정보변경: blue -> red

![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-707-0.png)


3


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-708-full.png)

1.3 실습전사전수행사항


Commit/Push후변경사항을Github Repository에반영

![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-708-0.png)


4


##### 05 .

CD 자동Trigger
및배포/기동상태
확인하기


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-709-full.png)

1.4 실습전사전수행사항


기존Jenkinsfile에설정되어있는Image Tag가Github Repo에도반영되어있는지를확인

![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-709-0.png)


5


##### 05 .

CD 자동Trigger
및배포/기동상태
확인하기


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-710-full.png)

1.5 실습전사전수행사항


aws-key 및github-key가Jenkins Credential로등록되었는지의여부를확인

![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-710-0.png)


6


##### 05 .

CD 자동Trigger
및배포/기동상태
확인하기


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-711-full.png)

1.6 실습전사전수행사항


Jenkins Pipeline에Repository URL 및Credential(github-key) 등록

![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-711-0.png)


7


##### 05 .

CD 자동Trigger
및배포/기동상태
확인하기


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-712-full.png)

1.7 실습전사전수행사항


Jenkins Pipeline 내Branch 및Jenkinsfile Path 설정

![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-712-0.png)


8


##### 05 .

CD 자동Trigger
및배포/기동상태
확인하기


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-713-full.png)

2.1 Jenkins에서CI/CD Pipeline Job 수행


                Jenkins 접속후> mini-project "지금빌드" 메뉴를통해Job 수행

![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-713-0.png)


9


##### 05 .

CD 자동Trigger
및배포/기동상태
확인하기


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-714-full.png)

2.2 Jenkins에서CI/CD Pipeline Job 수행


"지금빌드"를수행하면CI/CD Pipeline Job이Jenkinsfile에명시된대로진행

![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-714-0.png)


10


##### 05 .

CD 자동Trigger
및배포/기동상태
확인하기


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-715-full.png)

2.3 Jenkins에서CI/CD Pipeline Job 수행


Console Output에서진행중인CI/CD Pipeline Job에대한로그를실시간으로확인

![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-715-0.png)


11


##### 05 .

CD 자동Trigger
및배포/기동상태
확인하기


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-716-full.png)

2.4 Jenkins에서CI/CD Pipeline Job 수행


CI/CD Pipeline Job이Success가출력되면CI(마이크로서비스/컨테이너빌드및Push)완료

![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-716-0.png)


12


##### 05 .

CD 자동Trigger
및배포/기동상태
확인하기


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-717-full.png)

2.5 Jenkins에서CI/CD Pipeline Job 수행


red
AWS ECR 내에새로업데이트된Image Tag를가진컨테이너가Push됨(여기서는 )

![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-717-0.png)


13


##### 05 .

CD 자동Trigger
및배포/기동상태
확인하기


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-718-full.png)

3.1 CD Job 및Canary 배포수행


CD 수행시ArgoCD에서3분(180초) 이내로자동배포혹은업데이트진행하나, 자동으로되지


않는다면"Sync" 버튼> Synchronize 버튼을눌러수동동기화및배포를진행

![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-718-0.png)


14


##### 05 .

CD 자동Trigger
및배포/기동상태
확인하기


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-719-full.png)

3.2 CD Job 및Canary 배포수행


Canary 배포진행시기존Revision에서업데이트된버전의Revision으로POD가전환이됨

![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-719-0.png)


15


##### 05 .

CD 자동Trigger
및배포/기동상태
확인하기


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-720-full.png)

3.3 CD Job 및Canary 배포수행


Canary 배포진행시기존Revision에서업데이트된버전의Revision으로30초씩25%의


트래픽이POD가전환이됨

![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-720-0.png)


16


##### 05 .

CD 자동Trigger
및배포/기동상태
확인하기


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-721-full.png)

3.4 CD Job 및Canary 배포수행


Canary 배포진행시30초씩25%의트래픽이업데이트된Revision의POD로전환이됨

![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-721-0.png)


17


##### 05 .

CD 자동Trigger
및배포/기동상태
확인하기


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-722-full.png)

3.5 CD Job 및Canary 배포수행


Canary 배포진행시Bubble Tile이 Blue -> Red로점진적으로늘어나면서전환되는화면을


웹페이지에서확인가능

![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-722-0.png)


18


##### 05 .

CD 자동Trigger
및배포/기동상태
확인하기


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-723-full.png)

4.1
CI/CD Pipeline 결과


ArgoCD에서새Revision으로POD가정상생성되고Running 상태및ArgoCD Healthy 확인

![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-723-0.png)


19


##### 05 .

CD 자동Trigger
및배포/기동상태
확인하기


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-724-full.png)

4.2
CI/CD Pipeline 결과


Argo Rollout에서새Revision으로Canary 배포과정이정상수행됨을Dashboard에서확인

![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-724-0.png)


20


##### 05 .

CD 자동Trigger
및배포/기동상태
확인하기


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-725-full.png)

4.3
CI/CD Pipeline 결과


Argo Rollout에서새Revision으로Canary 배포과정이정상수행됨을CLI에서확인

![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-725-0.png)


21


##### 05 .

CD 자동Trigger
및배포/기동상태
확인하기


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-726-full.png)

4.4
CI/CD Pipeline 결과


Canary 배포완료시전체Bubble Tile이Red로100% 적용

![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-726-0.png)


22


##### 05 .

CD 자동Trigger
및배포/기동상태
확인하기


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-727-full.png)
## 11. Kubernetes 활용미니프로젝트수행하기

06
Canary 배포적용및무중단버전업데이트하기


1


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-728-full.png)
##### 06 .
###### [실습] Canary 배포적용및무중단버전업데이트하기



1. 로컬PC IDE에서 Jenkinsfile에본인의설정정보와알맞게설정


2. Blue
Ingress를통한Bubble-Pool 확인( )


3. 예제코드를Git에 Commit/Push 및Jenkins Trigger 수행(지금빌드)


4. Jenkins을통한 CI Job 진행 사항확인


5. CI Job 완료후ArgoCD에서 CD Job 진행 확인


6. Blue -> Green
CD 진행중Ingress를통한Bubble-Pool 확인( )


7.
CD 진행중Argo Rollout CLI와GUI인Dashboard를통해 Canary 배포


수행되는것을확인


8. 2분후, CI/CD Pipeline 완료및Canary 배포완료후 정상배포및기동 확인,


Green
Ingress를통한Bubble-Pool 확인( )



Canary 배포
적용및무중단
버전업데이트
하기


2


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-729-full.png)
##### 개발자를위한Kubernetes 활용컨셉 06 .

Canary 배포
적용및무중단
버전업데이트
하기


1. 클라우드인프라기반컨테이너플랫폼환경 설계 및 구축 수행


2. 컨테이너플랫폼기반 개발 환경구성


3. 컨테이너플랫폼의안정적인 운영 방안마련


3


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-730-full.png)

개발자를위한Kubernetes 활용파트구성


1. 개발자를위한Kubernetes 활용소개

2. Terraform을활용한AWS EKS 생성

3. AWS EKS 기본 Plugin 구성방법
4. Kubernetes Manifest 작성을위한 Helm 활용

5. Kubernetes 배포를위한 GitHub와 활용
ArgoCD
6. Kubernetes 안정성 강화방법

7. Kubernetes Custom 관리방법

8. Kubernetes 보안 강화방법

9. Kubernetes 트러블슈팅 방법

10. Go를활용한Kubernetes CLI 개발

11. Kubernetes 활용 미니프로젝트 수행하기


4


##### 06 .

Canary 배포
적용및무중단
버전업데이트
하기


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-731-full.png)

Chapter2. Terraform을활용한AWS EKS 생성


1. Terraform을활용한AWS EKS 생성 소개


2. 실습환경구성을위한AWS 네트워크및EKS 설계


3. [실습] AWS 웹콘솔을활용한AWS EKS 생성


4. Terraform
소개(Terraformer 포함)


5. [실습] Terraform을활용한AWS EKS 생성


6. [실습] Terraformer를활용한AWS EKS 관리


5


##### 06 .

Canary 배포
적용및무중단
버전업데이트
하기


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-732-full.png)

Chapter2. Terraform

![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-732-0.png)


출처: https://learn.hashicorp.com/tutorials/terraform/infrastructure-as-code


6


##### 06 .

Canary 배포
적용및무중단
버전업데이트
하기


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-733-full.png)

Chapter3. AWS EKS 기본Plugin 구성방법


1. AWS EKS 기본설정 방법소개


2. [실습] EKS Node 및POD IP 대역분리(Secondray CIDR) 적용


3. [실습] AWS ALB Controller를활용한 ALB 생성
Ingress


4. [실습] AWS ALB Controller를활용한 Service NLB 생성


5. [실습] AWS EBS CSI Driver를활용한 Block Storage PV 생성


6. [실습] AWS EFS CSI Driver를활용한 File PV 생성
Storage


7. [실습] Cluster Autoscaler를활용한 EKS노드오토스케일링


7


##### 06 .

Canary 배포
적용및무중단
버전업데이트
하기


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-734-full.png)

Chapter3. AWS ALB Controller를활용한Service NLB 생성

![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-734-0.png)


출처: https://medium.com/awesome-cloud/aws-difference-between-application-load-balancer-and-network-load-balancer-cb8b6cd296a4


8


##### 06 .

Canary 배포
적용및무중단
버전업데이트
하기


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-735-full.png)

Chapter4. Kubernetes Manifest 작성을위한Helm 활용


1. Kubernetes Manifest 작성 방법소개


2. Kustomize 소개


3. [실습] Kustomize을활용한 Manifest 배포하기


4. Helm Charts 소개


5. Helm Values 및Template 소개


6. [실습] Helm Charts를활용한 Manifest 배포하기


9


##### 06 .

Canary 배포
적용및무중단
버전업데이트
하기


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-736-full.png)
###### Chapter4. Helm


##### 06 .

Canary 배포
적용및무중단
버전업데이트
하기



![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-736-0.png)

출처: https://devopscube.com/install-configure-helm-kubernetes/


10


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-737-full.png)

Chapter5. Kubernetes 배포를위한GitHub와ArgoCD 활용


1. Git을활용한Kubernetes 배포 방법소개


2. [실습] Github 생성및설정
Repository


3.
Kubernetes 배포도구( ) 소개
ArgoCD, ArgoRollout


4. [실습] 구성
ArgoCD


5. [실습] ArgoCD를활용한Kubernetes Manifest 배포


6. [실습] ArgoRollout 구성


7. [실습] Argo Rollout을활용한 무중단배포


11


##### 06 .

Canary 배포
적용및무중단
버전업데이트
하기


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-738-full.png)
###### Chapter5. ArgoCD


##### 06 .

Canary 배포
적용및무중단
버전업데이트
하기



![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-738-0.png)

출처: https://argo-cd.readthedocs.io/en/stable/

12


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-739-full.png)

Chapter6. Kubernetes 안정성강화방법


1. Kubernetes 안정성강화 방법소개


2. [실습] HPA 소개및Metrics Server 설치


3. [실습] HPA 및 오토스케일링 적용


4. [실습] Minio 소개및설치


5. [실습] Minio 및AWS S3 연결후 업로드/다운로드 적용


6. [실습] Velero 소개및설치


7. [실습] Velero 백업 적용


8. [실습] Velero 복구 적용


13


##### 06 .

Canary 배포
적용및무중단
버전업데이트
하기


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-740-full.png)
###### Chapter6. HPA(Horizontal Pod Autoscaler)

![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-740-0.png)

출처: https://medium.com/tensult/cluster-autoscaler-ca-and-horizontal-pod-autoscaler-hpa-on-kubernetes-f25ba7fd00b9


14


##### 06 .

Canary 배포
적용및무중단
버전업데이트
하기


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-741-full.png)

Chapter7. Kubernetes Custom 관리방법


1. Kubernetes Custom 관리 방법소개


2. CRD
Custom Resource Definition( ) 소개


3. Kubernetes 소개
Operator


4.

[실습] Kubernetes Operator 적용


15


##### 06 .

Canary 배포
적용및무중단
버전업데이트
하기


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-742-full.png)

Chapter7. KUDO


##### 06 .

Canary 배포
적용및무중단
버전업데이트
하기



![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-742-0.png)

출처: https://kudo.dev/docs/architecture.html


16


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-743-full.png)

Chapter8. Kubernetes 보안강화방법


1. Kubernetes 보안강화 활용소개


2. [실습] kube2iam 소개및설치


3. [실습] kube2iam를활용한AWS IAM 기반 권한관리


4. [실습] Falco 소개및설치


5. [실습] Falco를활용한 런타임보안강화


6. [실습] OPA Gatekeeper 소개및설치


7. [실습] OPA Gatekeeper를활용한 보안정책관리


8. [실습] 소개및설치
cert-manager

9. [실습] cert-manager를활용한 TLS 인증서관리


10. [실습] AWS ACM 활용 TLS 인증서관리


17


##### 06 .

Canary 배포
적용및무중단
버전업데이트
하기


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-744-full.png)
###### Chapter8. IAM 기반권한관리

![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-744-0.png)

출처: https://docs.aws.amazon.com/ko_kr/IAM/latest/UserGuide/intro-structure.html


18


##### 06 .

Canary 배포
적용및무중단
버전업데이트
하기


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-745-full.png)

Chapter9. Kubernetes 트러블슈팅방법


1. Kubernetes 트러블슈팅 방법소개


2. [실습] Cluster 로깅 및이슈사례조치방법


3. [실습] Node 로깅 및이슈사례조치방법


4. [실습] POD 로깅 및이슈사례조치방법


5. [실습] 보안관련로깅 및이슈사례조치방법


6. [실습] DNS 로깅 및이슈사례조치방법


19


##### 06 .

Canary 배포
적용및무중단
버전업데이트
하기


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-746-full.png)

Chapter9. Kubernetes 트러블슈팅방법


kubectl을사용한트러블슈팅


##### 06 .

Canary 배포
적용및무중단
버전업데이트
하기



![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-746-0.png)

20


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-747-full.png)

Chapter10. Go를활용한Kubernetes CLI 개발


1. Go를활용한Kubernetes CLI 개발소개


2. Go언어필수 문법 소개


3. Kubernetes Custom CLI 설계


4. [실습] Kubernetes API 활용 모듈구현


5. [실습] Kubernetes CLI 빌드및실행


21


##### 06 .

Canary 배포
적용및무중단
버전업데이트
하기


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-748-full.png)

Chapter10. CDK8s


   개발자는자기가원하는언어로 코드를작성하고, CDK8s CLI를통해서
코드를쿠버네티스매니페스트 YAML 파일로전환이가능

   전환된 YAML은 kubectl CLI를통해서kubernetes Cluster에 배포하거나,
버전/형상관리 및배포가능
GitOps Repository를활용해

![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-748-0.png)


출처- https://aws.amazon.com/ko/blogs/korea/using-cdk8s-for-kubernetes-applications/


22


##### 06 .

Canary 배포
적용및무중단
버전업데이트
하기


![](/Users/cglee/Dev/openai/mcp/pdf-reader-mcp/test/fixtures/images/FC_Terrafrom.pdf-749-full.png)

Chapter11. Kubernetes 활용미니프로젝트수행하기


1. Kubernetes 활용미니프로젝트소개


2. [실습] CI 환경설정및 빌드 준비하기


3. [실습] CD 환경설정및 배포 준비하기


4. [실습] CI 빌드수행및 컨테이너Push, Helm Charts Push 하기


5. [실습] CD 자동 및 배포/기동상태 확인하기
Trigger


6. [실습] Canary 배포 적용및 무중단버전업데이트 하기


23


##### 06 .

Canary 배포
적용및무중단
버전업데이트
하기



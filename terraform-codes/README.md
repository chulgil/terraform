# Production-level AWS EKS Terraform

이 코드는 프로덕션 환경의 AWS EKS 인프라를 모듈화하여 유지보수와 확장성이 뛰어나도록 설계되었습니다.

## 폴더 트리 구조

```text
terraform-codes/
├── README.md
├── versions.tf
├── provider.tf
├── modules/
│   ├── vpc/
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   └── outputs.tf
│   └── eks/
│       ├── main.tf
│       ├── variables.tf
│       └── outputs.tf
└── envs/
    └── production/
        ├── main.tf
        ├── variables.tf
        └── outputs.tf
```

## 각 폴더/파일 설명

| 경로 | 설명 |
|---|---|
| `README.md` | 전체 구조, 사용법, 폴더 트리 및 설명 |
| `versions.tf` | Terraform 및 Provider 버전 명시 |
| `provider.tf` | AWS Provider 설정 (region 등) |
| `modules/vpc/` | VPC 관련 커스텀 모듈 디렉토리 |
| `modules/vpc/main.tf` | VPC 모듈의 실제 리소스 정의 (terraform-aws-modules/vpc/aws 활용) |
| `modules/vpc/variables.tf` | VPC 모듈 입력 변수 정의 |
| `modules/vpc/outputs.tf` | VPC 모듈 output 값 정의 |
| `modules/eks/` | EKS 관련 커스텀 모듈 디렉토리 |
| `modules/eks/main.tf` | EKS 클러스터 리소스 정의 (terraform-aws-modules/eks/aws 활용) |
| `modules/eks/variables.tf` | EKS 모듈 입력 변수 정의 |
| `modules/eks/outputs.tf` | EKS 모듈 output 값 정의 |
| `envs/production/` | 프로덕션 환경 배포용 디렉토리 |
| `envs/production/main.tf` | 실제 배포를 위한 모듈 호출 및 리소스 정의 |
| `envs/production/variables.tf` | 환경별 변수 정의 (region 등) |
| `envs/production/outputs.tf` | 환경별 output 값 정의 |

## 사용법
1. `envs/production`에서 `terraform init`, `terraform apply` 실행
2. 변수/백엔드/모듈 구조는 각 환경에 맞게 확장 가능

---
각 모듈 및 환경별 파일은 예시와 실제 값을 참고해 작성되어 있습니다.

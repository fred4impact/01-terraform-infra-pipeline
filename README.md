# AWS Infrastructure Deployment using Terraform and CI/CD

## 📌 Objective
Automate the deployment of VPC, EC2, and S3 infrastructure using Terraform with remote state management and environment-specific configurations.

## 🚀 Tech Stack
- **AWS Services**: VPC, EC2, S3, IAM, KMS
- **Infrastructure as Code**: Terraform
- **CI/CD**: GitHub Actions (to be added)
- **State Management**: S3 + DynamoDB (planned)

## 📐 Architecture
```
┌─────────────────────────────────────────────────────────────┐
│                        AWS Account                          │
│  ┌─────────────────┐  ┌─────────────────┐  ┌─────────────┐  │
│  │   S3 Bucket     │  │   VPC Network   │  │    EC2      │  │
│  │   (Storage)     │  │   (Networking)  │  │ (Compute)   │  │
│  │                 │  │                 │  │             │  │
│  │ • State Storage │  │ • Public Subnets│  │ • Web Server│  │
│  │ • KMS Encrypted │  │ • Private Subnets│  │ • Apache2   │  │
│  │ • Versioning    │  │ • IGW + Routes  │  │ • SSH Access│  │
│  └─────────────────┘  └─────────────────┘  └─────────────┘  │
└─────────────────────────────────────────────────────────────┘
```

## ✅ Features
- **Remote Backend**: S3 bucket for Terraform state storage
- **Environment Management**: Staging and production environments
- **Security**: KMS encryption, security groups, private/public subnet separation
- **Modular Design**: Reusable Terraform modules
- **CI/CD Ready**: Prepared for GitHub Actions integration

## 📁 Project Structure
```
01-terraform-infra-pipeline/
├── 📄 main.tf                    # Main infrastructure configuration
├── 📄 backend.tf                 # Remote state backend configuration
├── 📄 provider.tf                # AWS provider configuration
├── 📁 environments/              # Environment-specific configurations
│   └── 📁 staging/
└── 📁 modules/                   # Reusable Terraform modules
    ├── 📁 s3/                    # S3 bucket module
    ├── 📁 network/               # VPC and networking module
    ├── 📁 compute/               # EC2 instance module
    ├── 📁 security-groups/       # Security groups module
    └── 📁 base/                  # Base metadata module
```

## 🔧 Prerequisites
- **AWS CLI** configured with credentials
- **Terraform** >= 1.0 installed
- **AWS Account** with necessary permissions
- **SSH Key Pair** for EC2 access

## 🚀 Quick Start

### 1. Clone and Configure
```bash
git clone <repository-url>
cd 01-terraform-infra-pipeline
aws configure
```

### 2. Deploy Infrastructure
```bash
terraform init
terraform plan
terraform apply
```

### 3. Access Your Infrastructure
- **EC2 Instance**: SSH using your configured key pair
- **Web Server**: Access via public IP on port 80
- **S3 Bucket**: Check AWS Console for bucket details

## 🏗️ Infrastructure Components

### VPC Network Module
- **VPC**: 10.0.0.0/16 CIDR block
- **Public Subnets**: 2 subnets across us-east-1a and us-east-1b
- **Private Subnets**: 2 subnets for secure resources
- **Internet Gateway**: For public subnet internet access

### EC2 Compute Module
- **AMI**: Latest Ubuntu 20.04 LTS
- **Instance Type**: Configurable (default: t2.micro)
- **User Data**: Apache2 installation and configuration
- **Security**: SSH and HTTP access via security groups

### S3 Storage Module
- **Encryption**: KMS key with automatic rotation
- **Versioning**: Enabled for state file protection
- **Access Control**: Private bucket with proper ACLs

## 📋 Available Commands

### Terraform Commands
```bash
terraform init          # Initialize Terraform
terraform plan          # Plan infrastructure changes
terraform apply         # Apply infrastructure changes
terraform destroy       # Destroy infrastructure
terraform show          # Show current state
```

### Environment-Specific Commands
```bash
# Work with staging environment
cd environments/staging
terraform init
terraform plan
terraform apply
```

## 🔄 CI/CD Integration (Coming Soon)
- **Automated Deployment**: Push to trigger infrastructure updates
- **Environment Promotion**: Staging → Production workflow
- **Security Scanning**: Terraform security analysis
- **State Management**: Automated state locking and unlocking

## 🛠️ Customization
Key variables can be customized in each module:
- **Instance Type**: Change EC2 instance size
- **VPC CIDR**: Modify network addressing
- **Availability Zones**: Configure AZ distribution
- **Security Groups**: Customize access rules

## 🚨 Troubleshooting

### Common Issues
1. **State Lock**: Use `terraform force-unlock <lock-id>` if needed
2. **Permission Errors**: Verify AWS credentials and IAM permissions
3. **Resource Conflicts**: Check for existing resources with same names

### Debug Commands
```bash
export TF_LOG=DEBUG
terraform plan
aws sts get-caller-identity
terraform version
```

## 📚 Additional Resources
- [Terraform AWS Provider Documentation](https://registry.terraform.io/providers/hashicorp/aws/latest/docs)
- [AWS VPC User Guide](https://docs.aws.amazon.com/vpc/)
- [Terraform State Management](https://www.terraform.io/docs/state/)

---
**Note**: This infrastructure is designed for learning and development purposes. For production use, additional security hardening and monitoring should be implemented.

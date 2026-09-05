# SATECH Manufacturing - Cloud Observability Infrastructure
# Multi-Cloud Observability Stack Provisioning (AWS Core + Azure Hybrid Monitoring)

terraform {
  required_version = ">= 1.5.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
  default_tags {
    tags = {
      Environment = "Production"
      Project     = "SATECH-Observability"
      ManagedBy   = "Terraform"
    }
  }
}

# VPC for Observability Cluster
resource "aws_vpc" "observability_vpc" {
  cidr_block           = "10.100.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support   = true
  tags = {
    Name = "satech-observability-vpc"
  }
}

# Prometheus & Grafana Instance
resource "aws_instance" "monitoring_node" {
  ami           = "ami-0c7217cdde317cfec" # Amazon Linux 2023 LTS
  instance_type = var.instance_type
  subnet_id     = aws_subnet.public_subnet.id

  user_data = <<-EOF
              #!/bin/bash
              yum update -y
              amazon-linux-extras install docker -y
              service docker start
              usermod -a -G docker ec2-user
              curl -L "https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
              chmod +x /usr/local/bin/docker-compose
              EOF

  tags = {
    Name = "satech-monitoring-core"
  }
}

# Public Subnet
resource "aws_subnet" "public_subnet" {
  vpc_id                  = aws_vpc.observability_vpc.id
  cidr_block              = "10.100.1.0/24"
  map_public_ip_on_launch = true
  tags = {
    Name = "satech-public-subnet"
  }
}

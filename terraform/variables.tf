variable "aws_region" {
  description = "AWS Region for SATECH Observability Stack"
  type        = string
  default     = "eu-west-1"
}

variable "instance_type" {
  description = "EC2 instance size for monitoring node"
  type        = string
  default     = "t3.xlarge"
}

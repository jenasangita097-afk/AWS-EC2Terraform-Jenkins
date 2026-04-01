variable "region" {
  description = "AWS region"
  default     = "ap-south-1"
}

variable "instance_count" {
  description = "Number of EC2 instances"
  default     = 2
}

variable "instance_type" {
  description = "EC2 instance type"
  default     = "t3.micro"
}

variable "ami_id" {
  description = "AMI ID for Amazon Linux"
  default     = "ami-0f58b397bc5c1f2e8"
}

variable "instance_name" {
  description = "Base name for instances"
  default     = "server"
}

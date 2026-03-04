variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "ap-southeast-2"
}

variable "project_name" {
  description = "Project name used for naming resources"
  type        = string
  default     = "aws-web-app-infra"
}

variable "container_image" {
  description = "Docker Hub image URI"
  type        = string
  default     = "rencecaringal000/employee-crud:latest"
}

variable "container_port" {
  description = "Port the container listens on"
  type        = number
  default     = 80
}

variable "task_cpu" {
  description = "Task CPU units (1024 = 1 vCPU)"
  type        = number
  default     = 256
}

variable "task_memory" {
  description = "Task memory in MB"
  type        = number
  default     = 512
}

variable "desired_count" {
  description = "Number of tasks to run"
  type        = number
  default     = 1
}

variable "vpc_cidr" {
  description = "CIDR block for VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "public_subnet_cidrs" {
  description = "CIDR blocks for public subnets"
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
}

variable "availability_zones" {
  description = "Availability zones"
  type        = list(string)
  default     = ["ap-southeast-2a", "ap-southeast-2b", "ap-southeast-2c"]
}

variable "log_group_skip_destroy" {
  description = "If true, CloudWatch log group will NOT be deleted on terraform destroy"
  type        = bool
  default     = false
}

# ---- Laravel .env variables ----

variable "app_name" {
  description = "Laravel APP_NAME"
  type        = string
  default     = "Laravel"
}

variable "app_env" {
  description = "Laravel APP_ENV"
  type        = string
  default     = "production"
}

variable "app_key" {
  description = "Laravel APP_KEY"
  type        = string
  sensitive   = true
}

variable "app_debug" {
  description = "Laravel APP_DEBUG"
  type        = string
  default     = "false"
}

variable "app_url" {
  description = "Laravel APP_URL"
  type        = string
  default     = "http://localhost"
}

variable "db_connection" {
  description = "Database connection driver"
  type        = string
  default     = "pgsql"
}

variable "db_host" {
  description = "Database host"
  type        = string
}

variable "db_port" {
  description = "Database port"
  type        = string
  default     = "6543"
}

variable "db_database" {
  description = "Database name"
  type        = string
  default     = "postgres"
}

variable "db_username" {
  description = "Database username"
  type        = string
  sensitive   = true
}

variable "db_password" {
  description = "Database password"
  type        = string
  sensitive   = true
}

variable "db_sslmode" {
  description = "Database SSL mode"
  type        = string
  default     = "require"
}

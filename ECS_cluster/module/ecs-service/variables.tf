variable "desired_count" {
  description = "The desired number of tasks"
  type        = number
}

variable "launch_type" {
  description = "The launch type for the ECS service"
  type        = string
}

variable "service-name" {
  type = string
}

variable "cluster-id" {
  type = string
}
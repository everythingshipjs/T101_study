variable "db_name" {
  description = "The name to use for the database"
  type        = string
  default     = "example"
}

variable "db_username" {
  description = "The username to use for the database"
  type        = string
  default     = "admin"
  sensitive   = true
}
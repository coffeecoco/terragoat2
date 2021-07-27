variable "tags" {}
variable "s3_kms_arn" {
  description = "Map containing server-side encryption configuration."
  type        = any
  default     = "asdasdasdasdasdasdas"
}

variable "encryption_algo" {
  description = "Map containing server-side encryption configuration."
  type        = any
  default     = "AES256"
}
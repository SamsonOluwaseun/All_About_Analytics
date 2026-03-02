variable "project_id" {
  description = "The ID of the project in which to create the resources."
  type        = string
  default     = "ai-projects-280725"
}
variable "region" {
  description = "The region where resources will be created"
  default     = "europe-west1"
}
variable "Location" {
  description = "The location of the resources."
  type        = string
  default     = "europe-west1"

}
variable "bq_dataset_name" {
  description = "Name of the BigQuery dataset to create"
  type        = string
  default     = "example_dataset"

}
variable "gcs_storage_class" {
  description = "Bucket storage class"
  default     = "STANDARD"
}

variable "gcs_bucket_name" {
  description = "My storage Bucket Name"
  default     = "terra-demo-bucket-280725"
}
variable "credentials" {
    description = "Path to the service account key file"
    default     = "./keys/my-creds.json"  
}


terraform {
  backend "gcs" {
    bucket = "naas-tf-state"
    prefix = "terraform/state"
  }
}
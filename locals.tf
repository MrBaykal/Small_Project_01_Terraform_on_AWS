# locals.tf
locals {
  prefix = var.prefix
  comman_tags = {
    Project = var.project
    Contact = var.contact
    Managed_by = "Terraform"

  }
}
terraform {
  required_providers {
    oci = {
      source  = "oracle/oci"
      version = ">= 5.0.0" # Using a recent version, adjust if necessary
    }
  }
}

provider "oci" {
  # The region is sourced from the 'region' variable defined in variables.tf
  # Ensure your OCI CLI configuration is set up correctly for authentication,
  # or configure authentication details directly in this block if needed.
  # Example:
  # tenancy_ocid     = var.tenancy_ocid
  # user_ocid        = var.user_ocid
  # fingerprint      = var.fingerprint
  # private_key_path = var.private_key_path
  region = var.region
}

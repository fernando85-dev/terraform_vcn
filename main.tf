# Data source to get the OCID of the current tenancy
data "oci_identity_tenancy" "current_tenancy" {}

# Resource to create a new compartment for the VCN and related resources
resource "oci_identity_compartment" "vcn_compartment" {
  name           = var.compartment_name
  description    = "Compartment for the VCN and related networking resources"
  compartment_id = data.oci_identity_tenancy.current_tenancy.id # Creates the compartment in the root/tenancy
  enable_delete  = true # Set to true to allow deletion of the compartment via Terraform
}

# Resource to create the Virtual Cloud Network (VCN)
resource "oci_core_vcn" "custom_vcn" {
  cidr_block     = var.vcn_cidr_block
  compartment_id = oci_identity_compartment.vcn_compartment.id
  display_name   = "CustomVCN"

  dns_label      = "customvcn" # DNS label for the VCN, must be unique within the subnet

  # Freeform tags are optional
  # freeform_tags = {
  #   "Environment" = "Development"
  # }
}

# Resource to create subnets within the VCN
resource "oci_core_subnet" "custom_subnets" {
  count          = length(var.subnet_cidr_blocks)
  vcn_id         = oci_core_vcn.custom_vcn.id
  compartment_id = oci_identity_compartment.vcn_compartment.id
  cidr_block     = var.subnet_cidr_blocks[count.index]
  display_name   = "Subnet-${count.index + 1}"

  # DNS label for each subnet, must be unique within the VCN
  # Ensure the label is valid (no dots, max 15 chars, starts with letter)
  dns_label      = "subnet${count.index + 1}"

  # Optional: Specify a security list OCID if you have one pre-defined
  # security_list_ids = [oci_core_vcn.custom_vcn.default_security_list_id]

  # Optional: Specify a route table OCID if you have one pre-defined
  # route_table_id = oci_core_vcn.custom_vcn.default_route_table_id

  # Freeform tags are optional
  # freeform_tags = {
  #   "Name" = "Subnet-${count.index + 1}"
  # }
}

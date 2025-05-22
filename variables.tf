variable "vcn_cidr_block" {
  type        = string
  description = "The CIDR block for the VCN. Example: \"10.0.0.0/16\""
}

variable "subnet_cidr_blocks" {
  type        = list(string)
  description = "A list of CIDR blocks for the subnets. Example: [\"10.0.1.0/24\", \"10.0.2.0/24\"]"
}

variable "compartment_name" {
  type        = string
  description = "The name for the new compartment where the VCN and subnets will be created."
  default     = "NetworkingCompartment"
}

variable "region" {
  type        = string
  description = "The OCI region where resources will be created. Example: \"us-ashburn-1\""
  # No default, as this should be explicitly set or come from OCI config.
}

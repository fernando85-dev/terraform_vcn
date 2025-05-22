output "vcn_id" {
  description = "The OCID of the created VCN."
  value       = oci_core_vcn.custom_vcn.id
}

output "vcn_compartment_id" {
  description = "The OCID of the compartment created for the VCN."
  value       = oci_identity_compartment.vcn_compartment.id
}

output "subnet_ids" {
  description = "A list of OCIDs of the created subnets."
  value       = [for s in oci_core_subnet.custom_subnets : s.id]
  # For older Terraform versions that don't support the for expression in outputs directly,
  # you might need to use `oci_core_subnet.custom_subnets.*.id`
  # value       = oci_core_subnet.custom_subnets.*.id 
}

output "vcn_dns_label" {
  description = "The DNS label of the created VCN."
  value       = oci_core_vcn.custom_vcn.dns_label
}

output "subnet_dns_labels" {
  description = "The DNS labels of the created subnets."
  value       = [for s in oci_core_subnet.custom_subnets : s.dns_label]
  # For older Terraform versions:
  # value       = oci_core_subnet.custom_subnets.*.dns_label
}

# terraform_vcn

# OCI VCN and Subnet Terraform Configuration

This Terraform module creates a new compartment, a Virtual Cloud Network (VCN), and a specified number of subnets within that VCN in Oracle Cloud Infrastructure (OCI).

## Prerequisites

1.  **OCI Account**: You must have an active OCI account.
2.  **OCI CLI Configured**: Your OCI Command Line Interface (CLI) must be configured with the necessary credentials and default region. Terraform will use this configuration for authentication and to determine the region if not explicitly set. You can test your configuration by running `oci iam region list`.
3.  **Terraform Installed**: Terraform (version 1.x or later recommended) must be installed on your local machine.

## Configuration Variables

The following variables need to be configured, typically in a `terraform.tfvars` file or by providing them at the command line:

| Variable             | Description                                                                 | Type          | Default Value          | Example                                       |
| -------------------- | --------------------------------------------------------------------------- | ------------- | ---------------------- | --------------------------------------------- |
| `region`             | The OCI region where resources will be created.                             | `string`      | (none - must be set)   | `"us-ashburn-1"`                              |
| `compartment_name`   | The name for the new compartment where the VCN and subnets will be created. | `string`      | `"NetworkingCompartment"`| `"MyProdNetworking"`                          |
| `vcn_cidr_block`     | The CIDR block for the VCN.                                                 | `string`      | (none - must be set)   | `"10.0.0.0/16"`                               |
| `subnet_cidr_blocks` | A list of CIDR blocks for the subnets.                                      | `list(string)`| (none - must be set)   | `["10.0.1.0/24", "10.0.2.0/24"]`              |

## Usage

1.  **Clone the repository (if applicable) or ensure you have the `.tf` files.**

2.  **Create a `terraform.tfvars` file** in the same directory with your desired variable values. For example:

    ```terraform
    region             = "us-phoenix-1"
    compartment_name   = "MyVCNCompartment"
    vcn_cidr_block     = "192.168.0.0/16"
    subnet_cidr_blocks = ["192.168.1.0/24", "192.168.2.0/24", "192.168.3.0/24"]
    ```

3.  **Initialize Terraform**:
    ```bash
    terraform init
    ```

4.  **Plan the deployment**:
    ```bash
    terraform plan
    ```
    Review the plan to ensure it matches your expectations.

5.  **Apply the configuration**:
    ```bash
    terraform apply
    ```
    Type `yes` when prompted to confirm.

## Outputs

After a successful apply, Terraform will output the following:

| Output Name          | Description                                      |
| -------------------- | ------------------------------------------------ |
| `vcn_compartment_id` | The OCID of the compartment created for the VCN. |
| `vcn_id`             | The OCID of the created VCN.                     |
| `vcn_dns_label`      | The DNS label of the created VCN.                |
| `subnet_ids`         | A list of OCIDs of the created subnets.          |
| `subnet_dns_labels`  | The DNS labels of the created subnets.           |
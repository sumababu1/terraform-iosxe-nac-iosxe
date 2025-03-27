<!-- BEGIN_TF_DOCS -->
# Terraform Network-as-Code Cisco IOS-XE Module

A Terraform module to configure Cisco IOS-XE devices.

## Usage

This module supports an inventory driven approach, where a complete IOS-XE configuration or parts of it are either modeled in one or more YAML files or natively using Terraform variables.

## Examples

Configuring an IOS-XE system configuration using YAML:

#### `system.nac.yaml`

```yaml
iosxe:
  devices:
    - name: Switch1
      url: https://1.2.3.4
      configuration:
        system:
          hostname: Switch1
          mtu: 9198
```

#### `main.tf`

```hcl
module "nxos" {
  source  = "netascode/nac-iosxe/iosxe"
  version = ">= 0.1.0"

  yaml_files = ["system.nac.yaml"]
}
```

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.8.0 |
| <a name="requirement_iosxe"></a> [iosxe](#requirement\_iosxe) | >= 0.5.9 |
| <a name="requirement_local"></a> [local](#requirement\_local) | >= 2.3.0 |
| <a name="requirement_utils"></a> [utils](#requirement\_utils) | >= 0.2.6 |
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_model"></a> [model](#input\_model) | As an alternative to YAML files, a native Terraform data structure can be provided as well. | `map(any)` | `{}` | no |
| <a name="input_save_config"></a> [save\_config](#input\_save\_config) | Write changes to startup-config on all devices. | `bool` | `false` | no |
| <a name="input_write_default_values_file"></a> [write\_default\_values\_file](#input\_write\_default\_values\_file) | Write all default values to a YAML file. Value is a path pointing to the file to be created. | `string` | `""` | no |
| <a name="input_yaml_directories"></a> [yaml\_directories](#input\_yaml\_directories) | List of paths to YAML directories. | `list(string)` | `[]` | no |
| <a name="input_yaml_files"></a> [yaml\_files](#input\_yaml\_files) | List of paths to YAML files. | `list(string)` | `[]` | no |
## Outputs

| Name | Description |
|------|-------------|
| <a name="output_default_values"></a> [default\_values](#output\_default\_values) | All default values. |
| <a name="output_model"></a> [model](#output\_model) | Full model. |
## Resources

| Name | Type |
|------|------|
| [iosxe_aaa.aaa](https://registry.terraform.io/providers/CiscoDevNet/iosxe/latest/docs/resources/aaa) | resource |
| [iosxe_aaa_accounting.aaa_accounting](https://registry.terraform.io/providers/CiscoDevNet/iosxe/latest/docs/resources/aaa_accounting) | resource |
| [iosxe_aaa_authentication.aaa_authentication](https://registry.terraform.io/providers/CiscoDevNet/iosxe/latest/docs/resources/aaa_authentication) | resource |
| [iosxe_aaa_authorization.aaa_authorization](https://registry.terraform.io/providers/CiscoDevNet/iosxe/latest/docs/resources/aaa_authorization) | resource |
| [iosxe_access_list_extended.access_list_extended](https://registry.terraform.io/providers/CiscoDevNet/iosxe/latest/docs/resources/access_list_extended) | resource |
| [iosxe_access_list_standard.access_list_standard](https://registry.terraform.io/providers/CiscoDevNet/iosxe/latest/docs/resources/access_list_standard) | resource |
| [iosxe_arp.arp](https://registry.terraform.io/providers/CiscoDevNet/iosxe/latest/docs/resources/arp) | resource |
| [iosxe_as_path_access_list.as_path_access_list](https://registry.terraform.io/providers/CiscoDevNet/iosxe/latest/docs/resources/as_path_access_list) | resource |
| [iosxe_banner.banner](https://registry.terraform.io/providers/CiscoDevNet/iosxe/latest/docs/resources/banner) | resource |
| [iosxe_bfd.bfd](https://registry.terraform.io/providers/CiscoDevNet/iosxe/latest/docs/resources/bfd) | resource |
| [iosxe_save_config.save_config](https://registry.terraform.io/providers/CiscoDevNet/iosxe/latest/docs/resources/save_config) | resource |
| [local_sensitive_file.defaults](https://registry.terraform.io/providers/hashicorp/local/latest/docs/resources/sensitive_file) | resource |
| [terraform_data.validation](https://registry.terraform.io/providers/hashicorp/terraform/latest/docs/resources/data) | resource |
## Modules

No modules.
<!-- END_TF_DOCS -->
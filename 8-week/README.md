# 8-week

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0.0, < 2.0.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 4.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws.region_1"></a> [aws.region\_1](#provider\_aws.region\_1) | 4.46.0 |
| <a name="provider_aws.region_2"></a> [aws.region\_2](#provider\_aws.region\_2) | 4.46.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_instance.region_1](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance) | resource |
| [aws_instance.region_2](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance) | resource |
| [aws_ami.ubuntu_region_1](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/ami) | data source |
| [aws_ami.ubuntu_region_2](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/ami) | data source |
| [aws_region.region_1](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/region) | data source |
| [aws_region.region_2](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/region) | data source |

## Inputs

No inputs.

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_instance_region_1_az"></a> [instance\_region\_1\_az](#output\_instance\_region\_1\_az) | The AZ where the instance in the first region deployed |
| <a name="output_instance_region_2_az"></a> [instance\_region\_2\_az](#output\_instance\_region\_2\_az) | The AZ where the instance in the second region deployed |
| <a name="output_region_1"></a> [region\_1](#output\_region\_1) | The name of the first region |
| <a name="output_region_2"></a> [region\_2](#output\_region\_2) | The name of the second region |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

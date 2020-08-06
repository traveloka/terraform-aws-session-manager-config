# terraform-aws-session-manager-config

[![Release](https://img.shields.io/github/release/traveloka/terraform-aws-session-manager-config.svg)](https://github.com/traveloka/terraform-aws-session-manager-config/releases)
[![Last Commit](https://img.shields.io/github/last-commit/traveloka/terraform-aws-session-manager-config.svg)](https://github.com/traveloka/terraform-aws-session-manager-config/commits/master)
![Open Source Love](https://badges.frapsoft.com/os/v1/open-source.png?v=103)

## Description

This terraform module creates configuration for session manager preferences or logging. 

## Prerequisites
-

## Dependencies

This Terraform module have no dependencies to another modules


## Getting Started

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| terraform | >= 0.11 |

## Providers

| Name | Version |
|------|---------|
| aws | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| environment | environment where this infrastructure reside. | `string` | n/a | yes |
| product\_domain | product domain who owns this SSM Session Manager Configuration | `string` | n/a | yes |
| s3\_bucket\_description | description for this bucket. | `string` | `"s3 bucket to store SSM session manager logs"` | no |
| s3\_bucket\_prefix | (Optional) To write output to a sub-dir, enter a sub-dir name. | `string` | `""` | no |
| s3\_enable\_versioning | Enable versioning for this bucket | `string` | `"True"` | no |
| s3\_sse\_algorithm | Encryption algorithm used for this bucket | `string` | `"AES256"` | no |
| session\_manager\_document\_name | The name of SSM document for session manager, this default name is the one allowed by AWS | `string` | `"SSM-SessionManagerRunShell"` | no |
| ssm\_document\_description | description for ssm document | `string` | `"document to hold regional session manager preferences"` | no |

## Outputs

| Name | Description |
|------|-------------|
| iam\_policy\_arn | the arn of iam policy for allowing session manager access |
| iam\_policy\_name | the name of iam policy for allowing session manager access |
| s3\_bucket\_name | the name of s3 bucket |
| ssm\_document\_name | the name of ssm document for session manager preferences |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Contributing

This module accepting or open for any contributions from anyone, please see the [CONTRIBUTING.md](https://github.com/traveloka/terraform-aws-private-route53-zone/blob/master/CONTRIBUTING.md) for more detail about how to contribute to this module.

## License

This module is under Apache License 2.0 - see the [LICENSE](https://github.com/traveloka/terraform-aws-private-route53-zone/blob/master/LICENSE) file for details.
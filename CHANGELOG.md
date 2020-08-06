## v0.1.5 (Aug 06, 2020)

NOTES:
* Add .pre-commit-config.yaml to include terraform_fmt and terraform_docs
* Update README.md to be informative

## v0.1.4 (Aug 7, 2019)

NOTES:
* Add comment to indicate origin of the policy and to allow future comparison
* Rename statement "AllowConnectToSSMServer" -> "AllowSSMActions"
* Separate ssm: actions into statement "AllowSSMActions" for ease of maintenance
* Separate ec2messages: actions into statement "AllowEC2Messages"
* Add statement "AllowCloudWatchPutMetrics" so SSM agent can create CloudWatch metrics
* Add statement "AllowEC2DescribeInstanceStatus" so SSM agent can examine status of the instance
* Rename statement "AllowEC2InstancesToConnectToSessionManagerServer" -> "AllowSSMMessages"
* Rename statement "AllowEC2ToStoreLogsToS3Bucket" -> "AllowS3Logging"
* Add s3:GetBucketLocation to statement "AllowS3Logging"
* Remove statement "AllowEC2InstancesToGetBucketEncryption" since this permission already present in "AllowS3Logging" statement
* Sort all action alphabetically to simplify comparison with original and other policies

## v0.1.3 (Mar 19, 2019)

BUG FIXES:

* Add missing policy for ec2 instances

## v0.1.2 (Mar 18, 2019)

ENHANCEMENTS:

* Use s3 bucket id as reference to create s3 bucket policy

## v0.1.1 (Mar 18, 2019)

ENHANCEMENTS:

* Add IAM Policy ARN as output

## 0.1.0 (Mar 14, 2019)

NOTES:

* Initial implementation

from lark import Token

from checkov.common.models.enums import CheckResult, CheckCategories, CheckClouds
from checkov.terraform.checks.resource.base_resource_check import BaseResourceCheck


class S3MandatoryTags(BaseResourceCheck):
    def __init__(self):
        name = "Ensure IRESS mandatory tagging"
        id = "CKV_AWS_999a"
        supported_resources = ["aws_s3_bucket"]
        categories = [CheckCategories.GENERAL_SECURITY]
        cloud = [CheckClouds.AWS]
        super().__init__(
            name=name,
            id=id,
            categories=categories,
            supported_resources=supported_resources,
            cloud=cloud,
        )

    def scan_resource_conf(self, conf):
        """
            Looks for ACL configuration at aws_s3_bucket and Tag values:
            https://www.terraform.io/docs/providers/aws/r/s3_bucket.html
        :param conf: aws_s3_bucket configuration
        :return: <CheckResult>
        """
        if "tags" in conf.keys():
            environment_tag = Token("IDENTIFIER", "Scope")
            environment_tags = [
                "Name",
                "Product",
                "Application",
                "Service",
                "Client",
                "Owner",
                "Team",
                "DataClassification",
                "Schedule",
                "TaggingStandardVersion",
            ]
            if "var" in conf["tags"][0]:
                return CheckResult.UNKNOWN
            if "tags" in conf.keys():
                if conf["tags"][0]:
                    result = all(x in conf["tags"][0].keys() for x in environment_tags)
                else:
                    return CheckResult.FAILED
            else:
                return CheckResult.FAILED
            if result:
                # if any(i in environment_tags for i in conf['tags'][0].keys()):
                return CheckResult.PASSED
            else:
                return CheckResult.FAILED
        else:
            return CheckResult.FAILED


scanner = S3MandatoryTags()

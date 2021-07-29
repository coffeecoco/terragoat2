resource "aws_kms_key" "logs_key" {
  # key does not have rotation enabled
  description = "${local.resource_prefix.value}-logs bucket key"

  deletion_window_in_days = 7
  tags = {
    git_commit           = "2ad546c54ac005bed254a9844923073b2bbbcd58"
    git_file             = "terraform/aws/kms.tf"
    git_last_modified_at = "2021-07-27 05:00:51"
    git_last_modified_by = "dsanders@coffeecoco.net"
    git_modifiers        = "dsanders"
    git_org              = "coffeecoco"
    git_repo             = "terragoat2"
    yor_trace            = "cd8fa2a7-4868-4cd1-993d-da4644808ce5"
  }
}

resource "aws_kms_alias" "logs_key_alias" {
  name          = "alias/${local.resource_prefix.value}-logs-bucket-key"
  target_key_id = "${aws_kms_key.logs_key.key_id}"
}

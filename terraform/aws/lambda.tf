resource "aws_iam_role" "iam_for_lambda" {
  name = "${local.resource_prefix.value}-analysis-lambda"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "lambda.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
  tags = {
    git_commit           = "2ad546c54ac005bed254a9844923073b2bbbcd58"
    git_file             = "terraform/aws/lambda.tf"
    git_last_modified_at = "2021-07-27 05:00:51"
    git_last_modified_by = "dsanders@coffeecoco.net"
    git_modifiers        = "dsanders"
    git_org              = "coffeecoco"
    git_repo             = "terragoat2"
    yor_trace            = "93cfa6f9-a257-40c3-b7dc-3c3686929734"
  }
}

resource "aws_lambda_function" "analysis_lambda" {
  # lambda have plain text secrets in environment variables
  filename      = "resources/lambda_function_payload.zip"
  function_name = "${local.resource_prefix.value}-analysis"
  role          = "${aws_iam_role.iam_for_lambda.arn}"
  handler       = "exports.test"

  source_code_hash = "${filebase64sha256("resources/lambda_function_payload.zip")}"

  runtime = "nodejs12.x"

  environment {
    variables = {
      access_key = "AKIAIOSFODNN7EXAMPLE"
      secret_key = "wJalrXUtnFEMI/K7MDENG/bPxRfiCYEXAMPLEKEY"
    }
  }
  tags = {
    git_commit           = "2ad546c54ac005bed254a9844923073b2bbbcd58"
    git_file             = "terraform/aws/lambda.tf"
    git_last_modified_at = "2021-07-27 05:00:51"
    git_last_modified_by = "dsanders@coffeecoco.net"
    git_modifiers        = "dsanders"
    git_org              = "coffeecoco"
    git_repo             = "terragoat2"
    yor_trace            = "f7d8bc47-e5d9-4b09-9d8f-e7b9724d826e"
  }
}
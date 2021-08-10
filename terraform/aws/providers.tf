provider "aws" {
  region                      = "ap-southeast-2"
  skip_credentials_validation = true
  skip_requesting_account_id  = true
  skip_metadata_api_check     = true
  s3_force_path_style         = true
  access_key                  = "LOCAL"
  secret_key                  = "LOCAL"

  endpoints {
    dynamodb = "http://localhost:4569"
    s3       = "http://localhost:4572"
    ec2 = "http://localhost:4566"
    sts = "http://localhost:4566"
  }
}

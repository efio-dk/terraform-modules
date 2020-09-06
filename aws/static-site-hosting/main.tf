provider "aws" {
  region  = var.region
  profile = ""
}

provider "aws" {
  alias   = "useast"
  region  = "us-east-1"
  profile = ""
}

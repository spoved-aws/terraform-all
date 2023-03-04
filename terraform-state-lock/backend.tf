terraform {
    backend "s3" {
    bucket = "test-tfstate-s3-832749834982734"
    key    = "test01/terraform.tfstate"
    region = "us-west-2"
    dynamodb_table = "tfstate_lock_db"
    } 
#     lock {
#     name = "LockID"
#     type = "dynamodb"
#   }
}    
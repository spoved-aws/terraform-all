terraform {
    backend "s3" {
    bucket = "statefile-s3-${var.region}-${var.s3-statefile-tags.app}"
    key    = "${var.app_region}_${var.s3-statefile-tags.Name}/terraform.tfstate"
    region = var.app_region
    #dynamodb_table = "terraform_state_lock_${var.region}_${var.dynamodb-tags.Name}"
    } 
#     lock {
#     name = "LockID"
#     type = "dynamodb"
#   }
}    
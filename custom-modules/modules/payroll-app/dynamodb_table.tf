resource "aws_dynamodb_table" "payroll_db" {
    name            = "user_data"
    billing_mode    = "PAY_PER_REQUEST"
    hash_key        = "EmployeeID" 

    attribute {
      name = "EmployeeID"
      type = "N"
    }

    tags = var.dynamodb-tags
}

resource "aws_dynamodb_table" "db_statelocking_payroll_app" {
  name           = "terraform_state_lock_${var.app_region}_${var.dynamodb-tags.Name}"
  read_capacity  = 20
  write_capacity = 20
  hash_key = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
  tags = var.dynamodb-tags
}
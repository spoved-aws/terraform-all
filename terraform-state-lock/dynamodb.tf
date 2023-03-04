resource "aws_dynamodb_table" "tfstate_lock_db" {
    name            = "tfstate_lock_db"
    read_capacity   = 20
    write_capacity  = 20
    hash_key        = "LockID"

    attribute {
      name = "LockID"
      type = "S"
    }
}

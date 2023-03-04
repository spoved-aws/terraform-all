resource "aws_instance" "app_server" {
    ami             = var.ami
    instance_type   = "t2.micro"
    # tags            = {
    #     Name = "${var.app_region}-${var.ec2_tags.name}"
    # }
    tags = var.ec2-tags
    depends_on      = [
        aws_dynamodb_table.db_statelocking_payroll_app,
        aws_dynamodb_table.payroll_db,
        aws_s3_bucket.payroll_data,
        aws_s3_bucket.statefile_s3
    ]

}
resource "aws_network_interface_sg_attachment" "sg_attachment" {
  security_group_id    = var.sg_id
  network_interface_id = aws_instance.app_server.primary_network_interface_id
}



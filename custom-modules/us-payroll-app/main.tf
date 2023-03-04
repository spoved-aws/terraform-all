module "us-payroll" {
    source = "../modules/payroll-app"
    app_region = "us-west-2"
    ami = "ami-0ccdcd39fd69d0352"
    instance_type = "t2.micro"
    sg_id = "sg-0e02f8dd7e5463991"

    bucket_statefile = "s3-app01-statfile"

    #Define tags for the EC2 instance
    ec2-tags = {
        Name    = "us-payroll-app-01"
        Owner   = "us-kanu-khosla"
        app     = "payroll-app-01"
        component = "EC2"
    }

    s3-statefile-tags = {
        Name    = "us-payroll-app-01"
        Owner   = "us-kanu-khosla"
        app     = "payroll-app-01"
        component = "s3-statefile"

    }



    #Define tags for the S3 Bucket
    s3-tags = {
        Name    = "us-payroll-app-01"
        Owner   = "us-kanu-khosla"
        app     = "payroll-app-01"
        component = "s3"
    }

    dynamodb-tags = {
        Name    = "us-payroll-app-01"
        Owner   = "us-kanu-khosla"
        app     = "payroll-app-01"
        component = "dynamodb"
    }
}
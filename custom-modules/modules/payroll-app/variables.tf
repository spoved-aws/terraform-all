variable "app_region" {
    type = string
}

variable "bucket" {
    default = "company-payroll-alpha-2023"
}

variable "bucket_statefile" {
    type = string
}


variable "sg_id" {
    default = "company-payroll-alpha-2023"
}

variable "ami" {
    type = string
}

variable "instance_type" {
    type = string
}

variable "ec2-tags" {
    type = object({
        Name    = string
        Owner   = string
        app     = string
        component = string
    })
}

variable "s3-tags" {
    type = object({
        Name    = string
        Owner   = string
        app     = string
        component = string
    })
}

variable "s3-statefile-tags" {
    type = object({
        Name    = string
        Owner   = string
        app     = string
        component = string
    })
}

variable "dynamodb-tags" {
    type = object({
        Name    = string
        Owner   = string
        app     = string
        component = string
    })
}
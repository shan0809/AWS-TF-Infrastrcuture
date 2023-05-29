

# Single bucket

resource "aws_s3_bucket" "my_bucket" {
  bucket = "infrasity-s3-bucket"
  region = "us-east-1"
  acl = "private"
  versioning {
    enabled = true
  }
}


# Multiple buckets

resource "aws_s3_bucket" "my_buckets" {
  count = 3
  bucket = "infrasity-s3-${count.index}"
  acl = "private"
  versioning {
    enabled = true
  }
}



# using for each loop

variable "bucket_names" {
  type = set(string)
  default = ["infrasity1", "infrasity2"]
}

resource "aws_s3_bucket" "my_buckets" {
  for_each = var.bucket_names
  bucket = each.value

  acl = "private"
  versioning {
    enabled = true
  }
}


# another loop
resource "aws_s3_bucket" "my_buckets" {
  for_each = toset(["infrasity1", "infrasity2", "infrasity3", "infrasity4", "infrasity5"])
  bucket = each.key
  acl = "private"
  versioning {
    enabled = true
  }
}
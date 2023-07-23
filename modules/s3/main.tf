/*
resource "aws_s3_bucket" "cloud_school_bucket" {
  bucket = var.bucket_name
  tags = {
    Name        = "Cloud School Bucket"
    Environment = "Production"
  }
}


resource "aws_s3_bucket_ownership_controls" "example" {
  bucket = aws_s3_bucket.cloud_school_bucket.id
  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

resource "aws_s3_bucket_acl" "example" {
  depends_on = [aws_s3_bucket_ownership_controls.example]

  bucket = aws_s3_bucket.cloud_school_bucket.id
  acl    = "private"
}
*/
/*
resource "aws_s3_bucket_object" "delete_objects" {
  #bucket = "your-bucket-name"
  bucket = "bucketcloudschool"
  key = "*"  # delete all objects in bucket
  force_destroy = true
 depends_on = [bucket_name]  # Make sure the bucket is created before deleting the objects


}
*/
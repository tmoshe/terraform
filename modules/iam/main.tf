/*
resource "aws_iam_role" "s3_admin_role" {
  name           = "s3-admin-terraform"
  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "s3.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
EOF
}

resource "aws_iam_role_policy_attachment" "s3_admin_policy_attachment" {
  role       = aws_iam_role.s3_admin_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonS3FullAccess"
}
*/
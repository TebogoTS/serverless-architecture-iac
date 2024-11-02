resource "aws_s3_bucket" "element_converter" {
  bucket = "serverless-video-transcoded-tsm01"

  tags = {
    Name        = "Transcoded Videos"
    Environment = "Dev"
  }
}
provider "aws" {
  region = "us-east-2"
}

###Creating S3 bucket. Data will be loaded from local machine
resource "aws_s3_bucket" "stock_data_bucket" {
  bucket = "s3-stock-structured-data"
  acl    = "private"
  
  tags = {
    Environment = "Dev"
  }
}

###Uploading stock data from local folder
###Could try to use a loop but will keep simple for now
resource "aws_s3_bucket_object" "stock_data_all" {
  bucket = aws_s3_bucket.stock_data_bucket.id
  key    = "all_stocks_5yr.csv"
  source = "C:\Users\micha\OneDrive\Documents\AWS\ToS3\all_stocks_5yr.csv"
}

resource "aws_s3_bucket_object" "stock_data_aapl" {
  bucket = aws_s3_bucket.stock_data_bucket.id
  key    = "AAPL_data.csv"
  source = "C:\Users\micha\OneDrive\Documents\AWS\ToS3\AAPL_data.csv"
}
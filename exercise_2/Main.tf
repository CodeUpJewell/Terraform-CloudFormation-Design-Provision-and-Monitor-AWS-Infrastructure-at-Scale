# Creating IAM role so that Lambda service to assume the role and access other AWS services
provider "aws" {
region = "us-east-1"
access_key = "xxxxxx"
secret_key = "xxxxxx"
}

resource "aws_iam_role" "iam_for_lambda" {
  name = "iam_for_lambda"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "lambda.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}

resource "aws_lambda_function" "lambda" {
  function_name = "lambda_function_name_boboa_udacity"
  role          = "arn:aws:iam::510617822936:role/IamLambduht"
  handler       = "lambda.lambda_handler"
  runtime = "python3.9"
  environment {
    variables = {
      foo = "bar"
    }
  }
}
resource "aws_cloudwatch_log_group" "lambdalogs" {
  name = "/aws/lambda/lambda_function_name_boboa_udacity"
  retention_in_days = 7
}
}

data "aws_iam_policy" "administrator-policy" {
  arn = "arn:aws:iam::aws:policy/AdministratorAccess"
}

data "aws_iam_policy" "lambda-policy" {
  arn = "arn:aws:iam::aws:policy/AWSLambdaExecute"
}

data "aws_iam_policy" "elemental-policy" {
  arn = "arn:aws:iam::aws:policy/AWSElementalMediaConvertFullAccess"
}


resource "aws_iam_role" "lambda-upload-role" {
  name = "lambda_upload"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
        {
            Action = "sts:AssumeRole"
            Effect = "Allow"
            Sid = ""
            Principal = {
                Service = "lambda.amazonaws.com"
            }
        },
    ]
  })

  tags = {
    env = "dev"
  }
}

resource "aws_iam_role" "transcode-video-role" {
  name = "transcode-video"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
        {
            Action = "sts:AssumeRole"
            Effect = "Allow"
            Sid = ""
            Principal = {
                Service = "lambda.amazonaws.com"
            }
        },
    ]
  })

  tags = {
    env = "dev"
  }
}

resource "aws_iam_role_policy_attachment" "lambda-upload-attachement" {
  role = aws_iam_role.lambda-upload-role.name
  policy_arn = data.aws_iam_policy.administrator-policy.arn
}


resource "aws_iam_role_policy_attachment" "transcode-video-lambda-attachement" {
  role = aws_iam_role.transcode-video-role.name
  policy_arn = data.aws_iam_policy.lambda-policy.arn
}

resource "aws_iam_role_policy_attachment" "transcode-video-elemental-attachement" {
  role = aws_iam_role.transcode-video-role.name
  policy_arn = data.aws_iam_policy.elemental-policy.arn
}
# Serverless Video Transcoding System with AWS Lambda, S3, and MediaConvert

The inspiration for this project came from reading the book Serverless Architecture on AWS by Peter Sbarski, Yan Cui, and Ajay Nair. The book was a great read and helped me rethink my approach to AWS patterns. I spend most of my working time in the world of containers, so sometimes that's all I see! :)

While reading the book, I didn’t enjoy the sections where the solution was built through the AWS console—I was gearing up for a sports car but had to ride a bicycle to the garage (I hope that landed!). This project sets up the prerequisites and infrastructure for serverless architecture using Terraform.

## Prerequisites

- **AWS CLI**: Installed and configured with appropriate permissions.
- **Terraform**: Installed and configured.
- **AWS Account**: Necessary permissions to create S3 buckets, Lambda functions, IAM roles, and MediaConvert resources.

## Architecture Overview

1. **S3 Bucket**: Stores the original videos for processing and the transcoded output files.
2. **AWS Lambda**: Triggered upon file upload to the S3 bucket to start the transcoding process.
3. **AWS Elemental MediaConvert**: Converts videos into different formats based on defined job settings.

## Setup Guide

### 1. Clone the Repository

```bash
git clone https://github.com/TebogoTS/serverless-architecture-iac.git
cd serverless-architecture-iac
```

### 2. Update Variables (Optional)

You may customize the variables by editing the `variables.tf` file in the root directory to adjust settings like S3 bucket names, Lambda function names, and AWS region.

### 3. Initialize Terraform

Initialize Terraform to download required providers and prepare the environment:

```bash
terraform init
```

### 4. Review and Apply the Terraform Configuration

Review the Terraform plan to see the resources that will be created:

```bash
terraform plan
```

If everything looks good, apply the plan:

```bash
terraform apply
```

### 5. Verify Resources

Once applied, Terraform will create the following resources:
- An S3 bucket for uploading videos and storing the transcoded output.
- A Lambda function that triggers when a video is uploaded to the S3 bucket.
- IAM roles and policies for Lambda and MediaConvert permissions.
- A MediaConvert job template to handle the transcoding process.

### 6. Test the Video Transcoding System

1. **Upload a Video**: Upload a video file to the designated S3 bucket.
2. **Trigger the Process**: The Lambda function will automatically detect the new upload and initiate a MediaConvert job.
3. **Check Output**: Once transcoding is complete, the output files will be saved in the designated output bucket (configured in the MediaConvert settings).

### 7. Monitoring and Logging

- **CloudWatch Logs**: Logs from the Lambda function will be available in AWS CloudWatch for monitoring the process and debugging.

## Clean Up

To remove all resources created by this setup, run:

```bash
terraform destroy
```

### Notes

- Ensure that the IAM permissions are correctly configured to allow Lambda to initiate MediaConvert jobs and access S3 buckets.
- You may adjust the MediaConvert job template according to your specific video format and quality requirements.

---

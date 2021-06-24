#!/bin/bash
# Templates for docker repos are in their respective projects.

# First create VPC resources for Batch:
aws cloudformation create-stack --stack-name IntSiteCallerVPC --template-body file://VPC.yml  --profile=<your_profile> --region=us-east-1; aws cloudformation wait stack-update-complete --stack-name IntSiteCallerVPC
# Create S3 data, logging buckets:
aws cloudformation create-stack --stack-name IntSiteCallerBuckets --template-body file://BucketConfiguration.yml  --profile=<your_profile> --region=us-east-1 --capabilities CAPABILITY_NAMED_IAM CAPABILITY_AUTO_EXPAND CAPABILITY_IAM; aws cloudformation wait stack-update-complete --stack-name IntSiteCallerBuckets
# Configure Batch environment, Lustre
aws cloudformation create-stack --stack-name IntSiteCallerBatchConfiguration --template-body file://BatchConfiguration.yml  --profile=<your_profile> --region=us-east-1 --capabilities CAPABILITY_NAMED_IAM; aws cloudformation wait stack-update-complete --stack-name IntSiteCallerBatchConfiguration
# Create Cloudwatch dashboard:
aws cloudformation create-stack --stack-name IntSiteCallerPipelineDashboard --template-body file://Dashboard.yml  --profile=<your_profile> --region=us-east-1 --capabilities CAPABILITY_NAMED_IAM; aws cloudformation wait stack-update-complete --stack-name IntSiteCallerPipelineDashboard

# Next, create repositories and run build.sh for intSiteCaller, sesEmailHandler, and lambdaUploadHandler projects.
# Create ECR repositories (do this from within each of the above projects, see repository.yml for commands)

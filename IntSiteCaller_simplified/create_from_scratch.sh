#!/bin/bash
# Templates for docker repos are in their respective projects.
# aws cloudformation --region=us-east-1 --profile=jdoto-ab3 create-stack --stack-name CfnIntSiteCallerRepository --template-body file://repository.yml --capabilities CAPABILITY_NAMED_IAM  --output text;
# aws cloudformation create-stack --stack-name IntSiteCallerUploadHandlerECRRepository --template-body file://repository.yml  --profile=jdoto-ab3 --region=us-east-1
# aws cloudformation create-stack --stack-name IntSiteCallerReportECRRepository --template-body file://repository.yml  --profile=jdoto-ab3 --region=us-east-1

aws cloudformation create-stack --stack-name IntSiteCallerVPC --template-body file://VPC.yml  --profile=jdoto-ab3 --region=us-east-1;
aws cloudformation create-stack --stack-name IntSiteCallerBuckets --template-body file://BucketConfiguration.yml  --profile=jdoto-ab3 --region=us-east-1 --capabilities CAPABILITY_NAMED_IAM
aws cloudformation create-stack --stack-name IntSiteCallerBatchConfiguration --template-body file://BatchConfiguration.yml  --profile=jdoto-ab3 --region=us-east-1 --capabilities CAPABILITY_NAMED_IAM
aws cloudformation create-stack --stack-name IntSiteCallerPipelineDashboard --template-body file://Dashboard.yml  --profile=jdoto-ab3 --region=us-east-1 --capabilities CAPABILITY_NAMED_IAM


#!/bin/bash
# Templates for docker repos are in their respective projects.

aws cloudformation create-stack --stack-name IntSiteCallerVPC --template-body file://VPC.yml  --profile=jdoto-ab3 --region=us-east-1; aws cloudformation wait stack-update-complete --stack-name IntSiteCallerVPC
aws cloudformation create-stack --stack-name IntSiteCallerBuckets --template-body file://BucketConfiguration.yml  --profile=jdoto-ab3 --region=us-east-1 --capabilities CAPABILITY_NAMED_IAM CAPABILITY_AUTO_EXPAND CAPABILITY_IAM; aws cloudformation wait stack-update-complete --stack-name IntSiteCallerBuckets
aws cloudformation create-stack --stack-name IntSiteCallerBatchConfiguration --template-body file://BatchConfiguration.yml  --profile=jdoto-ab3 --region=us-east-1 --capabilities CAPABILITY_NAMED_IAM; aws cloudformation wait stack-update-complete --stack-name IntSiteCallerBatchConfiguration
aws cloudformation create-stack --stack-name IntSiteCallerPipelineDashboard --template-body file://Dashboard.yml  --profile=jdoto-ab3 --region=us-east-1 --capabilities CAPABILITY_NAMED_IAM; aws cloudformation wait stack-update-complete --stack-name IntSiteCallerPipelineDashboard


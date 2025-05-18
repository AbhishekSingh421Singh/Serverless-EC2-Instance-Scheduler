# Serverless-EC2-Instance-Scheduler

Serverless EC2 Instance Scheduler for Company Working Hours
In some companies, there is no need to run their EC2 instances 24/7; they require instances to operate during specific time periods, such as company working hours, from 8:00 AM in the morning to 5:00 PM in the evening. To address this scenario, I will implement two Lambda functions responsible for starting and stopping instances. These Lambda functions will be triggered by two CloudWatch Events in the morning and evening. This solution is fully serverless.

The tech stack for the project.

Cloud Infrastructure (AWS)
Amazon CloudWatch: Used for monitoring and triggering events.
AWS Lambda: Executes code in response to CloudWatch events.
Amazon EC2: Hosts applications or services.
Amazon S3: Stores the Terraform state file for infrastructure management.

CI/CD Pipeline
GitHub Actions: Automates the deployment process with the following Terraform steps:
terraform init
terraform plan
terraform apply
This setup enables automated infrastructure provisioning and management using Infrastructure as Code (IaC) with Terraform, integrated into a CI/CD pipeline.





Architecture diagram of the this project.
 



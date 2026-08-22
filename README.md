# Fullstack Task Tracker on AWS

This project is a simple fullstack task tracking application built with React on the frontend and an Express API on the backend. The app is designed as an AWS portfolio project to demonstrate infrastructure as code, secure networking, and cloud deployment patterns.

The live version was deployed using Terraform on AWS, with the frontend served from S3 through CloudFront and the backend running on ECS Fargate behind an Application Load Balancer.

## What the app does

The app allows a user to:

- create tasks
- view tasks in a list
- see task creation timestamps
- interact with a simple backend API

The frontend is a lightweight React app and the backend exposes a small API for task management.

## Project structure

- app/frontend: React frontend application
- app/backend: Express API and database connection setup
- infra/terraform: Terraform modules and environment definitions for AWS infrastructure

## AWS architecture

The live infrastructure is organized as follows:

- Frontend: served from an S3 bucket and distributed through CloudFront
- Backend: containerized API running on ECS Fargate
- Database: PostgreSQL running on Amazon RDS
- Networking: VPC, public and private subnets, security groups, and load balancer routing
- DNS and TLS: Route53 and ACM certificate for API access
- Secrets: database credentials stored in AWS Secrets Manager

### Frontend hosting

The frontend is deployed to S3 and delivered through CloudFront. This gives a fast, globally distributed static site while keeping the bucket private and restricting direct public access.

### Backend deployment

The backend API is packaged as a container and deployed to an ECS cluster using Fargate. The Application Load Balancer routes traffic to the container service, and health checks ensure the service stays healthy.

### Database layer

The app uses PostgreSQL in RDS. The database is provisioned inside the private networking layer to keep it away from direct public exposure.

## Terraform setup

The Terraform code in infra/terraform is organized into modules and an environment definition.

The environment configuration wires together:

- networking
- security groups
- database
- secrets
- ECS compute layer
- DNS and certificate setup
- frontend hosting

This is a good example of modular infrastructure in Terraform, where each service is managed as a separate component and then composed into a single environment.

The main deployment flow is:

- create the VPC and networking components
- create security groups and database resources
- store the database password in Secrets Manager
- build and deploy the backend container to ECS
- serve the frontend from S3 via CloudFront
- configure DNS and the API certificate

## Security measures implemented on AWS

Several security controls are included in the infrastructure:

- Private database networking: the database is placed in private subnets instead of public subnets
- Security groups: access is restricted to only the required ports and services
- Least privilege IAM roles: task execution roles are limited to the permissions they need
- Secrets Manager: database credentials are not hardcoded in code or committed to git
- S3 bucket public access blocked: the frontend bucket is protected and CloudFront uses an origin access control to fetch content safely
- CloudFront OAC: the frontend is accessed through CloudFront without exposing the S3 bucket publicly
- TLS/HTTPS: HTTPS is used for the frontend and backend traffic path
- Encryption at rest: S3 and RDS storage is configured with encryption
- CloudWatch logging: application logs are pushed to CloudWatch for visibility
- Health checks: the ECS target group includes API health checks

## Local development

To work locally, the frontend and backend can be run on a development machine instead of the AWS deployment.

Example flow:

- frontend: npm run dev
- backend: npm run dev
- local database: PostgreSQL on localhost
- frontend env: VITE_API_BASE_URL=http://localhost:4000/api
- backend env: CORS_ORIGIN=http://localhost:5173

This allows frontend changes to be tested locally before redeploying to AWS.

## Notes

This project is intentionally simple and portfolio-focused. The goal is to demonstrate a real AWS deployment pattern using Terraform while keeping the application understandable and maintainable.

## Future improvements

Possible next steps include:

- adding task update and delete actions
- improving the UI styling
- adding CI/CD deployment automation
- adding more AWS monitoring and alerting
- adding a production-ready deployment workflow

## Summary

This project demonstrates a fullstack app deployed to AWS using Terraform, with a secure multi-layer architecture built around:

- React frontend
- Express backend
- PostgreSQL database
- ECS Fargate compute
- S3 + CloudFront frontend hosting
- IAM, networking, secrets, and monitoring controls

It is a practical example of how a small application can be deployed in a cloud-native architecture with security and infrastructure automation in mind.

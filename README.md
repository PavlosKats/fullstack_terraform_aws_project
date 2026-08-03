Fullstack Task Tracker on AWS with Terraform
Portfolio project and learning journey to build a secure fullstack app.

Tech Stack
Frontend: React.js, S3, CloudFront
Backend: ECS Fargate (default) or EC2
Database: RDS PostgreSQL
Secrets: AWS Secrets Manager / SSM Parameter Store
DNS: Route53
Monitoring: CloudWatch
Infrastructure as Code: Terraform
Goals
Keep architecture simple and production-minded
Demonstrate DevSecOps practices
Build in structured milestones with clean version control checkpoints
Initial Structure
app/frontend
app/backend
infra/terraform
docs
.github/workflows
DevSecOps Baseline
Least privilege IAM
Private networking for backend and database
Secrets never committed to git
Encryption at rest and in transit
Logging and alerting from day one
Milestone Plan
Repo structure and baseline docs
Backend API skeleton
Frontend React skeleton
Terraform network and security foundation
Database and secrets integration
Compute deployment
Frontend hosting and DNS
Monitoring, hardening, and CI/CD

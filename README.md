# Terraform + Ansible Automated Docker Deployment on AWS

This project demonstrates a fully automated infrastructure deployment workflow using Terraform, Ansible, Docker, and GitHub Actions. The goal is to provision an EC2 instance on AWS, install Docker using Ansible, and deploy a sample web application inside a Docker container—all triggered automatically through a GitHub Actions pipeline.

---

## Architecture Overview

GitHub Actions (CI/CD)
|
v
+---------------------------+
| Terraform (Provision EC2)|
+---------------------------+
|
v
+---------------------------+
| Ansible (Install Docker) |
+---------------------------+
|
v
+---------------------------+
| EC2 (Ubuntu) |
| - Docker installed |
| - Web App deployed |
+---------------------------+

---

## Tools Used

- **Terraform**: Used for provisioning the AWS EC2 infrastructure.
- **Ansible**: Handles configuration management, specifically Docker installation and app deployment.
- **Docker**: Container engine to run a lightweight web server (e.g., Nginx).
- **GitHub Actions**: Orchestrates the CI/CD workflow to trigger everything on code push.

---

## How It Works

1. A push to the `main` branch triggers the GitHub Actions workflow.
2. Terraform provisions an EC2 instance with the correct security group and key pair.
3. The instance's public IP is retrieved and passed to Ansible.
4. Ansible connects to the instance using SSH, installs Docker, and starts the containerized web app.
5. The deployed application becomes accessible using the EC2 public IP.

---

## Project Structure

.
├── .github/workflows/
│ └── deploy.yml # GitHub Actions pipeline
├── terraform-ec2-docker/
│ ├── main.tf # Main Terraform config
│ ├── variables.tf # Terraform variables
│ ├── outputs.tf # Terraform outputs
│ └── security.tf # Security groups
├── ansible-ec2-docker/
│ ├── hosts.ini # Ansible inventory
│ ├── install-docker.yml # Playbook for Docker install
│ └── my-website/ # Sample HTML website
└── README.md


---

## GitHub Secrets Configuration

Set the following repository secrets under GitHub → Settings → Secrets and variables → Actions:

- `AWS_ACCESS_KEY_ID` – your AWS access key ID
- `AWS_SECRET_ACCESS_KEY` – your AWS secret key
- `SSH_PRIVATE_KEY` – contents of your `.pem` private key (include full block: `-----BEGIN PRIVATE KEY----- ...`)

---

## Deployment Instructions

After setup, deployment is fully automated. Just push to the `main` branch:

```bash
git add .
git commit -m "Trigger deployment"
git push origin main

Output
After a successful deployment, Terraform will output the public IP of the EC2 instance. You can open it in a browser to view the running web application:



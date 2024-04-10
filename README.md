# WordPress on AWS using Terraform

This project automates the deployment of a WordPress application on Amazon Web Services (AWS) using Terraform.

## Project Structure

The project is organized into the following modules:

- `mysql-db`: Provisions an Amazon RDS (Relational Database Service) instance to host the WordPress database.
- `wordpress-app`: Deploys an Amazon EC2 (Elastic Compute Cloud) instance and configures it to run the WordPress application, connecting it to the RDS instance.
- `wordpress-site`: Orchestrates the deployment of the WordPress application by using the `wordpress-app` and `mysql-db` modules.

## Prerequisites

1. **AWS Account**: You'll need an AWS account with the necessary permissions to create and manage the required resources.
2. **Terraform**: Ensure that you have Terraform installed on your local machine. You can download it from the official [Terraform website](https://www.terraform.io/downloads.html).
3. **AWS CLI**: Install the AWS Command Line Interface (CLI) on your local machine to interact with your AWS account. You can find the installation instructions [here](https://docs.aws.amazon.com/cli/latest/userguide/cli-chap-install.html).

## Getting Started

1. Clone the repository to your local machine:
    
    `git clone https://github.com/Rania193/terraform-wordpress-on-ec2-rds`
    
2. Navigate to the `wordpress-site` directory:
    
    `cd terraform-wordpress-on-ec2-rds/wordpress-site`
    
3. Initialize Terraform:
    
    
    `terraform init`
    
4. Review and modify the variables in the `variables.tf` file as needed (e.g., database credentials, EC2 instance type, etc.).
5. Apply the Terraform configuration to provision the resources:
    
    
    `terraform apply`
    
    This will create the necessary resources, including the EC2 instance running the WordPress application and the RDS instance hosting the database.
6. Once the deployment is complete, you can access the WordPress application using the public IP address of the EC2 instance, which is provided as an output of the Terraform execution.

## Cleanup

To remove all the resources created by this project, run the following command in the `wordpress-site` directory:


`terraform destroy`

This will delete all the resources provisioned by the Terraform configuration, including the EC2 instance, RDS instance, and related resources.

---

# Terraform AWS Deployment for Custom VPC and EC2 Instances

This project demonstrates how to use Terraform to deploy a custom VPC and two EC2 instances on AWS. The infrastructure includes networking components such as VPC, subnets, route tables, and security groups. Additionally, it dynamically creates an SSH key pair for connecting to the EC2 instances.

## Terraform Configuration

The Terraform configuration files are organized into different modules for clarity and maintainability:

- **network.tf**: Defines the VPC and its associated components such as subnets, route tables, and internet gateways.
- **ssh.tf**: Dynamically generates an SSH key pair that can be used for accessing the EC2 instances securely.
- **security_groups.tf**: Defines security groups to control inbound and outbound traffic to the EC2 instances.
- **ec2.tf**: Deploys two EC2 instances, one in the public subnet and another in the private subnet. Configures the instances with the appropriate security groups and key pairs.

## Jenkins Integration

This project is integrated with Jenkins pipelines to automate Terraform deployments. The `Jenkinsfile` contains the pipeline script for executing Terraform commands such as plan and apply.

### Pipeline Steps

1. **Clone Repository**: Jenkins pipeline clones the repository containing Terraform configuration files.
2. **Terraform Init**: Initializes Terraform in the workspace.
3. **Terraform Plan**: Generates an execution plan for Terraform changes.
4. **Terraform Apply / Destroy**: Depending on the selected action (`apply` or `destroy`), it initializes Terraform, generates a plan, and then applies or destroys the infrastructure with auto-approval.

### Usage

1. Trigger the Jenkins pipeline and select the desired action (`apply` or `destroy`) as a parameter.
2. Jenkins will automatically execute the Terraform commands based on the selected action.

## Cleanup

To clean up the deployed resources, you can use the following Terraform command:
   ```bash
   terraform destroy
   ```

## Additional Notes

- Ensure that Jenkins is configured with appropriate credentials and permissions to execute Terraform commands.
- Review the Terraform configuration files carefully before applying changes to avoid any unintended modifications.

---

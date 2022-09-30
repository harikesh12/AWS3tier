What all resources is required for creating 3 tier architecture
 1-Cutome VPC
 2-2 subnet(Public)
 3- 1 Subnet Private
 4- 2 Ec2 instances
 5- Security group
 6- Elastic IP
 7 - NAT Gateway
 8- Internet Gateway
 8- Route table
 9- Application load balancer
 10 - Apache Server
 11- MySQL DB
 
 Jenkins Script to automate infra-->
 
 pipeline {
    agent any

    stages {
        stage('checkout') {
            steps {
                checkout([$class: 'GitSCM', branches: [[name: '*/master']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/harikesh12/AWS3tier.git']]])
            }
        }
        stage('Terraform Init'){
            steps{
                sh("terraform init");
            }
        }
        
        stage('Terraform action'){
            steps{
                echo "Terraform is taking ${action}"
                sh("terraform ${action} --auto-approve");
            }
        }
    }
}

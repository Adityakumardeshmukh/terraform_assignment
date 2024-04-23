pipeline {
    agent any
    
    environment {
        AWS_DEFAULT_REGION = 'ap-south-1'
    }
    
    stages {
        stage('Checkout') {
            steps {
                git 'https://github.com/your-repo/terraform.git'
            }
        }
        
        stage('Terraform Init') {
            steps {
                script {
                    sh 'terraform init'
                }
            }
        }
        
        stage('Terraform Plan') {
            steps {
                script {
                    sh 'terraform plan -out=tfplan'
                }
            }
        }
        
        stage('Terraform Apply') {
            steps {
                script {
                    sh 'terraform apply -auto-approve tfplan'
                }
            }
        }
        
        stage('Retrieve Public IP') {
            steps {
                script {
                    def publicIp = sh(script: 'terraform output public_ip', returnStdout: true).trim()
                    echo "Public IP Address: $publicIp"
                }
            }
        }
    }
    
    post {
        always {
            script {
                sh 'terraform destroy -auto-approve'
            }
        }
    }
}

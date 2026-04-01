pipeline {
    agent any
 
    parameters {
        choice(name: 'ACTION', choices: ['apply', 'destroy'], description: 'Terraform Action')
        string(name: 'INSTANCE_TYPE', defaultValue: 't3.micro', description: 'EC2 Instance Type')
    }
 
    environment {
        AWS_DEFAULT_REGION = 'ap-south-1'
    }
 
    stages {
 
        stage('Checkout Code') {
            steps {
                git branch: 'main', url: 'https://github.com/jenasangita097-afk/AWS-EC2Terraform-Jenkins.git'
            }
       }
 
        stage('Terraform Init') {
            steps {
                sh 'terraform init'
            }
        }
 
        stage('Terraform Plan') {
            steps {
                sh "terraform plan -var='instance_type=${params.INSTANCE_TYPE}'"
            }
        }
 
        stage('Terraform Apply') {
            when {
                expression { params.ACTION == 'apply' }
            }
            steps {
                withCredentials([usernamePassword(credentialsId: 'aws-creds',
                usernameVariable: 'AWS_ACCESS_KEY_ID',
                passwordVariable: 'AWS_SECRET_ACCESS_KEY')]) {
 
                    sh "terraform apply -auto-approve -var='instance_type=${params.INSTANCE_TYPE}'"
                }
            }
        }
 
        stage('Terraform Destroy') {
            when {
                expression { params.ACTION == 'destroy' }
            }
            steps {
                withCredentials([usernamePassword(credentialsId: 'aws-creds',
                usernameVariable: 'AWS_ACCESS_KEY_ID',
                passwordVariable: 'AWS_SECRET_ACCESS_KEY')]) {
 
                    sh 'terraform destroy -auto-approve'
                }
            }
        }
 
        stage('Show Outputs') {
            steps {
                sh 'terraform output'
            }
        }
    }
}

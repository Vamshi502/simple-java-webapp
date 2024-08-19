pipeline {
    agent any
    tools {
        jdk 'jdk11'
        maven 'maven3'
    }
    environment {
        SCANNER_HOME= tool 'sonar-scanner'
    }
    stages {
        stage('Git Checkout') {
            steps {
               git branch: 'main', changelog: false, poll: false, url: 'https://github.com/Vamshi502/SampleCode-ekart.git'
            }
        }
         stage('Compile') {
            steps {
               sh "mvn clean compile"
            }
        }
       
         stage('Build & Docker push image') {
            steps {
                script{
                    withDockerRegistry(credentialsId: 'sai', toolName: 'docker') {
                        sh "docker build -t shopping:latest -f docker/Dockerfile ."
                        sh "docker tag shopping:latest vamshi5022/shppping:latest"
                        sh "docker push vamshi5022/shppping:latest"
                    }
                }
               
            }
        }
         
    }
}
     

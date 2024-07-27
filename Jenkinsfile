pipeline {
    agent any
    stages {
        stage('clone/checkout') {
            steps {
               git branch: 'main', url: 'https://github.com/Vamshi502/simple-java-webapp.git'
            }
        }
        stage('mvn compile'){
            steps {
                sh 'mvn compile'
            }
        }
        stage('mvn test'){
            steps {
                sh 'mvn test'
            }
        }
        stage('mvn package'){
            steps {
                sh 'mvn package'
            }
        }
        stage('build'){
            steps {
                sh 'mvn clean install'
            }
        }
        stage('create the image'){
            steps {
                sh 'docker build -t javaapp1 .'
            }
        }
        stage('push the image into docker-hub'){
            steps {
             script {
                 withDockerRegistry(credentialsId: 'docker-hub'){
                     sh 'docker tag javaapp1 vamshi5022/samplejavacode:v1'
                     sh 'docker push vamshi5022/samplejavacode:v1'
                    }
                }
            }
        }
        stage('deploy the project'){
            steps {
                sh 'docker run --name con5 -d -p 9998:8080 vamshi5022/samplejavacode:v1 '
            }
        }
        
    }
      
}

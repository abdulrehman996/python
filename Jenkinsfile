pipeline {
    agent any
    
    stages {
        stage('Run Docker Container') {
            steps {
                // Run the Docker container
                sh 'docker stop pycontainer'
                sh 'docker build -t python:latest --build-arg CONTAINER_NAME=pycontainer .'
                sh 'docker run -d  -p 3456:3456 python:latest'

            }
        }
    }
}

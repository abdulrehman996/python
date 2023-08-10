pipeline {
    agent any
    
    stages {
        stage('Run Docker Container') {
            steps {
                // Run the Docker container
                sh 'docker build -t python:latest .'
                sh 'docker run -d  -p 3456:3456 python:latest'

            }
        }
    }
}

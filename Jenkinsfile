pipeline {
    agent any
    
    stages {

        stage('Cleanup') {
                    steps {
                        post {
                            always {
                                // Clean up by stopping and removing the container
                                script {
                                    try {
                                        sh 'docker stop $(docker ps -q --filter ancestor=python:latest)'
                                        sh 'docker rm $(docker ps -aq --filter ancestor=python:latest)'
                                    } catch (Exception e) {
                                        // Ignore errors during cleanup
                                    }
                                }
                            }
                        }
                    }
                }

        
        stage('Run Docker Container') {
            steps {
                // Run the Docker container
                sh 'docker build -t python:latest .'
                sh 'docker run -d -p 3456:3456 python:latest'
            }
        }
    }
}

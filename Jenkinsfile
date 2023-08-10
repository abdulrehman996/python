pipeline {
    agent any
    
    stages {        
        stage('Run Docker Container') {
            steps {
                // Build the Docker image with the container name
                sh 'docker build -t python:latest -f Dockerfile --build-arg CONTAINER_NAME=pythoncontainer .'

                // Check if the container is already running
                script {
                    try {
                        def isRunning = sh(
                            script: 'docker inspect -f \'{{.State.Running}}\' pythoncontainer || true',
                            returnStatus: true
                        ).trim()

                        if (isRunning == 'true') {
                            // Stop the existing container
                            sh 'docker stop pythoncontainer'
                        }
                    } catch (Exception e) {
                        echo "Error checking container status: ${e.message}"
                    }
                }

                // Run the Docker container
                try {
                    sh 'docker run -d -p 3456:3456 --name pythoncontainer python:latest'
                } catch (Exception e) {
                    echo "Error running Docker container: ${e.message}"
                    currentBuild.result = 'FAILURE'
                }
            }
        }
    }
}






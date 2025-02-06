pipeline {
    agent any  // กำหนดว่า pipeline นี้สามารถทำงานได้บน agent ใด ๆ

    environment {
        DOCKER_IMAGE = "your-docker-repo/your-app:${GIT_COMMIT}"  // กำหนดชื่อ Docker image
        REGISTRY = "docker.io"  // ระบุ registry ที่ใช้สำหรับ push Docker image
    }

    stages {
        stage('Checkout') {
            steps {
                // Checkout code from the repository
                checkout scm
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    // Build the Docker image
                    sh "docker build -t ${DOCKER_IMAGE} ."
                }
            }
        }

        stage('Push Docker Image') {
            steps {
                script {
                    // Login to Docker registry
                    sh "docker login -u ${DOCKER_USERNAME} -p ${DOCKER_PASSWORD} ${REGISTRY}"
                    
                    // Push the Docker image to the registry
                    sh "docker push ${DOCKER_IMAGE}"
                }
            }
        }

        stage('Deploy to Production') {
            steps {
                script {
                    // Deploy Docker container to Production server using SSH
                    sh "ssh -i /path/to/your/private/key user@your-docker-server 'docker pull ${DOCKER_IMAGE} && docker-compose up -d'"
                }
            }
        }
    }

    post {
        always {
            cleanWs()  // เคลียร์ workspace หลังการทำงานทุกครั้ง
        }
    }
}

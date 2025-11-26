pipeline {
    agent any

    environment {
        IMAGE_NAME      = "harikiran50612/canvas-board"
        IMAGE_TAG       = "latest"
        DOCKERHUB_CREDS = credentials('dockerhub-creds')
    }

    stages {
        stage('Clone Repo') {
            steps {
               
                git branch: 'main',
                    url: 'https://github.com/harikiran713/canvas-drawing-board.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                bat """
                docker build -t %IMAGE_NAME%:%IMAGE_TAG% .
                """
            }
        }

        stage('Docker Login') {
            steps {
                bat """
                docker login -u %DOCKERHUB_CREDS_USR% -p %DOCKERHUB_CREDS_PSW%
                """
            }
        }

        stage('Push to Docker Hub') {
            steps {
                bat """
                docker push %IMAGE_NAME%:%IMAGE_TAG%
                """
            }
        }
    }
}

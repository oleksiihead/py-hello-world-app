pipeline {
    environment {
        USERNAME = "oleksiihead"
        APP_NAME = "py-hello-world-app"
        DOCKER_NAME = "${DOCKERHUB_USERNAME}/${APP_NAME}:${BUILD_ID}"
        DOCKER_IMAGE = ''
    }

    agent any

    stages {
        stage('Clone GitHub repo') {
            steps {
                git credentialsId: 'GitHub-jenkins-token', url: "https://github.com/${USERNAME}/${APP_NAME}"
            }
        }

        stage('Build Docker image') {
            steps {
                script {
                    DOCKER_IMAGE = docker.build DOCKER_NAME
                }
            }
        }

        stage('Deploy docker image to DockerHub') {
            steps {
                script {
                    docker.withRegistry('', 'dockerhub-oleksiihead')
                    dockerImage.push()
                }
            }
        }
    }
}

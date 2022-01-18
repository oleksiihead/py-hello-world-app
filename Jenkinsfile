pipeline {
    environment {
        USERNAME = "oleksiihead"
        APP_NAME = "py-hello-world-app"
        IMAGE_NAME = "${USERNAME}/${APP_NAME}:${BUILD_ID}"
        DOCKER_IMAGE = ''
    }

    agent any

    stages {
        stage('Clone GitHub repo') {
            steps {
                git branch: 'main', credentialsId: 'GitHub-jenkins-token', url: "https://github.com/${USERNAME}/${APP_NAME}"
//                git([url: 'https://github.com/${USERNAME}/${APP_NAME}', credentialsId: 'GitHub-jenkins-token'])
            }
        }

        stage('Build Docker image') {
            steps {
                script {
                    DOCKER_IMAGE = docker.build IMAGE_NAME
                }
            }
        }

        stage('Deploy docker image to DockerHub') {
            steps {
                script {
                    docker.withRegistry('', 'dockerhub-oleksiihead') {
                        dockerImage.push()
                    }
                }
            }
        }
    }
}

pipeline {
    agent any

    tools {
        maven 'localMaven'
    }

    stages{
        stage('Build'){
            steps {
                sh 'mvn clean package'
            }
            post {
                success {
                    echo 'Now Archiving...'
                    archiveArtifacts artifacts: '**/target/*.war'
                }
            }
        }
        stage ('Deploy to Staging') {
            steps {
                timeout(time:5, unit:'DAYS') {
                    input message: 'Approve Stage Deployment?'
                }
                build job: 'deploy-to-staging'
            }
            post {
                success {
                    echo 'Code to deploy to Stage.'
                }
                failure {
                    echo 'Deployment failed.'
                }
            }

        }
    }
}
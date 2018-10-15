pipeline {
    agent any
    stages {
        stage ('Build') {
            steps {
                sh 'mvn clean package'
            }
            post {
                success {
                    echo 'Now Archiving...'
                    archiveArtifacts artifacts: '**/*.war'
                }
            }
        }
        stage ('Deploy to Staging') {
            steps {
                build job: 'deploy-to-stage'
            }
        }

        stage ('Deploy to Production') {
            steps {
                timeout (time:5, unit:'DAYS') {
                    input message: 'Approve PRODUCTION Deployment?'
                }
                build job: 'deploy-to-prod'
            }
            post {
                success {
                    echo 'Code Deployed to Production'
                }
                failure {
                    echo 'Deployment Failed'
                }
            }
        }
    }
}

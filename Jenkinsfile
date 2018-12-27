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
        stage('Deploy to Staging'){
            steps {
                build job: 'deploy-to-staging'
            }
        }
        stage('Deploy to Production'){
            steps {
                timeout(time:1, unit:'DAYS'){
                    input message:'Approve production build?'
                }
                build job: 'deploy-to-prod'
            }
            post {
                success {
                    echo 'Code deployed to production'
                }
                failure {
                    echo 'Deployment failed'
                }
            }
        }
    }
}

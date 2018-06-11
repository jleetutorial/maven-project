pipeline {
    agent any
    tools {
        maven 'localMaven'
    }

    stages {
        stage ('Build'){
            steps {
                sh 'mvn clean package'
            }
            post {
                success {
                    echo 'Now Archiving...'
                   archiveArtifacts '**/*.war'

                }
            }
        }
        stage ('deploy-to-staging'){
            steps {
                build job: 'deploy-to-staging'
            }
        }
    }
}

















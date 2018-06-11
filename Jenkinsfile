pipeline {
    agent any
    tools {
        maven 'localMaven'
    }

    parameters {
        string(name: 'tomcat_dev', defaultValue: '35.234.145.143', description: 'Staging server')
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

















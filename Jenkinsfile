pipeline {
    agent any
    stages{
        stage ('Build Package'){
            steps {
                build job: 'package'
            }
            steps ('first jenkins job'){
                build job: 'first-jenkins-job'
            }
            post {
                success {
                    echo 'Pipeline is ok'
                }
            }
            
                }
        }
    }

pipeline {
    agent any
    stages{
        stage ('Build Package'){
            steps {
                build job: 'package'
            }
        }
            stage ('first jenkins job'){
                steps {
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

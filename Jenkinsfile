pipeline {
    agent any
    stages{
        stage('Build Package'){
            steps {
                build job: 'package'
            }
            
                }
        }
        stage('Test'){
            steps {
               build job: 'static analysis'
            }
        }
    }

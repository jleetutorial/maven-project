pipeline {
    agent any
    stages{
        stage('Build Package'){
            steps {
                build job: 'package'
            }
            
                }
        }
        stage ('Deploy to Staging'){
            steps {
               echo '... Deploiement effectué avec succès ...'
            }
        }
    }
}

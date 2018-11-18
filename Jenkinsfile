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
        
        
        stage ('Deploy'){
        if(env.BRANCH_NAME == 'develop'){
            steps {
                build job: 'Deploy-to-staging'
            }
        }
        
            if(env.BRANCH_NAME == 'master'){

         steps{
                timeout(time:5, unit:'DAYS'){
                    input message:'Approve PRODUCTION Deployment?'
                }

                build job: 'Deploy-to-Production'
            }
            }
            post {
                success {
                    echo 'Code deployed to Production.'
                }

                failure {
                    echo ' Deployment failed.'
                }
            }
        }


    }
}

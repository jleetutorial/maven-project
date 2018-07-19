
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

        stage('Deploy to staging'){
        	steps{
        		build job: 'Deploy-to-Staging'
        	}
        }

        stage('Deploy to Production'){
        	steps{
        		timeout(time:5, unit:'DAYS'){
        			input message : 'Approve for the production Deployment'
        		}

        		build job: 'Deploy-to-Prod'
        	}
        	post {
                success {
                    echo 'Deployment to Production success'
                }

                error{
					echo 'Deployment to Production failed'
                }
            }
        }
    
    }
}
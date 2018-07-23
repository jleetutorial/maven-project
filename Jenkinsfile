
pipeline {

    agent any

    stages{

        stage('Build'){

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

        stage ('Deploy to Staging'){

            steps {

                build job: 'deploy-to-staging'

            }

        }



        stage ('Deploy to Production'){

            steps{

                timeout(time:5, unit:'DAYS'){

                    input message:'Approve PRODUCTION Deployment?'

                }



                build job: 'deploy-to-prod'

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
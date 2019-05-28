pipeline {

    agent any
	
	parameters {
         string(name: 'tomcat_dev', defaultValue: 'http://localhost:8282/', description: 'Staging Server')
         string(name: 'tomcat_prod', defaultValue: 'http://localhost:8282/', description: 'Production Server')
    }

    tools {
        maven 'LocalMaven'
    }

    stages{

        stage('Build'){

            steps {

                bat 'mvn clean package'

            }

            post {

                success {

                    echo 'Now Archiving...'

                    archiveArtifacts artifacts: '**/target/*.war'

                }

            }

        }

        stage ('Deploy to Staging'){

            steps {

                sh "scp -i /home/jenkins/tomcat-demo.pem **/target/*.war ec2-user@${params.tomcat_dev}:/var/lib/tomcat7/webapps"

            }

        }



        stage ('Deploy to Production'){

            steps{

                timeout(time:5, unit:'DAYS'){

                    input message:'Approve PRODUCTION Deployment?'

                }



                 sh "scp -i /home/jenkins/tomcat-demo.pem **/target/*.war ec2-user@${params.tomcat_prod}:/var/lib/tomcat7/webapps"

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
pipeline {
    agent any

    parameters {
         string(name: 'tomcat_dev', defaultValue: '35.174.106.85', description: 'Staging Server')
         string(name: 'tomcat_prod', defaultValue: '52.87.158.132', description: 'Production Server')
    }

    triggers {
         pollSCM('* * * * *')
     }

	tools {
	maven 'localMaven' //This was missing in original jenkinsfile

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

        stage ('Deployments'){
            parallel{
                stage ('Deploy to Staging'){
                    steps {
<<<<<<< HEAD
<<<<<<< HEAD
                        bat "pscp -i C:/Users/shres/jenkins/NorthVirgina.ppk **/target/*.war ec2-user@${params.tomcat_dev}:/var/lib/tomcat7/webapps"
=======
                        sh "scp -i C:/Users/shres/jenkins/NorthVirgina.pem **/target/*.war ec2-user@${params.tomcat_dev}:/var/lib/tomcat7/webapps"
>>>>>>> dba78354150fce4f7a78f27e4f7cf488d2fa1d71
=======
                        sh "scp -i C:/Users/shres/jenkins/NorthVirgina.pem **/target/*.war ec2-user@${params.tomcat_dev}:/var/lib/tomcat7/webapps"
>>>>>>> dba78354150fce4f7a78f27e4f7cf488d2fa1d71
                    }
                }

                stage ("Deploy to Production"){
                    steps {
<<<<<<< HEAD
<<<<<<< HEAD
                        bat "pscp -i C:/Users/shres/jenkins/NorthVirgina.ppk **/target/*.war ec2-user@${params.tomcat_prod}:/var/lib/tomcat7/webapps"
=======
                        sh "scp -i C:/Users/shres/jenkins/NorthVirgina.pem **/target/*.war ec2-user@${params.tomcat_prod}:/var/lib/tomcat7/webapps"
>>>>>>> dba78354150fce4f7a78f27e4f7cf488d2fa1d71
=======
                        sh "scp -i C:/Users/shres/jenkins/NorthVirgina.pem **/target/*.war ec2-user@${params.tomcat_prod}:/var/lib/tomcat7/webapps"
>>>>>>> dba78354150fce4f7a78f27e4f7cf488d2fa1d71
                    }
                }
            }
        }
    }
}

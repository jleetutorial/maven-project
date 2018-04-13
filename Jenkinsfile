pipeline {
    agent any

    parameters {
         string(name: 'tomcat_dev', defaultValue: '34.227.106.51', description: 'Staging Server')
         string(name: 'tomcat_prod', defaultValue: '54.157.253.255', description: 'Production Server')
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
                bat 'mvn clean package'
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
                        bat "echo y | pscp -i C:\Users\shres\jenkins\NorthVirgina.ppk C:/Program Files (x86)/Jenkins/workspace/FullyAutomated/webapp/target/*.war ec2-user@${params.tomcat_dev}:/var/lib/tomcat7/webapps"
=======
                        bat "echo y | pscp -i C:/Users/shres/jenkins/NorthVirgina.pem C:/Program Files (x86)/Jenkins/workspace/FullyAutomated/webapp/target/*.war ec2-user@${params.tomcat_dev}:/var/lib/tomcat7/webapps"
>>>>>>> parent of 8ba2f33... ppk
                    }
                }

                stage ("Deploy to Production"){
                    steps {
<<<<<<< HEAD
                        bat "echo y | pscp -i C:\Users\shres\jenkins\NorthVirgina.ppk C:/Program Files (x86)/Jenkins/workspace/FullyAutomated/webapp/target/*.war ec2-user@${params.tomcat_prod}:/var/lib/tomcat7/webapps"
=======
                        bat "echo y | pscp -i C:/Users/shres/jenkins/NorthVirgina.pem C:/Program Files (x86)/Jenkins/workspace/FullyAutomated/webapp/target/*.war ec2-user@${params.tomcat_prod}:/var/lib/tomcat7/webapps"
>>>>>>> parent of 8ba2f33... ppk
                    }
                }
            }
        }
    }
}

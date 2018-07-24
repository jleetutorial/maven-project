pipeline {

    agent any

    tools {
        maven 'LocalMaven'
    }

    parameters { 
         string(name: 'tomcat_dev', defaultValue: 'http://localhost:8090', description: 'Staging Server')
         string(name: 'tomcat_prod', defaultValue: 'http://localhost:9090', description: 'Production Server')
    } 
 
    triggers {
         pollSCM('* * * * *') // Polling Source Control
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
                        bat "C:\Program Files (x86)\WinSCP\WinSCP.exe -i /home/jenkins/tomcat-demo.pem **/target/*.war ec2-user@${params.tomcat_dev}:/var/lib/tomcat7/webapps"
                    }
                }
 
                stage ("Deploy to Production"){
                    steps {
                        bat "C:\Program Files (x86)\WinSCP\WinSCP.exe -i /home/jenkins/tomcat-demo.pem **/target/*.war ec2-user@${params.tomcat_prod}:/var/lib/tomcat7/webapps"
                    }
                }
            }
        }
    }
}
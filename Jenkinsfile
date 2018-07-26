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
                         bat "net use http://localhost:8090/var/lib/tomcat7/webapps tomcat /USER:tomcat"
			 bat "copy **/target/*.war http://localhost:8090/var/lib/tomcat7/webapps"
                    }
                }
 
                stage ("Deploy to Production"){
                    steps {
                        bat "net use http://localhost:8090/var/lib/tomcat7/webapps tomcat /USER:tomcat"
			bat "copy **/target/*.war http://localhost:9090/var/lib/tomcat7/webapps"
                    }
                }
            }
        }
    }
}
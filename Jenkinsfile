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
			 bat "copy **/target/*.war C:\Users\Xadmin\Documents\apache-tomcat-8.5.32-staging\webapps"
                    }
                }
 
                stage ("Deploy to Production"){
                    steps {
			bat "copy **/target/*.war C:\Users\Xadmin\Documents\apache-tomcat-8.5.32-prod\webapps"
                    }
                }
            }
        }
    }
}
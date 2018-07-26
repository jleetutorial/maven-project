pipeline {

    agent any

    tools {
        maven 'LocalMaven'
    }

    parameters { 
         string(name: 'tomcat_dev', defaultValue: 'C:\Users\Xadmin\Documents\apache-tomcat-8.5.32-staging\webapps', description: 'Staging Server')
         string(name: 'tomcat_prod', defaultValue: 'C:\Users\Xadmin\Documents\apache-tomcat-8.5.32-prod\webapps', description: 'Production Server')
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
			 bat "xcopy /s/y **/target/*.war %tomcat_dev%"
                    }
                }
 
                stage ("Deploy to Production"){
                    steps {
			bat "xcopy /s/y **/target/*.war %tomcat_prod%"
                    }
                }
            }
        }
    }
}
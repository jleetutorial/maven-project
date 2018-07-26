pipeline {

    agent any

    tools {
        maven 'LocalMaven'
    }

    parameters { 
         string(name: 'tomcat_dev', defaultValue: 'localhost', description: 'Staging Server')
         string(name: 'tomcat_prod', defaultValue: 'localhost', description: 'Production Server')
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
			 bat "xcopy /s/y **/target/*.war %tomcat_dev%:/var/lib/tomcat7/webapps"
                    }
                }
 
                stage ("Deploy to Production"){
                    steps {
			bat "xcopy /s/y **/target/*.war %tomcat_prod%:/var/lib/tomcat7/webapps"
                    }
                }
            }
        }
    }
}
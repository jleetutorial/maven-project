pipeline {
    agent any

    tools {
        maven 'localMaven'
    }

    parameters {
        string(name:'tomcat_prod', defaultValue: '35.197.215.88:8080', description: 'Production Server')
    }

    triggers {
        pollSCM('* * * * *')
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
        stage ('Deploy to Production') {
            steps {
                build job: "${params.tomcat_prod}:/var/lib/tomcat7/webapps"
            }
            post {
                success {
                    echo 'Code to deploy to Prod.'
                }
                failure {
                    echo 'Deployment failed.'
                }
            }

        }
    }
}
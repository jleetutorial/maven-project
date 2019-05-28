pipeline {

    agent any

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

                bat("xcopy **/target/*.war C:\Users\AnthonyEpps\Downloads\apache-tomcat-8.5.41\apache-tomcat-8.5.41\webapps /O /X /E /H /K")

            }

        }

    }

}
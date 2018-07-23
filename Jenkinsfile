pipeline {

    agent any

    stages{

        stage('Build'){

            steps {

                mvn clean package

            }

            post {

                success {

                    echo 'Now Archiving...'

                    archiveArtifacts artifacts: '**/target/*.war'

                }

            }

        }

    }

}
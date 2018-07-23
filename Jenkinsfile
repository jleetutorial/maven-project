pipeline {

    agent any

    stages{

        stage('Build'){

            steps {

                bat 'clean package'

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
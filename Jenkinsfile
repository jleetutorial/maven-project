pipeline {
    agent any
    stages{
        stage('Build'){
            steps {
                echo "Bonjour Issam"
            }
            post {
                success {
                    echo "Now Archiving artifact"
                    echo 'Now Archiving...'
                    echo 'test finalisé'
                    archiveArtifacts artifacts: '**/target/*.war'

                }
            }
        }
    }
}

pipeline {
    agent any
    stages{
        stage('Build'){
            steps {
                sh 'echo "Bonjour Issam'
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

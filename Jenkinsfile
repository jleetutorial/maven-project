pipeline {
    agent any
    stages{
        stage('Build'){
            steps {
                sh 'mvn clean package'
            }
            post {
                success {
                    echo 'Now Archiving...'
                    echo 'test finalisé'
                    archiveArtifacts artifacts: '**/target/*.war'
                }
            }
        }
    }
}

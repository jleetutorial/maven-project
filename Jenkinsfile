pipeline {
    agent any
    stages{
        stage('Build'){
            steps {
                sh 'mvn clean package1'
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

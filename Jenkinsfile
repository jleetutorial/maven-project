pipeline {
    agent any
    stages{
        stage('Build'){
            steps {
              
                call 'mvn clean'
                call  'mvn clean package'
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

pipeline {
    agent any
    tools {
        maven 'localMaven'
    }
    stages{
        stage('Build'){
            steps {
                echo 'Now Build...'
                sh 'mvn clean validate'
            }
            post {
                success {
                    echo 'Now Archiving...'
                    
                }
            }
        }
    }
}

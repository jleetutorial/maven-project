pipeline {
    agent any
    stages{
        stage('Build'){
            steps {
                echo 'Now Build...'
            }
            post {
                success {
                    echo 'Now Archiving...'
                    
                }
            }
        }
    }
}

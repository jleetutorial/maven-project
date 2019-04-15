pipeline{
    agent any
    stages{
        stage('build'){
        steps{
            sh "docker build . -t tomcatwebapp:${env.BUILD_ID}"
        }
        }

    }
}
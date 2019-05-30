pipeline {

    agent any

    tools {
        maven 'LocalMaven'
    }


	triggers {
        githubPush()
    }

    stages{

        stage('Build'){

            steps {

                bat 'mvn clean package'

            }

        }


    }

}
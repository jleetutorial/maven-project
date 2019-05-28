pipeline {

    agent any

    tools {
        maven 'LocalMaven'
    }

    stages{

        stage('Build'){

            steps {

                bat 'mvn clean package'

            }

        }

        stage ('Deploy to Staging'){

            steps {

                bat("xcopy C:\Program Files (x86)\Jenkins\workspace\MultibranchTest_master\webapp\target\webapp.war C:\Users\AnthonyEpps\Downloads\apache-tomcat-8.5.41\apache-tomcat-8.5.41\webapps /O /X /E /H /K")

            }

        }

    }

}
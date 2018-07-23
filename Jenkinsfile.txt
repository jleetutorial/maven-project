

pipeline {
    /* A Declarative Pipeline */
    agent any

    stages{
        stage('Build'){

            steps {

            }
        }
        stage ('Deploy to Staging'){
            /* agent section could go here as well */
            steps {
            
            }
        }
    }
}	 
pipeline {
    agent any

     tools {
        maven 'localMaven'
    }
    
    stages{
        stage('Build'){
            steps{
                bat 'mvn clean package'
            }
        }
    } 
}
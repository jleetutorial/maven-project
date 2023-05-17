pipeline {
    agent any
    stages{
        stage('Integration testing : mvn'){
            steps{
                sh 'mvn test'
            }
        }
        stage('build: unittest'){
            steps{
                sh 'mvn verify -DskipUnitTests'
            }
        }
        stage('build: maven'){
            steps{
                sh 'mvn clean package'
            }
        }
        
    }
}
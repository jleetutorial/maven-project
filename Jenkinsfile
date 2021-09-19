 pipeline {
        agent any
		 tools {
         maven 'Maven 3.8.2'
           }
        stages {
          stage("Code testing") {
            agent any
            steps {
              withSonarQubeEnv('sonarqube') {
                sh 'mvn clean  test sonar:sonar'
              }
            }
          }
          stage("maven Build") {
            steps {
               withSonarQubeEnv('sonarqube') {
                sh 'mvn clean install package  sonar:sonar'
              }
            }
          }
        }
      }

 pipeline {
        agent any
		 tools {
         maven 'M3'
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
              sh '''
			  mvn -B -DskipTests  clean validate compile test package verify
		
			  '''
            }
          }
        }
      }

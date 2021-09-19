 pipeline {
        agent any
		
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



          stage("build images ") {
            steps {
               sh '''
			

                sudo docker rmi -f kemvoueric/maven:latest  || true
                sudo docker build -t kemvoueric/maven  .
			   '''
            }
          }



        }
      }

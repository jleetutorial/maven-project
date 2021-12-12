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
		  

          stage("pushing to dockerhub ") {
            steps {
               sh '''
                docker push  kemvoueric/maven:latest
			   '''
            }
          }



          stage("deploy to tomcat ") {
            steps {
               sh '''
                docker run -itd -p 8888:8080 kemvoueric/maven:latest
			   '''
            }
          }



        }
      }

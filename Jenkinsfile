Pipeline{
	agent any
	stages{
		stage('Build'){
			steps{
				sh 'mvn clean package'
			    }
			post{
				success{
					echo 'Arching'
					archiveArtifact artifact: '**/target/*.war'
				}
			  }
		   }
	   }
  }



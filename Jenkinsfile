pipeline 
{
    agent any
    stages{
        stage('Build'){
	   def mvn_version = 'localmaven'
	   steps {	
           	withEnv( ["PATH+MAVEN=${tool mvn_version}/bin"] ){	
                	sh 'mvn clean package'
            	}
           }
	   post {
                success {
                    echo 'Now Archiving...'
                    archiveArtifacts artifacts: '**/target/*.war'
                }
            }
        }
    }
}


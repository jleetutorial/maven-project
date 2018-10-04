pipeline 
{
    agent any
    tools {
	maven 'localmaven'
    }		
    stages{
        stage('Build'){
	   steps {	
                	sh 'mvn clean package'
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


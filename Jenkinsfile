 pipeline {	
	agent any
	environment { 
        CC = 'clang'
    }
	Tools {
	          maven 'localmaven'
	         }
	stages{
	stage('Pre-Build'){
	steps {
		printenv
	}
	}
	stage('Build'){
	steps {
	sh 'mvn clean package'
	}
	post {
	success {
	echo 'Now Archiving...'
	#archiveArtifacts artifacts: '**/target/*.war'
	
	}
	}
	}
	stage ('Deploy to Staging'){
	steps {
	build job: 'Deploy-to-staging'
	}
	}
	}
	}


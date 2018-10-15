 pipeline {	
	agent any
	environment { 
        CC = 'clang'
    }
	tools {
	          maven 'localmaven'
	         }
	stages{
	stage('Build'){
	steps {
	sh 'printenv'	
	sh 'mvn clean package'
	}
	post {
	success {
	echo 'Now Archiving...'
	archiveArtifacts artifacts: '**/target/*.war'
	build job: 'deploy-to-staging1'
	}
	}
	}
	}
	}


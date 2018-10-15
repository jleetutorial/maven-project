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
	echo 'building here.'
	sh 'mvn clean package'
	}
	post {
	success {
	echo 'Now Archiving...'
	archiveArtifacts artifacts: '**/target/*.war'
	
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


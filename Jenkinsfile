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
	stage ('Deploy to Staging'){
	steps {
	build job: 'deploy-to-staging1'
	}
	
	}
	}
	}
	stage ('Deploy to Staging'){
	steps {
	build job: 'deploy-to-staging1'
	}
	}
	}
	}
 }


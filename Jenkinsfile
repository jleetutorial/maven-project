 pipeline {	
	agent any
	environment { 
        CC = 'clang'
    }
	tools {
	          maven 'localmaven'
	         }
	stages{
	stage('Build-Master'){
	when { branch 'master' } 
	steps {
	sh 'printenv'	
	sh 'mvn clean package'
	}
	post {
	success {
	sh 'mvn deploy'
	}
	}
	}
	stage('Build-Non-Master'){
	when { not { branch 'master' } } // temp Jenkinsfile
	steps {
	sh 'printenv'	
	sh 'mvn clean package'
	}
	}
	}
	}


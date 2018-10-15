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
	when { branch 'origin/master' } 
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
	when { not { branch 'origin/master' } }
	steps {
	sh 'printenv'	
	sh 'mvn clean package'
	}
	}
	}
	}


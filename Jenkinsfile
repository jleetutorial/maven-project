pipeline {
  agent any
  stages {
    stage('teststep') {
      agent any
      steps {
        sh 'ps -ef | grep jenkins'
      }
    }
    stage('Find war') {
      parallel {
        stage('Find war') {
          agent any
          steps {
            findFiles(glob: '*.war')
          }
        }
        stage('error') {
          steps {
            fileExists 'webapp.war'
          }
        }
      }
    }
  }
}
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
      steps {
        findFiles(glob: '*.war')
      }
    }
  }
}
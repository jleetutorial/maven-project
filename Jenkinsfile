pipeline{ 
  agent any
  stages{
    stage('Build'){
      steps{
        //if(isUnix()){
        //  sh 'mvn clean package'
        //}else{
          bat 'mvn clean package'
        //}
      }
      post {
        success {
          echo 'Now Archiving...'
          archiveArtifacts artifacts: '**/*.war'
        }
      }
    }
    stage ('Deploy to Staging'){
      steps {
        build job: 'DeployArtifac'
      }
    }
  }
}
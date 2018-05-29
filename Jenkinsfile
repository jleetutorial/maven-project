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
    stage ('Deploy to Production'){
      steps{
        timeout(time:5, unit:'DAYS'){
          input message:'Approve PRODUCTION Deployment?'
        }
        build job: 'DeployToProd'
      }
      post {
        success {
          echo 'Code deployed to Production.'
        }
        failure {
          echo ' Deployment failed.'
        }
      }
    }
  }
}
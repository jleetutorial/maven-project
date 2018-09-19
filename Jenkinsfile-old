pipeline{ 
  agent any
  tools {
    maven 'maven'
  }
  stages{
    stage('Build'){
      steps{
        script {
          if(isUnix()){
            sh 'mvn clean package'
          }else{
            bat 'mvn clean package'
          }
        }
      }
      post {
        success {
          echo 'Now Archiving...'
          archiveArtifacts artifacts: '**/target/*.war', onlyIfSuccessful: true
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
        timeout(time:5, unit:'MINUTES'){
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
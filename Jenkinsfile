pipeline{ 
  agent master
  stages{
    stage('Build'){
      steps{
        bat 'mvn clean package'
      }
    }
  }
}
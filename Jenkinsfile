pipeline{ 
  agent master
  stages{
    stage('Build'){
      steps{
        if(isUnix()){
          sh 'mvn clean package'
        }else{
          bat 'mvn clean package'
        }
      }
    }
  }
}
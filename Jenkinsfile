Node {

    tools {
    maven 'localMaven'
  }
 stage('Build'){
        sh 'mvn clean package'
                    echo 'Now Archiving...'
                    archiveArtifacts artifacts: '**/target/*.war'
           }
        
}

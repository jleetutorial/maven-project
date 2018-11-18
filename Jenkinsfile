Node {

 tool name: 'localMaven', type: 'maven'

 stage('Build'){
        sh 'mvn clean package'
                    echo 'Now Archiving...'
                    archiveArtifacts artifacts: '**/target/*.war'
           }
        
}

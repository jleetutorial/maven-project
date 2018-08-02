node {
  git url: 'https://github.com/prdur1/maven-project.git'
  def mvnHome = tool 'localMaven'
  env.PATH = "${mvnHome}/bin:${env.PATH}"
  stage('File Loading')
  {
     echo 'I am from Example'
    // Load the file 'externalMethod.groovy' from the current directory, into a variable called "externalMethod".
   def externalMethod = load("externalMethod.groovy")

    // Call the method we defined in externalMethod.
   externalMethod.lookAtThis("Pradeep")
    // Now load 'externalCall.groovy'.
    def externalCall = load("externalCall.groovy")
        // We can just run it with "externalCall(...)" since it has a call method.
    externalCall("Steve")
    
   }
  stage ('QA')
  {
    parallel(longerTests: {
              echo' from longer test'
           }, quickerTests: {
          echo' from Quicker test'
           })
  } 
  ansiColor('xterm') {
        // Just some echoes to show the ANSI color.
        stage "\u001B[31mI'm Red\u001B[0m Now not"
    }
 /* stage('Build'){
            steps {
                echo 'Now Build...'
                sh 'mvn clean package'
            }
            post {
                success {
                    echo 'Now Archiving...'
                    archiveArtifacts artifacts: '**/target/*.war'
                    
                }
            }
        } */
  
 /*stage('buid')
  {
    echo 'Build'
  sh 'mvn clean package'
  } */
}

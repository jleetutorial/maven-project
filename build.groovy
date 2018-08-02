node {
  git url: 'https://github.com/prdur1/maven-project.git'
  def mvnHome = tool 'localMaven'
  env.PATH = "${mvnHome}/bin:${env.PATH}"
  stage('Example')
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
     stage 'QA'
    parallel(longerTests: {
        runWithServer {
          echo' from longer test'
        }
    }, quickerTests: {
        runWithServer {   echo' from Quicker test'
        }
    })
 /*stage('buid')
  {
    echo 'Build'
  sh 'mvn clean package'
  } */
}

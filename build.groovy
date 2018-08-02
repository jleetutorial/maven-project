node {
  git url: 'https://github.com/prdur1/maven-project.git'
  def mvnHome = tool 'localMaven'
  env.PATH = "${mvnHome}/bin:${env.PATH}"
  stage('Example')
  {
     echo 'I Example'
     // Now load 'externalCall.groovy'.
   // def externalCall = load("externalCall.groovy")

    // We can just run it with "externalCall(...)" since it has a call method.
    //externalCall("Steve")
   }
  stage('buid')
  {
    echo 'Build'
  sh 'mvn clean package'
  }
}

import groovy.json.JsonSlurper
import groovy.util.XmlSlurper
import jenkins.*
import jenkins.model.*
import hudson.model.*

node {
  git url: 'https://github.com/prdur1/maven-project.git'
  def v = version()
  if (v) {
    echo "Building version ${v}"
  }
  def mvnHome = tool 'localMaven'
  env.PATH = "${mvnHome}/bin:${env.PATH}"
  


/*  stage('File Loading')
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
 
  stage('Build'){
            timeout(time: 5, unit: "SECONDS") {
          retry(5) {
            echo "hello"
          }
        }
     } 
   
  stage('Enviroment')
  {
    FOO = "BAR"
    BUILD_NUM_ENV = currentBuild.getNumber()
    ANOTHER_ENV = "${currentBuild.getNumber()}"
    INHERITED_ENV = "\${BUILD_NUM_ENV} is inherited"
  //  ACME_FUNC = readMavenPom().getArtifactId()
    
     sh 'echo "FOO is $FOO"'
        // returns 'FOO is BAR'

        sh 'echo "BUILD_NUM_ENV is $BUILD_NUM_ENV"'
        // returns 'BUILD_NUM_ENV is 4' depending on the build number

        sh 'echo "ANOTHER_ENV is $ANOTHER_ENV"'
        // returns 'ANOTHER_ENV is 4' like the previous depending on the build number

        sh 'echo "INHERITED_ENV is $INHERITED_ENV"'
        // returns 'INHERITED_ENV is ${BUILD_NUM_ENV} is inherited'
        // The \ escapes the $ so the variable is not expanded but becomes a literal

  //      sh 'echo "ACME_FUNC is $ACME_FUNC"'
        // returns 'ACME_FUNC is spring-petclinic' or the name of the artifact in the pom.xml
  }  */ 
  
 stage('buid')
  {
    echo 'Build'
    sh 'mvn clean package'
    input 'Ready to go?'
    step([$class: 'ArtifactArchiver', artifacts: '**/target/*.jar', fingerprint: true])
    step([$class: 'JUnitResultArchiver', testResults: '**/target/surefire-reports/TEST-*.xml'])
  } 
 def version() {
   def matcher = readFile('pom.xml') =~ '<version>(.+)</version>'
   matcher ? matcher[0][1] : null
  }
}

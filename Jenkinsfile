node {
   def mvnHome
   stage('Preparation') { // for display purposes
      // Get some code from a GitHub repository
      //git 'https://github.com/jglick/simple-maven-project-with-tests.git'
      // Get the Maven tool.
      // ** NOTE: This 'M3' Maven tool must be configured
      // **       in the global configuration.           
      mvnHome = tool name: 'localMaven', type: 'maven'

   }
   stage('Build') {
      // Run the maven build
   echo 'build'  
   }
   stage('Results') {
   echo 'archive'
   }
}

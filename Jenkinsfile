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
      
              //sh 'mvn clean package'
               sh "'${mvnHome}/bin/mvn' -Dmaven.test.failure.ignore clean package"


   echo 'build'  
   }
   
   if(env.BRANCH_NAME == 'master'){

        stage('Deliver for production') {
      
build 'deploy-to-production'
            }
        }
   
   if(env.BRANCH_NAME == 'devlop' || !env.BRANCH_NAME){

        stage('Deliver for staging') {
      
build 'deploy-to-staging'
            }
        }
   
   stage('Results') {
   echo 'archive'
   }
}

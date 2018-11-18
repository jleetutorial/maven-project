node {
   def mvnHome
   def branch
   stage('Preparation') { // for display purposes
      // Get some code from a GitHub repository
      git 'https://github.com/Sunnygupta1401/maven-project.git'
      // Get the Maven tool.
      // ** NOTE: This 'M3' Maven tool must be configured
      // **       in the global configuration.           
      mvnHome = tool name: 'localMaven', type: 'maven'
      branch = scm.branches[0].name
      

   }
   stage('Build') {
      // Run the maven build
      
              //sh 'mvn clean package'
               sh "'${mvnHome}/bin/mvn' -Dmaven.test.failure.ignore clean package"
archiveArtifacts artifacts: '**/target/*.war', fingerprint: true




   echo 'build'  
   }
   
   if(env.BRANCH_NAME == 'master' || ${branch} == 'origin/master'){

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

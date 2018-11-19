node {
   def mvnHome
   def bb
   def GIT_BRANCH

   stage('Preparation') { // for display purposes
      // Get some code from a GitHub repository
      //git 'https://github.com/Sunnygupta1401/maven-project.git'
      // Get the Maven tool.
      checkout scm
      // ** NOTE: This 'M3' Maven tool must be configured
      // **       in the global configuration.           
      mvnHome = tool name: 'localMaven', type: 'maven'
                  //GIT_BRANCH = 'origin/' + sh(returnStdout: true, script: 'git rev-parse --abbrev-ref HEAD').trim()
GIT_BRANCH_NAME = 'origin/' + sh(returnStdout: true, script: "git name-rev --name-only HEAD").trim()
    GIT_BRANCH = GIT_BRANCH_NAME.split('remotes/origin/')[1]

   }
   stage('Build') {
      // Run the maven build
      
              //sh 'mvn clean package'
               sh "'${mvnHome}/bin/mvn' clean package"
archiveArtifacts artifacts: '**/target/*.war', fingerprint: true


//echo env.GIT_BRANCH

  //    echo ${branch} 
   }
   
   stage('Testtt')
         {
          
echo GIT_BRANCH
echo env.BRANCH_NAME
         }
   
   if(env.BRANCH_NAME == 'master' || GIT_BRANCH == 'origin/master'){

        stage('Deliver for production') {
      
build 'deploy-to-production'
            }
        }
   
   if(env.BRANCH_NAME == 'devlop' ||  GIT_BRANCH == 'origin/devlop'){

        stage('Deliver for staging') {
      
build 'deploy-to-staging'
            }
        }
   
   stage('Results') {
   echo 'archive'
   }
}

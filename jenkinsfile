pipeline {
    agent any
    parameters {
        string(name:'tomcat_dev',defaultValue:'34.201.111.1',description:'staging server')
        string(name:'tomcat_prod',defaultValue:'34.201.111.1',description:'production server')
    }
    triggers {
        pollSCM ('* * * * *')
    }
    stages{
        stage ('Build'){
            steps {
                sh 'mvn clean package'
             }        
        post {
            success {
                    echo 'Build Success....'                  
                }    
            }
        }
        stage('Archiving'){
            steps {
                  archiveArtifacts artifacts: '**/target/*.war'
                  echo 'Archiving Completed '
            }
        }
        stage ('Deployments'){
            parallel{
                stage ('Deploy to Staging'){
                    steps{
                        sh "sudo cp /var/lib/jenkins/workspace/FullyAutomated/webapp/target/webapp.war /var/lib/tomcat7/webapps"
                    }
                }
            stage ("Deploy yo production"){
                steps{
                    sh "sudo cp /var/lib/jenkins/workspace/FullyAutomated/webapp/target/webapp.war /var/lib/tomcat7/webapps"
                    }
                }

            }
        }
    }    
}

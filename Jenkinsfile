pipeline {
    agent any


    triggers {
         pollSCM('* * * * *')
     }

stages{
        stage('Build'){
            steps {
                sh 'mvn clean package'
            }
            post {
                success {
                    echo 'Now Archiving...'
                    archiveArtifacts artifacts: '**/target/*.war'
                }
            }
        }

        stage ('Deployments'){
            parallel{
                stage ('Deploy to Staging'){
                    steps {
                        sh "ssh -i **/target/*.war root@3.16.89.185:/var/lib/tomcat7/webapps"
                    }
                }

            }
        }
    }
}

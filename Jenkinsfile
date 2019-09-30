pipeline {
    agent any

    parameters {
         string(name: 'tomcat_dev', defaultValue: '3.16.89.185', description: 'Staging Server')
         
    }

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
                        sh "ssh -i **/target/*.war root@${params.tomcat_dev}:/var/lib/tomcat7/webapps"
                    }
                }

            }
        }
    }
}

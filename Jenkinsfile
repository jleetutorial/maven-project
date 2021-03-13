pipeline {
    agent any

    parameters {
         string(name: 'tomcat_dev', defaultValue: '3.15.204.48', description: 'Staging Server')
         string(name: 'tomcat_prod', defaultValue: '18.220.199.9', description: 'Production Server')
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
                        sh "scp -i /C/work/git/tomcat-demo.pem **/target/*.war ec2-user@${params.tomcat_dev}:/usr/share/tomcat/webapps"
                        sh "scp -i /C/work/git/tomcat-demo.pem **/target/*.war ec2-user@ec2-3-15-204-48.us-east-2.compute.amazonaws.com:/usr/share/tomcat/webapps"
                    }
                }

                stage ("Deploy to Production"){
                    steps {
                        bat "scp -i /c/work/git/tomcat-demo.pem **/target/*.war ec2-user@${params.tomcat_prod}:/usr/share/tomcat/webapps"
                    }
                }
            }
        }
    }
}

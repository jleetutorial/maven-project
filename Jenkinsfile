pipeline {
    agent any

    tools {
        maven 'localMaven'
    }

    parameters {
         string(name: 'tomcat_stage', defaultValue: '54.229.33.187', description: 'Staging Server')
         string(name: 'tomcat_prod', defaultValue: '52.51.30.116', description: 'Production Server')
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
                        sh "scp -i /Users/oleksandrp/DevSpace/Udemy_Courses/aws/tomcat-demo.pem **/target/*.war ec2-user@${params.tomcat_stage}:/var/lib/tomcat7/webapps"
                    }
                }

                stage ("Deploy to Production"){
                    steps {
                        sh "scp -i /Users/oleksandrp/DevSpace/Udemy_Courses/aws/tomcat-demo.pem **/target/*.war ec2-user@${params.tomcat_prod}:/var/lib/tomcat7/webapps"
                    }
                }
            }
        }
    }
}

pipeline {
    agent any

    // tools {
    //     maven 'localMaven'
    // }

    parameters{
        string(name:'tomcat_dev', defaultValue:'34.194.29.98', description:'Development SERVER')
        //String(name:'tomcat_PROD', defaultValue:'http://localhost:9090/',description:'Production SERVER')
    }

    triggers{
        pollSCM('* * * * *')
    }

    stages{

        stage('Build'){
            steps {
                bat 'mvn clean package'
            }
            post {
                success {
                    echo 'Now Archiving...'
                    archiveArtifacts artifacts: '**/target/*.war'
                }
            }
        }

        stage('Deployments'){
            parallel {

                stage('Deploy to Develop'){
                    steps{
                        //build job: 'Deploy-to-Staging' /home/ktummalagunta/jenkins
                        bat "scp -i /home/ktummalagunta/jenkins/MyPuttyKey.pem **/target/*.war ec2-user@${params.tomcat_dev}:/var/lib/tomcat8/webapps"
                    }

                    post {
                        success {
                            echo 'Deployment to DEV success'
                        }

                        failure{
                            echo 'Deployment to DEV failed'
                        }
                    }
                }

                    // stage('Deploy to Production'){
                    //     steps{
                    //         // timeout(time:5, unit:'DAYS'){
                    //         //     input message : 'Approve for the production Deployment?'
                    //         // }

                    //         // build job: 'Deploy-to-Prod'

                    //         sh "scp -i /home/jenkins/tomcat-demo.pem **/target/*.war ec2-user@${params.tomcat_prod}:/var/lib/tomcat7/webapps"
                    //     }
                    //     post {
                    //         success {
                    //             echo 'Deployment to Production success'
                    //         }

                    //         error{
                    //             echo 'Deployment to Production failed'
                    //         }
                    //     }
                    // }
            }
        }
    
    }
}
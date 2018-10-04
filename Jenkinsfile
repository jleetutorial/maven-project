pipeline {
  agent any
  stages {
    stage('compilar') {
      parallel {
        stage('compilar') {
          agent {
            node {
              label 'Ubuntu'
            }

          }
          steps {
            sh 'mvn clean package'
            archiveArtifacts(artifacts: '**/*.war', fingerprint: true, onlyIfSuccessful: true)
          }
        }
        stage('checkstyle') {
          agent {
            node {
              label 'Ubuntu'
            }

          }
          steps {
            sh 'mvn checkstyle:checkstyle'
            checkstyle()
          }
        }
      }
    }
    stage('aprobar') {
      steps {
        input(message: 'aprobar despliegue', ok: 'Si')
      }
    }
    stage('despliegue') {
      agent {
        node {
          label 'Windows'
        }

      }
      steps {
        copyArtifacts(projectName: 'maven-project', flatten: true, fingerprintArtifacts: true)
      }
    }
  }
  environment {
    TOMCAT_HOME = 'C:\\Tomcat_8.5\\webapps'
  }
}
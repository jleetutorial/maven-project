pipeline {
  agent none
  stages {
    stage('Compilar') {
      agent {
        node {
          label 'master'
        }

      }
      steps {
        node(label: 'master') {
          checkout([$class: 'GitSCM', branches: [[name: '*/master']], doGenerateSubmoduleConfigurations: false, extensions: [], submoduleCfg: [], userRemoteConfigs: [[credentialsId: 'github-pvaleror', url: 'https://github.com/pvaleror/maven-project.git']]])
          sh 'mvn clean package'
          archiveArtifacts(artifacts: '**/*.war', onlyIfSuccessful: true)
        }

      }
    }
    stage('Despliegues') {
      parallel {
        stage('Probar') {
          agent {
            node {
              label 'Windows'
            }

          }
          steps {
            node(label: 'master') {
              sh 'mvn checkstyle:checkstyle'
              checkstyle(failedTotalHigh: params.MAX_HIGH_WARNING)
            }

          }
        }
        stage('Desplegar') {
          agent {
            node {
              label 'master'
            }

          }
          steps {
            node(label: 'Windows') {
              copyArtifacts(filter: '**/*.war', fingerprintArtifacts: true, flatten: true, projectName: 'mvn-3/master', selector: specific('$BUILD_NUMBER'), target: '$TOMCAT_HOME')
            }

          }
        }
      }
    }
    stage('Confirm Deploy to Production') {
      steps {
        input(message: 'Desplegar a producción?', ok: 'Aceptar')
      }
    }
  }
  parameters {
    string(defaultValue: '2', description: '', name: 'MAX_HIGH_WARNING', trim: true)
  }
}
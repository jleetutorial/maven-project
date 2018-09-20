pipeline{
 agent{
      node{
        label 'master'
      }
    }
 
  parameters([string(defaultValue: '3', description: '', name: 'MAX_ERRORS', trim: false)])
 stages{
  stage('Compilar') {
    steps{
      node(label:'master') {
        checkout([$class: 'GitSCM', branches: [[name: '*/master']], doGenerateSubmoduleConfigurations: false, extensions: [], submoduleCfg: [], userRemoteConfigs: [[credentialsId: 'github-pvaleror', url: 'https://github.com/pvaleror/maven-project.git']]])
        sh 'mvn clean package'
        archiveArtifacts '**/*.war'
      }
    }    
  }
  stage('CheckStyle') {
    steps{
      node(label:'master') {
        sh returnStdout: true, script: 'mvn checkstyle:checkstyle'
        checkstyle canComputeNew: false, canRunOnFailed: true, defaultEncoding: '', failedTotalAll: params.MAX_ERRORS, healthy: '', pattern: '', unHealthy: ''
      }
    }
    
  }
  stage('Deploy') {
    agent{
      node{
        label 'Windows'
      }
    }
    steps{
      node(label:'Windows') {
        copyArtifacts filter: '**/*.war', fingerprintArtifacts: true, flatten: true, projectName: 'pipelineasacode', selector: specific('$BUILD_NUMBER'), target: '$TOMCAT_HOME'
      }
    }
    
  }
 }
}
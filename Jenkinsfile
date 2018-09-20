pipeline{
 stages{
  stage('Compilar') {
    node(label:'master') {
      checkout([$class: 'GitSCM', branches: [[name: '*/master']], doGenerateSubmoduleConfigurations: false, extensions: [], submoduleCfg: [], userRemoteConfigs: [[credentialsId: 'github-pvaleror', url: 'https://github.com/pvaleror/maven-project.git']]])
      sh 'mvn clean package'
      archiveArtifacts '**/*.war'
    }
  }
  stage('CheckStyle') {
    node(label:'master') {
      sh returnStdout: true, script: 'mvn checkstyle:checkstyle'
      checkstyle canComputeNew: false, canRunOnFailed: true, defaultEncoding: '', failedTotalAll: params.MAX_ERRORS, healthy: '', pattern: '', unHealthy: ''
    }
  }
  stage('Deploy') {
    node(label:'Windows') {
      copyArtifacts filter: '**/*.war', fingerprintArtifacts: true, flatten: true, projectName: 'pipelineasacode', selector: specific('$BUILD_NUMBER'), target: '$TOMCAT_HOME'
    }
  }
 }
}
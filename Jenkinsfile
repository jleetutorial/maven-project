pipeline{
  agent none
  parameters{
    string(defaultValue: '2', description: '', name: 'MAX_HIGH_WARNING', trim: true)
  }
  copyArtifactPermission('pipelineAsCode')
  stages{
    stage('Compilar'){
      node('master') {
        checkout([$class: 'GitSCM', branches: [[name: '*/master']], doGenerateSubmoduleConfigurations: false, extensions: [], submoduleCfg: [], userRemoteConfigs: [[credentialsId: 'github-pvaleror', url: 'https://github.com/pvaleror/maven-project.git']]])
        sh 'mvn clean package'
        archiveArtifacts artifacts: '**/*.war', onlyIfSuccessful: true
      }
    }
    parallel{
      stage('Probar') {
        node('master'){
          sh 'mvn checkstyle:checkstyle'
          checkstyle defaultEncoding: '', failedTotalHigh: params.MAX_HIGH_WARNING, healthy: '', pattern: '', unHealthy: ''
        }
      }
      stage('Desplegar') {
        node('Windows') {
          copyArtifacts filter: '**/*.war', fingerprintArtifacts: true, flatten: true, projectName: '$JOB_NAME', selector: specific('$BUILD_NUMBER'), target: '$TOMCAT_HOME'
        }
      }
    }
  }
}
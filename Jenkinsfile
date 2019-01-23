node("Windows"){
  stage("checkout"){
    checkout([$class: 'GitSCM', branches: [[name: '*/master']], doGenerateSubmoduleConfigurations: false, extensions: [], submoduleCfg: [], userRemoteConfigs: [[url: 'https://github.com/pvaleror/maven-project.git']]])
  }
  stage("Compilar"){
    sh 'mvn clean package'
    archiveArtifacts(artifacts: '**/*.war', fingerprint: true, onlyIfSuccessful: true)
  }
  stage("test"){
    sh 'mvn checkstyle:checkstyle'
    checkstyle()
  }
  /*stage("desplegar"){
    copyArtifacts(filter: '**/*.war', fingerprintArtifacts: true, flatten: true, projectName: 'mvn-3/master', selector: specific('$BUILD_NUMBER'), target: '$TOMCAT_HOME')
  }*/
}
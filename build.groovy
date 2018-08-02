node {
  git url: 'https://github.com/prdur1/maven-project.git'
  def mvnHome = tool 'localMaven'
  env.PATH = "${mvnHome}/bin:${env.PATH}"
  stage('Example')
  {
     echo 'I Example'
  }
  stage('buid')
  {
    echo 'Build'
  sh 'mvn clean package'
  }
}

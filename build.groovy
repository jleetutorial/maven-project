node {
  git url: 'https://github.com/prdur1/maven-project.git'
  def mvnHome = tool 'localMaven'
  env.PATH = "${mvnHome}/bin:${env.PATH}"
  sh 'mvn clean package'
}

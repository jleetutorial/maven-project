node('MAVEN') {
    stage('scm') {
        git 'https://github.com/jleetutorial/maven-project.git'
   }
   stage('build') {
       sh 'mvn clean install'
   }
   stage('postbuild') {
       junit '**/TEST-*.xml'
       archive '**/*.war'
   }
}

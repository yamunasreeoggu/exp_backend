pipeline {
  agent {
    node { label 'workstation' }
  }

  options {
    ansiColor('xterm')
  }

  stages {
    stage( 'Code Quality') {
      steps {
        sh 'sonar-scanner -Dsonar.host.url=http://44.223.94.106:9000 -Dsonar.login=admin -Dsonar.password=admin123 -Dsonar.projectKey=exp_backend -Dsonar.qualitygate.wait=true'
      }
    }

    stage ( 'Release' ) {
      steps {
        sh 'echo release'
      }
    }
  }

  post {
    always {
    cleanWs()
    }
  }
}

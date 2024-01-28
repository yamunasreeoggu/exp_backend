pipeline {
  agent {
    node { label 'workstation' }
  }

  options {
    ansiColor('xterm')
  }

  stages {
    stage( 'CI') {
      steps {
        echo CI
      }
    }
  }
  post {
    always {
    cleanWs()
    }
  }
}

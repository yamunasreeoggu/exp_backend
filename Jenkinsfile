pipeline {
  agent {
    node { label 'workstation' }
  }

  options {
    ansiColor('xterm')
  }

  stages {
    stage( 'Continuous Integration') {
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

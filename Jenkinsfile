pipeline {
  agent {
    node { label 'workstation' }
  }

  options {
    ansiColor('xterm')
  }

  stages {

    stage( 'Download Dependencies') {
      steps {
        sh 'npm install'
      }
    }

    stage( 'Code Quality') {
      when {
        allOf {
          expression {env.TAG_NAME != env.GIT_BRANCH }
        }
      }

      steps {
        sh 'echo CQ'
        //sh 'sonar-scanner -Dsonar.host.url=http://3.230.172.62:9000 -Dsonar.login=admin -Dsonar.password=admin123 -Dsonar.projectKey=exp_backend -Dsonar.qualitygate.wait=true'
      }
    }

    stage( 'Unit Tests') {
      when {
        allOf {
          branch 'main'
          expression {env.TAG_NAME != env.GIT_BRANCH }
        }
      }
      steps {
        sh 'echo Unit Tests'
      }
    }

    stage ( 'Release' ) {
      when {
        expression { env.TAG_NAME ==~ ".*" }
      }
      steps {
        sh 'podman build -t 492681564023.dkr.ecr.us-east-1.amazonaws.com/backend:1.0.0 .'
        sh 'aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin 492681564023.dkr.ecr.us-east-1.amazonaws.com'
        sh 'docker push 492681564023.dkr.ecr.us-east-1.amazonaws.com/backend:1.0.0'
      }
    }
  }
}

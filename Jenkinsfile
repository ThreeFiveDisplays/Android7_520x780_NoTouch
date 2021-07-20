pipeline {
  agent {
    dockerfile true
  }
  stages {
    stage('Example') {
      steps {
        echo 'Hello Bill!'
        sh 'echo myCustomEnvVar = $myCustomEnvVar'
      }
    }
  }
}

pipeline {
  agent {
    dockerfile true
  }
  stages {
    stage('Example') {
      steps {
        echo 'Hello William !'
        sh 'echo myCustomEnvVar = $myCustomEnvVar'
      }
    }
  }
}

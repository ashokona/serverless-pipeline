pipeline {
  agent {
    dockerfile true
    //docker {
      //image 'tarampampam/node:13-alpine'
      // args '-p 20001-20100:3000'
    //}
  }
  environment {
    CI = 'false'
    HOME = '.'
    npm_config_cache = 'npm-cache'
  }
  stages {
    stage('Install Packages') {
      steps {
        sh 'npm install'
      }
    }
    stage('Deployment') {
      steps{
      withCredentials([[$class: 'AmazonWebServicesCredentialsBinding', accessKeyVariable: 'AWS_ACCESS_KEY_ID', credentialsId: 'AWS-Credential-Jenkins-ID', secretKeyVariable: 'AWS_SECRET_ACCESS_KEY']]) {
          // some block
        echo AWS_ACCESS_KEY_ID
        echo $AWS_SECRET_ACCESS_KEY
      }
      }
    }
  } 
}

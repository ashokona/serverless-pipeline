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
    stage('AWS Config') {
      steps{
          echo '${AWS_ACCESS_KEY_ID}'
        sh 'aws configure set aws_access_key_id ${AWS_ACCESS_KEY_ID}'
        sh 'aws configure set aws_secret_access_key ${AWS_SECRET_ACCESS_KEY}'
      }
    }
    stage('Deploy') {
      steps {
        sh 'Serverless deploy'
      }
    }
  } 
}

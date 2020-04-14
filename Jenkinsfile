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
        withCredentials([[$class: ‘AmazonWebServicesCredentialsBinding’, credentialsId: 'AWS-Credential-Jenkins-ID']]) {
            sh ‘’’
                serverless config credentials --provider aws --key $AWS_ACCESS_KEY_ID --secret $AWS_SECRET_ACCESS_KEY
                sls deploy
            ‘’’
        }
    }
  } 
}

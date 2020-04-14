

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
        withCredentials([[$class: 'AmazonWebServicesCredentialsBinding', credentialsId: 'AWS-Credential-Jenkins-ID']]) {
        //withCredentials([[$class: 'AmazonWebServicesCredentialsBinding', accessKeyVariable: 'AWS_ACCESS_KEY_ID', credentialsId: 'AWS-Credential-Jenkins-ID', secretKeyVariable: 'AWS_SECRET_ACCESS_KEY']]) {
            // some block
          echo $AWS_ACCESS_KEY_ID
          sh 'aws configure set aws_access_key_id AWS_ACCESS_KEY_ID'
          sh 'aws configure set aws_secret_access_key AWS_SECRET_ACCESS_KEY'
        
            // config credentials --provider aws --key $AWS_ACCESS_KEY_ID --secret $AWS_SECRET_ACCESS_KEY
            // echo AWS_ACCESS_KEY_ID
            // echo $AWS_SECRET_ACCESS_KEY
        }
      }
    }
   
    
    stage('Deploy') {
      steps {
        sh 'serverless deploy'
      }
    }
  } 
}

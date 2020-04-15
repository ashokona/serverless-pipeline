def getArray(){
  return ['Item1', 'Item2', 'Item3']
}
def modules = [ 'sls' ]

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
        echo '${Module}'
        sh 'npm install'
      }
    }
    stage('AWS Config') {
      steps{
          echo '$AWS_ACCESS_KEY_ID'
        sh 'aws configure set aws_access_key_id $AWS_ACCESS_KEY_ID'
        sh 'aws configure set aws_secret_access_key $AWS_SECRET_ACCESS_KEY'
      }
    }
    stage('Deploy') {
      steps {
        script {
          
          if ("${Module}" == 'all') {
              //sh 'npm run build-prod'
            echo 'this executes for all modules'
            build_all(modules);
          }else {
            echo "this executes for module ${Module}"
            sh "rm -r ${Module}/node_modules/"
            sh "mv node_modules/ ${Module}/"
            dir("${Module}") {
              sh 'serverless deploy'
            } 
          }
          
            //build_all(modules);
        }
       
      }
    }
  } 
}

@NonCPS // has to be NonCPS or the build breaks on the call to .each
def build_all(list) {
    list.each { item ->
        echo "Hello ${item}"
        sh "rm -r ${Module}/node_modules/"
        sh "mv node_modules/ ${item}/"
        dir("${item}") {
          sh 'serverless deploy'
        }    
    }
}

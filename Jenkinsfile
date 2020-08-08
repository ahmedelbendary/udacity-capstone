pipeline {
  agent any
  stages {
    stage('Build') {
      steps {
        sh 'echo "Hello World"'
        sh '''
                     echo "Multiline shell steps works too"
                     ls -lah
                 '''
      }
    }

    stage('Lint HTML') {
      steps {
        sh 'tidy -q -e *.html'
      }
    }
    
    stage('Lint Dockerfile ') {
      steps {
        sh 'hadolint Dockerfile'
        }
    }     


    stage('Build Dockerfile') {
      steps {
        sh 'docker build -t nginx:bendo .'
        sh 'docker tag nginx:bendo ahmedbendo/nginx:bendo'
        }
    } 


    stage('Security Scan01') {
      steps {
        aquaMicroscanner(imageName: 'debian:buster-slim', notCompliesCmd: 'exit 1', onDisallowed: 'fail', outputFormat: 'html')
      }
    }



    stage('Security Scan02') {
      steps {
        aquaMicroscanner(imageName: 'ahmedbendo/nginx:bendo', notCompliesCmd: 'exit 1', onDisallowed: 'fail', outputFormat: 'html')
      }
    }


    stage('push the Image') {
      steps {
        sh 'docker push ahmedbendo/nginx:bendo'
        }
    } 




  }
}

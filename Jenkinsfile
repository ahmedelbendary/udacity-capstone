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


    stage('Build  Dockerfile ') {
      steps {
        sh 'docker build -t nginx:bendo .'
        sh 'docker tag nginx:bendo ahmedbendo/nginx:bendo'
        sh 'docker push ahmedbendo/nginx:bendo'
        }
    } 


  }
}

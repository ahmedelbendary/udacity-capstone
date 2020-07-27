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

    stage('Upload to AWS') {
      steps {
        withAWS(region: 'us-west-2', credentials: 'capstone-creds') {
          sh 'echo "Uploading content with AWS creds"'
          s3Upload(pathStyleAccessEnabled: true, payloadSigningEnabled: true, file: 'index.html', bucket: 'udacity-capstone')
        }
      }
    }


  }
}

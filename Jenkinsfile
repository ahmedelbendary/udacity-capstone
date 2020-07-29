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

    stage('Security Scan') {
      steps {
        aquaMicroscanner(imageName: 'debian:buster-slim', notCompleted: 'exit 1', onDisallowed: 'fail')
      }
    }

/*    stage('Upload to AWS') {
        steps {
         withAWS(region: 'us-west-2', credentials: 'capstone-creds') {
           sh 'echo "Uploading content with AWS creds"'
           s3Upload(pathStyleAccessEnabled: true, payloadSigningEnabled: true, file: 'index.html', bucket: 'capstoneudacityp')
         }
       }
     }*/

    stage('Upload to AWS') {
      steps {
        withCredentials([[$class: 'AmazonWebServicesCredentialsBinding', accessKeyVariable: 'AWS_ACCESS_KEY_ID', credentialsId: 'capstone-creds', secretKeyVariable: 'AWS_SECRET_ACCESS_KEY']]) {
        sh """  
              aws s3 ls
              aws s3 mb s3://capstoneudacityp2   --region us-west-2
              aws s3 cp index.html s3://capstoneudacityp2
           """
        }
      }
    }


  }
}

pipeline {
    agent {
        label 'master'
    }
    environment {
        CI = 'true'
    }
    stages {
        stage('Build') {
            steps {
                sh 'docker build -t shelterzoom .'
                sh 'docker stop shelterzoom || true'
                sh 'docker rm shelterzoom || true'

                sh 'docker run -p 49160:3000 -d --name shelterzoom shelterzoom'
                //get rid of dangling images <none>
                sh 'docker rmi --force $(docker images --filter "dangling=true" -q --no-trunc)  || true'
            }
        }
    }
}

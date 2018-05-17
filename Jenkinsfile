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
                sh 'docker build -t shelterZoomApp .'
                sh 'docker stop shelterZoomApp || true'
                sh 'docker rm shelterZoomApp || true'

                sh 'docker run -d --restart unless-stopped --name shelterZoomApp shelterZoomApp'
                //get rid of dangling images <none>
                sh 'docker rmi --force $(docker images --filter "dangling=true" -q --no-trunc)  || true'
            }
        }
    }
}

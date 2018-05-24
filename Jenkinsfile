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
                sh 'docker stop -t 110 shelterzoom || true'
                sh 'sleep 120'
                sh 'docker rm shelterzoom || true'

                sh 'docker run -p 3000:3000 -v /root/logs:/usr/src/app/logs  --restart unless-stopped -d --name shelterzoom shelterzoom'
                //get rid of dangling images <none>
                sh 'docker rmi --force $(docker images --filter "dangling=true" -q --no-trunc)  || true'
            }
        }
    }
}

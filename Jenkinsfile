pipeline {
    agent {
        docker {
            image 'node'
            args '-p 3000:3000'
        }
    }
    environment {
        CI = 'true'
    }
    stages {
        stage('Build') {
            steps {
                sh 'npm install'
            }
        }
        stage('Test') {
            steps {
                sh './jenkins/jenkins-scripts/test.sh'
            }
        }
        stage('Deliver') {
            steps {
                sh './jenkins/jenkins-scripts/deliver.sh'
                input message: 'Finished using the web site? (Click "Proceed" to continue)'
                sh './jenkins/jenkins-scripts/kill.sh'
            }
        }
    }
}

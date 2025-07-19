pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                git 'https://github.com/rabadiaf/create_pods.git'
            }
        }
        stage('Build') {
            steps {
                sh './build.sh'
            }
        }
        stage('Deploy to Minikube') {
            steps {
                sh 'kubectl apply -f k8s/deployment.yaml -n jenkins'
            }
        }
    }
}

pipeline {
  agent any
  tools {
        sonarQubeScanner 'SonarScanner'
    }

  environment {
    DOCKERHUB_CREDS = credentials('dockerhub-creds')  // set this id in Jenkins
    SONAR_TOKEN = credentials('sonar-token')          // secret text
    IMAGE = "yourdockerhub/flask-sonar-demo"
  }

  stages {
    stage('Checkout') {
      steps { checkout scm }
    }

    stage('Test & Coverage') {
      steps {
        sh '''
          python -m venv venv
          . venv/bin/activate || source venv/bin/activate
          pip install -r requirements.txt
          coverage run -m pytest
          coverage xml -o coverage.xml || true
        '''
      }
    }

    stage('SonarQube Analysis') {
      steps {
        withSonarQubeEnv('SonarQubeServer') {
          sh "sonar-scanner -Dsonar.projectBaseDir=. -Dsonar.login=${SONAR_TOKEN}"
        }
      }
    }

    stage('Build Docker Image') {
      steps {
        sh "docker build -t ${IMAGE}:${env.BUILD_NUMBER} ."
      }
    }

    stage('Push to DockerHub') {
      steps {
        sh '''
          echo $DOCKERHUB_CREDS_PSW | docker login -u $DOCKERHUB_CREDS_USR --password-stdin
          docker push ${IMAGE}:${BUILD_NUMBER}
        '''
      }
    }

    stage('Deploy to Kubernetes') {
      steps {
        // kubeconfig must be available on agent or use kubectl credentials binding
        sh "kubectl apply -f deployment.yaml"
        sh "kubectl apply -f service.yaml"
      }
    }
  }

  post {
    always { echo "Pipeline completed" }
  }
}

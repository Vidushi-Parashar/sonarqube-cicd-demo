pipeline {
    agent any

    environment {
        // Replace 'SonarQubeServer' with the name you gave under 
        // "Manage Jenkins → Configure System → SonarQube Servers"
        SONARQUBE_ENV = 'SonarQubeServer'

        // Optional: if you use a token-based authentication, 
        // create a Jenkins secret text credential with your Sonar token 
        // and reference it here
        SONAR_TOKEN = credentials('Demo-token')
    }

    stages {
        stage('Checkout Code') {
            steps {
                // Pull latest code from GitHub
                git branch: 'main', url: 'https://github.com/Vidushi-Parashar/sonarqube-cicd-demo.git'
            }
        }

        stage('Build') {
            steps {
                echo 'Building the project...'
                sh 'mvn clean install'
            }
        }

        stage('SonarQube Analysis') {
            steps {
                // Run sonar-scanner using environment configured in Jenkins
                withSonarQubeEnv('SonarQubeServer') {
                    sh """
                        sonar-scanner \
                        -Dsonar.projectKey=sonarqube-cicd-demo \
                        -Dsonar.sources=. \
                        -Dsonar.host.url=http://localhost:9000 \
                        -Dsonar.login=${Demo_TOKEN}
                    """
                }
            }
        }

        stage('Quality Gate') {
            steps {
                // Wait for SonarQube to finish analysis and return Quality Gate result
                timeout(time: 2, unit: 'MINUTES') {
                    waitForQualityGate abortPipeline: true
                }
            }
        }
    }

    post {
        success {
            echo '✅ Build and SonarQube Analysis completed successfully!'
        }
        failure {
            echo '❌ Pipeline failed! Check logs for details.'
        }
    }
}

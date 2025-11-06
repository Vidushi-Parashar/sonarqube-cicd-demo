pipeline {
    agent any

    tools {
        maven 'Maven' // 👈 this must match the name in Jenkins tool config
        jdk 'jdk17'   // if you’ve set a JDK tool
    }

    environment {
        SONARQUBE = credentials('Demo-token') // your SonarQube token
    }

    stages {
        stage('Checkout Code') {
            steps {
                git branch: 'main', url: 'https://github.com/Vidushi-Parashar/sonarqube-cicd-demo.git'
            }
        }

        stage('Build') {
            steps {
                echo "Building the project..."
                sh "mvn clean install"
            }
        }

        stage('SonarQube Analysis') {
            steps {
                withSonarQubeEnv('SonarQubeServer') {
                    sh '''
                        mvn sonar:sonar \
                        -Dsonar.projectKey=sonarqube-cicd-demo \
                        -Dsonar.host.url=http://localhost:9000 \
                        -Dsonar.login=$SONARQUBE
                    '''
                }
            }
        }

        stage('Quality Gate') {
            steps {
                timeout(time: 1, unit: 'HOURS') {
                    waitForQualityGate abortPipeline: true
                }
            }
        }
    }

    post {
        failure {
            echo "❌ Pipeline failed! Check logs for details."
        }
        success {
            echo "✅ Pipeline succeeded!"
        }
    }
}

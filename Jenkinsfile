pipeline {
    agent any
    environment {
        SCANNER_HOME = tool 'SonarScanner'
    }
    stages {
        stage('Checkout') {
            steps {
                git 'https://github.com/Vidushi-Parashar/sonarqube-cicd-demo'
            }
        }
        stage('SonarQube Analysis') {
            steps {
                withSonarQubeEnv('SonarQubeServer') {
                    sh '''
                    $SCANNER_HOME/bin/sonar-scanner \
                    -Dsonar.projectKey=sonarqube-cicd-demo \
                    -Dsonar.sources=. \
                    -Dsonar.host.url=http://localhost:9000 \
                    -Dsonar.login=squ_911d2f6a756c9c4af137919236dfbb132a58252a
                    '''
                }
            }
        }
    }
}


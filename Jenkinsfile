pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                // Commands for building the application
                echo 'Building..'
                //sh "source ~/.bashrc"
                sh "/opt/apache-maven-3.9.6/bin/mvn clean install"
            }
        }
        stage('Test') {
            steps {
                // Commands for testing the application
                echo 'Testing..'
                sh "pwd"
            }
        }
        stage('sonar code qality Test') {
            steps {
                // Commands for testing the application
                echo 'Testing..'
                sh "export SONAR_TOKEN=057b9d516c44bb3a04e18f6a7d58b314a23a6d93"
                sh "cd target"
                sh "pwd"
                sh "/opt/sonar-scanner-4.4.0.2170-linux/bin/sonar-scanner -Dsonar.organization=sainathdevops -Dsonar.projectKey=sainathdevops_sonar  -Dsonar.sources=target -Dsonar.host.url=https://sonarcloud.io -Dsonar.login=057b9d516c44bb3a04e18f6a7d58b314a23a6d93"
            }
        }
       stage('Docker-build') {
            steps {
                // Commands for testing the application
                sh "pwd"
                sh "docker build -t cipipeline:$BUILD_NUMBER ."
                sh "docker images"
                                       
            }
        }
 stage('Docker-push-ecr') {
            steps {
                // Commands for testing the application
                sh ''' 
export AWS_ACCESS_KEY_ID=AKIAUETGAEZWZA5YKGW5
export AWS_SECRET_ACCESS_KEY=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
export AWS_DEFAULT_REGION=ap-south-1
'''
                sh "aws ecr get-login-password --region ap-south-1 | docker login --username AWS --password-stdin 284755502701.dkr.ecr.ap-south-1.amazonaws.com"
                sh "docker tag cipipeline:$BUILD_NUMBER 284755502701.dkr.ecr.ap-south-1.amazonaws.com/ci-pipeline:$BUILD_NUMBER"
                sh "docker push 284755502701.dkr.ecr.ap-south-1.amazonaws.com/ci-pipeline:$BUILD_NUMBER"
            }
        }


}
}

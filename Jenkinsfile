pipeline {
    agent any
    stages{
        stage('Git Checkout') {
            steps{
                git branch: 'main', credentialsId: 'git-creds', url: 'https://github.com/Tangala123/mvnpractice'
                echo "Pipeline is very simple"
            }
        }
        stage('maven build') {
            steps{
                sh 'mvn clean package'
            }
        }
        stage('tomact deploy') {
            steps{
                sshagent(['tomcat-creds']) {
                    echo "tomacat depolying in jenkins"
                    sh "scp -o strictHostKeyChecking=no target/*.war ec2-user@172.31.29.151:/opt/tomcat9/webapps/"
                    sh "ssh ec2-user@172.31.29.151 /opt/tomcat9/bin/shutdown.sh"
                    sh "ssh ec2-user@172.31.29.151 /opt/tomcat9/bin/startup.sh"
                    }
                
            }
        }
    }
}

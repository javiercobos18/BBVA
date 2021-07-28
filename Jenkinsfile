pipeline {
    agent {
        docker {
            image 'maven:3.8.1-adoptopenjdk-11' 
            args '-v /root/.m2:/root/.m2' 
        }
    }
    stages {
        stage('Build') { 
            steps {
                sh 'mvn -B -DskipTests clean package' 
            }
        }
		stage('Test') { 
            steps {
                sh 'mvn test' 
            }
        }
		stage('Sonar') { 
            steps {
                sh ('''mvn sonar:sonar \
				-Dsonar.projectKey=bbva \
				-Dsonar.host.url=http://35.224.61.71:9000 \
				-Dsonar.login=5e9d95f0071d41f0c0d213eb42133fdf1ece3f62
				''')
            }
        }
		/*stage('Deploy') { 
            steps {
                sh '' 
            }
        }*/
    }
}

pipeline {
     agent { node{ label 'master' } }
    stages {
		stage('Branch') { 
			agent { node{ label 'master' } }

            steps {
                sh 'git branch -a' 
            }
        }
	
        stage('Build') { 
			agent {
				docker {
					image 'maven:3.8.1-adoptopenjdk-11' 
					args '-v /root/.m2:/root/.m2' 
				}
			}
            steps {
                sh 'mvn -B -DskipTests clean package' 
            }
        }
		stage('Test') { 
			agent {
				docker {
					image 'maven:3.8.1-adoptopenjdk-11' 
					args '-v /root/.m2:/root/.m2' 
				}
			}
            steps {
                sh 'mvn test' 
            }
        }
		stage('Sonar') {
			agent {	
				docker {
					image 'maven:3.8.1-adoptopenjdk-11' 
					args '-v /root/.m2:/root/.m2' 
				}
			}
		
            steps {
                sh ('''mvn sonar:sonar \
				-Dsonar.projectKey=bbva \
				-Dsonar.host.url=http://35.224.61.71:9000 \
				-Dsonar.login=5e9d95f0071d41f0c0d213eb42133fdf1ece3f62
				''')
            }
        }
		stage('Deploy') {
				agent { node{ label 'master' } }
		
            steps {
                sh ('''
					docker build -t page .
				''')
            }
        }
    }
}

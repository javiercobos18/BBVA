pipeline {
    agent { label 'master' }
             environment {
                WORKSPACE = "${WORKSPACE}" 
                }
    stages {
        stage('Checkout - Build') {
            steps {
                sh ('mvn package' )
                 echo 'Construccion componente OSB..'
            }
        }
        /*stage('Test') {
            steps {
                sh 'mvn test'
            }
        }
        stage('Deploy') {
            steps {
                echo 'deploy'
            }
        }*/
      }
    } 

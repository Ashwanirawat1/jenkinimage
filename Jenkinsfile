pipeline {
    agent any
    environment {
        //once you sign up for Docker hub, use that user_id here
        registry = "ashwanirawat1/mypythonapp"
        //- update your credentials ID after creating credentials for connecting to Docker Hub
        registryCredential = '7560fa7a-8ff1-4033-8c8b-cec3c9b06422'
        dockerImage = ''
    }

    stages {
        stage('Cloning Git') {
            steps {
                checkout([$class: 'GitSCM', branches: [[name: '*/main']], doGenerateSubmoduleConfigurations: false, extensions: [], submoduleCfg: [], userRemoteConfigs: [[credentialsId: '', url: 'https://github.com/Ashwanirawat1/jenkinimage.git']]])
            }
        }

    // Building Docker images
    stage('Building image') {
      steps{
        script {
          dockerImage = docker.build registry
        }
      }
    }

     // Uploading Docker images into Docker Hub
    stage('Upload Image') {
     steps{
         script {
            docker.withRegistry( '', registryCredential ) {
            dockerImage.push()
            }
        }
      }
    }

    // Running Docker container, make sure port 8096 is opened in
    stage('Docker Run') {
     steps{
         script {
            bat "docker run %registry%"
         }
      }
    }
  }
}
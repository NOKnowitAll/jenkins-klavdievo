pipelineTriggers([
      [$class: "GitHubPushTrigger"]
    ])

pipeline {
    agent any
      options {
        skipStagesAfterUnstable()
    }
   stages {
     stage('Checkout SCM') {
            steps {
                checkout([
                 $class: 'GitSCM',
                 branches: [[name: 'master']],
                 userRemoteConfigs: [[
                    url: 'git@github.com:NOKnowitAll/final-project-klavdievo.git',
                    credentialsId: 'GitHub_credentials',
                 ]]
                ])
            }
        }
     stage('Clone git repository') {
        steps {
          script {
	    git branch: 'main', credentialsId: 'GitHub_credentials', url: 'git@github.com:NOKnowitAll/final-project-klavdievo.git'
            sh "ls -la"
            }
        }
     }
     stage ('Copy final projects file to Target Server') {
       steps {
        sshagent(credentials : ['prodserver_credentials']) {
            sh '''
              ssh -o StrictHostKeyChecking=no ubuntu@192.168.88.171 uptime
              ssh -v ubuntu@192.168.88.171
              ssh ubuntu@192.168.88.171 "mkdir -p /home/ubuntu/fp_klavdievo"
              scp -r ./* ubuntu@192.168.88.171:/home/ubuntu/fp_klavdievo
	      ssh ubuntu@192.168.88.171 "ls -la"
             '''
            }
         }
      }
      stage('Clone docker repository') {
        steps {
          script {
            git branch: 'main', credentialsId: 'GitHub_credentials', url: 'https://github.com/NOKnowitAll/jenkins-klavdievo.git'
            sh "ls -la"
            }
        }
     }
      stage('Build Docker Image'){
       steps {
         sshagent(credentials : ['prodserver_credentials']) {
           sh '''
             ssh ubuntu@192.168.88.171 'yes | docker system prune --all --volumes'
             scp ./Dockerfile ubuntu@192.168.88.171:/home/ubuntu
             ssh ubuntu@192.168.88.171 "docker rm -f klavdievo"
	     ssh ubuntu@192.168.88.171 "docker build -t apache_image:$BUILD_ID ."
             ssh ubuntu@192.168.88.171 "docker run -d -p 80:80 -t --restart unless-stopped --name klavdievo apache_image:$BUILD_ID"
             '''
          }
       }
     }

  }
}

pipeline {
    agent any
    stages{
        stage("SSH"){
            steps{
                script{                    
                    withCredentials([sshUserPrivateKey(credentialsId: 'oci-frontend', keyFileVariable: 'PK',  usernameVariable: 'userName')]) {
                        def remote = [:];
                        remote.name = env.DEVOPS_IP;
                        remote.host = env.DEVOPS_IP;
                        remote.user = userName;
                        remote.identityFile = PK;
                        remote.allowAnyHosts = true;
                        sshCommand remote: remote, command: "cd angular/emp-frontend && ./deploy-frontend.sh"

                    }
                }
            }
        }
   }
}
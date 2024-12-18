pipeline {
    agent any

    stages{
        stage("SSH-Test"){
            steps{
                script{
                    
                 withCredentials([sshUserPrivateKey(credentialsId: 'oci-frontend', usernameVariable: 'opc')]) {
                    def remote = [:];
                    remote.name = env.DEVOPS_IP;
                    remote.host = env.DEVOPS_IP;
                    remote.user = opc;
                    // remote.password = env.REMOTE_PASSWORD;
                    remote.allowAnyHosts = true;
                    sshCommand remote: remote, command: "cd angular && ./deploy-frontend.sh"

                 }
                //sshCommand remote: remote, command: "ls"
                // sshCommand remote: remote, command: "mvn clean install"
                }
            }
    }
   }
}
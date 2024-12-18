pipeline {
    agent any

    stages{
        stage("SSH-Test"){
            steps{
                script{
                    
                 withCredentials([sshUserPrivateKey(credentialsId: 'oci-frontend', keyFileVariable: 'PK')]) {
                    def remote = [:];
                    remote.name = "192.9.243.156";
                    remote.host = "192.9.243.156";
                    remote.user = "opc";
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
pipeline {
    agent any

    stages{
        stage("SSH-Test"){
            steps{
                script{
                    sshagent(credentials: ['oci-frontend']) {
                        sh '''
                            ssh  opc@192.9.243.156
                        cd angular/emp-frontend && ./deploy-frontend.sh
                        '''
                        }
                //  withCredentials([sshUserPrivateKey(credentialsId: 'oci-frontend', keyFileVariable: 'file')]) {
                //     sh '''
                //         ssh  opc@192.9.243.156
                //         cd angular/emp-frontend && ./deploy-frontend.sh
                //     '''
                //     // def remote = [:];
                //     // remote.name = env.DEVOPS_IP;
                //     // remote.host = env.DEVOPS_IP;
                //     // // remote.user = env.REMOTE_USER;
                //     // // remote.password = env.REMOTE_PASSWORD;
                //     // remote.allowAnyHosts = true;
                //     // sshCommand remote: remote, command: "cd angular && ./deploy-frontend.sh"

                //  }

                }
            }
    }
   }
}
pipeline {
    agent any

    stages{
        stage("SSH-Test"){
            steps{
                script{
                    def remote = [:];
                remote.name = '192.168.62.11';
                remote.host = '192.168.62.11';
                remote.user = 'donkey';
                remote.password = 'donkey';
                remote.allowAnyHosts = true;

                sshCommand remote: remote, command: "cd angular && ./deploy-frontend.sh"
                //sshCommand remote: remote, command: "ls"
                // sshCommand remote: remote, command: "mvn clean install"
                }
            }
    }
   }
}
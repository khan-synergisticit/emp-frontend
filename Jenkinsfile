pipeline {
    agent none
    stages{        
        stage("SSH"){
            agent any
            steps{
                script{                    
                    withCredentials([sshUserPrivateKey(credentialsId: 'emp-key', keyFileVariable: 'PK',  usernameVariable: 'userName')]) {
                        def remote = [:];
                        remote.name = "34.171.212.75";
                        remote.host = "34.171.212.75";
                        remote.user = userName;
                        remote.identityFile = PK;
                        remote.allowAnyHosts = true;
                        sshCommand remote: remote, command: "cd emp-frontend && ./deploy-frontend.sh"

                    }
                }
            }
        }
        stage("GKE"){
            agent{
                kubernetes{
                    cloud "gcp-kube"
                }
            }
            steps{
                script{
                    withCredentials([file(credentialsId: 'sa-key', variable: 'SERVICE_ACCOUNT_KEY')]) {
                    sh 'gcloud auth activate-service-account --key-file=$SERVICE_ACCOUNT_KEY'
                    sh "gcloud container clusters get-credentials ${env.CLUSTER_NAME} --zone ${env.CLUSTER_REGION} --project ${env.CLUSTER_PROJECT}"
                    sh 'kubectl set image deployments/emp-frontend emp-frontend=docker.io/khanster/emp-fronend:latest'
                    }
                }
            }
        }
    }
        
}
    // post{
    //     always{
    //         cleanWs()
    //         deleteDir()
    //     }
    // }

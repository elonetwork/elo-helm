#this code is executed in the bastion to install necessary files and gives a gide 
#about the steps that needs to be done to start playing around

az login --use-device-code
git clone https://github.com/elonetwork/elo-helm.git

cd elo-helm/
git switch feat/elhajjout-abderrahman
cd Terragrunt/


#//todo change values of resource group and other values


ssh-keygen -t rsa -b 4096
terragrunt  run-all apply  --terragrunt-exclude-dir "**/.terragrunt-cache/**/*"  --terragrunt-exclude-dir "./cluster_components/**/*"

#//todo set cluster connection 

az aks get-credentials --admin --resource-group resource_group_name --name prd_aks_cluster
export KUBE_CONFIG_PATH=~/.kube/config 

cd /home/adminuser/elo-helm/Terragrunt/cluster_components/agic
terragrunt apply --auto-approve
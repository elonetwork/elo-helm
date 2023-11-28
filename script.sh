az login --use-device-code
git clone https://github.com/elonetwork/elo-helm.git

cd elo-helm/
git switch fat/elhajjout-abderrahman
cd Terragrunt/
#//todo change values of resource group and other values
terragrunt  run-all apply  --terragrunt-exclude-dir "**/.terragrunt-cache/**/*"  --terragrunt-exclude-dir "./cluster_components/**/*"

#//todo set cluster connection 

az aks get-credentials --admin --resource-group 1-23444576-playground-sandbox --name prd_aks_cluster
export KUBE_CONFIG_PATH=~/.kube/config 

cd /home/adminuser/elo-helm/Terragrunt/cluster_components/agic
terragrunt apply --auto-approve
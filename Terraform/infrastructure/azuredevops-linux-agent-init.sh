#!/bin/bash
sudo apt-get update

# install azure cli
curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash

#install kubectl
curl -LO https://dl.k8s.io/release/$(curl -Ls https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl 
chmod +x ./kubectl
sudo mv ./kubectl /usr/local/bin/kubectl

#install docker on jammy Jellyfish
sudo apt-get update
sudo apt install -y ca-certificates curl apt-transport-https
sudo install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
sudo chmod a+r /etc/apt/keyrings/docker.gpg
echo   "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
"$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" |   sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt update
sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-compose
sudo usermod -aG docker $USER


wget https://vstsagentpackage.azureedge.net/agent/3.230.0/vsts-agent-linux-x64-3.230.0.tar.gz
mkdir myagent && cd myagent
sleep 6
tar zxvf ~/vsts-agent-linux-x64-3.230.0.tar.gz


#
# ./config.sh 


# sudo ./svc.sh install adminuser
# sudo ./svc.sh start
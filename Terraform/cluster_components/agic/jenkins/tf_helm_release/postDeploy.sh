POD_NAME=$(kubectl get pods -l app=jenkins-server -o jsonpath='{.items[0].metadata.name}' --field-selector=status.phase=Running)
POD_ID=$(kubectl get pod $POD_NAME -o jsonpath='{.status.containerStatuses[0].containerID}' | cut -d'/' -f3)
kubectl exec -it $POD_NAME -- /bin/sh -c "sed -i 's/<excludeClientIPFromCrumb>false<\/excludeClientIPFromCrumb>/<excludeClientIPFromCrumb>true<\/excludeClientIPFromCrumb>/' /var/jenkins_home/config.xml"
kubectl rollout restart deployment jenkins



POD_NAME=$(kubectl get pods -l app=jenkins-server -o jsonpath='{.items[0].metadata.name}' --field-selector=status.phase=Running)
kubectl exec -it $(echo $POD_NAME) -- /bin/bash

POD_NAME=$(kubectl get pods -l app=jenkins-server -o jsonpath='{.items[0].metadata.name}' --field-selector=status.phase=Running)
POD_ID=$(kubectl get pod $POD_NAME -o jsonpath='{.status.containerStatuses[0].containerID}' | cut -d'/' -f3)
kubectl exec -it $POD_NAME -- /bin/sh -c "sed -i 's/<excludeClientIPFromCrumb>false<\/excludeClientIPFromCrumb>/<excludeClientIPFromCrumb>true<\/excludeClientIPFromCrumb>/' /var/jenkins_home/config.xml"
kubectl rollout restart deployment jenkins



POD_NAME=$(kubectl get pods -l app=jenkins-server -o jsonpath='{.items[0].metadata.name}' --field-selector=status.phase=Running)
kubectl exec -it $(echo $POD_NAME) -- /bin/bash

#install docker on jammy Jellyfish
sudo apt-get update
sudo apt install ca-certificates curl apt-transport-https
sudo install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
sudo chmod a+r /etc/apt/keyrings/docker.gpg
echo   "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
"$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" |   sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt update
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-compose
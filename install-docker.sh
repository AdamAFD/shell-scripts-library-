#!/bin/bash
echo enter your os name :
OS_Dist=$1

    if [[ $OS_Dist="ubuntu" || $OS_Dist="debian" ]]
    then
        

        sudo apt-get update
        sudo apt-get install
        
        sudo apt-get install docker-ce docker-ce-cli containerd.io docker-compose-plugin
        sudo docker --version

sudo groupadd docker
sudo usermod -aG docker $USER
newgrp docker
docker run hello-world


    elif [[ $OS_Dist="centos" || $OS_Dist="rhel" ]]
    then

       sudo yum install -y yum-utils
       sudo yum-config-manager \
       --add-repo \
       https://download.docker.com/linux/centos/docker-ce.repo
       sudo yum install docker-ce docker-ce-cli containerd.io docker-compose-plugin
       sudo systemctl start docker
       sudo docker --version

sudo groupadd docker
sudo usermod -aG docker $USER
newgrp docker
docker run hello-world
        
    else
        echo "Can not identify Linux distrbution."
    fi

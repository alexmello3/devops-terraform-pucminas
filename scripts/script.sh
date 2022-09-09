#!/bin/bash

# Montar o EFS no diretório /www
sudo apt install nfs-common zip -y
sudo mkdir -p /www
sudo mount -t nfs4 -o nfsvers=4.1,rsize=1048576,wsize=1048576,hard,timeo=600,retrans=2,noresvport 10.0.1.254:/ /www

# Fazer download do template e colocar no EFS montado em /www
sudo chmod 755 /www
sudo wget https://www.free-css.com/assets/files/free-css-templates/download/page274/salient.zip -O /www/salient.zip
sudo unzip /www/salient.zip -d /www/
sudo mv /www/salient/* /www/

# Instalar o Docker
sudo curl -sSL https://get.docker.com/ | sh

# Rodar a imagem padrão do NGINX usando o EFS montado em /www como diretório para o site
sudo docker run -d --name nginx -v /www:/usr/share/nginx/html -p 80:80 nginx
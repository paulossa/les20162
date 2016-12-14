#!/bin/bash

export LC_ALL=C
apt-get update
apt-get install -y postgresql-9.5 postgresql-server-dev-9.5 unzip wget

wget https://github.com/paulossa/les20162/archive/master.zip
unzip master.zip
cd les20162-master/ingrails
curl -s "https://get.sdkman.io" | bash
source "$HOME/.sdkman/bin/sdkman-init.sh"


sudo -u postgres psql -c "create user postgres with password 'postgres';"
sudo -u postgres psql -c "create database povmt owner postgres encoding 'utf-8';"
sudo -u postgres psql -c "create database syscit_dev owner postgres encoding 'utf-8';"

grails run-app

wget -qO - https://www.mongodb.org/static/pgp/server-3.2.asc | sudo apt-key add -
echo "deb http://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/3.2 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-3.2.list
sudo apt-get update -y
sudo apt-get upgrade -y

sudo apt-get install -y mongodb-org=3.2.20 mongodb-org-server=3.2.20 mongodb-org-shell=3.2.20 mongodb-org-mongos=3.2.20 mongodb-org-tools=3.2.20

# sudo service mongod start
# sudo systemctl enable mongod.service

#Linking the mongod file by removing it, adding it in our home machine whilst syncing it in vagrantfile and restarting + enabling it
sudo rm /etc/mongod.conf

# Link between the files and override the old file /etc/mongod.conf
sudo ln -s /home/ubuntu/environment/db/mongod.conf /etc/mongod.conf

sudo systemctl restart mongod
sudo systemctl enable mongod

cd ~

sudo add-apt-repository ppa:deadsnakes/ppa -y
sudo apt-get update

sudo apt-get install python3.7 libpython3.7-dev python3-all-dev -y


sudo apt install virtualenv -y
sudo apt install postgresql -y
sudo apt install uwsgi -y
sudo apt-get install build-essential python3-dev -y

# Required for 2.11 and above.
sudo apt-get install libpangocairo-1.0-0 -y

### Setup Node
 ### insatalling node.
 sudo apt-get install npm -y

 ## installing NVM
 curl https://raw.githubusercontent.com/creationix/nvm/master/install.sh | bash

 source ~/.bash_profile
 source ~/.bashrc
 nvm install v12

### Setup Code 
 mkdir -p ~/code/backend
 cd ~/code/backend
 virtualenv -p python3.7 venv
 source ~/code/backend/venv/bin/activate
 git clone https://github.com/mirumee/saleor.git --recursive --jobs 3
 cd saleor
 git fetch origin 2.10:2.10 && git checkout 2.10
 pip install -r requirements.txt

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

 source ~/.profile 
 source ~/.bashrc
 nvm install v12

### Setup Code 
 mkdir -p ~/code/backend
 cd ~/code/backend
 virtualenv -p python3.7 venv
 source ~/code/backend/venv/bin/activate
 git clone https://github.com/mirumee/saleor.git --recursive
 cd saleor
 git fetch origin 2.10:2.10 && git checkout 2.10
 pip install -r requirements.txt

### settiing up postgres user.
 sudo su - postgres
 psql

 CREATE ROLE saleor WITH LOGIN PASSWORD 'saleor';
 CREATE DATABASE saleor;
 ALTER USER saleor WITH SUPERUSER;

 exit


IP="34.221.197.60"

cd ~/code/backend/saleor
source ~/code/backend/venv/bin/activate
export ALLOWED_HOSTS=$IP
export ALLOWED_CLIENT_HOSTS=$IP
export DEBUG=True
export SECRET_KEY=123456
export INTERNAL_IPS=127.0.0.1,$IP,
export API_URI=http://$IP:8000/graphql/
export APP_MOUNT_URI=/dashboard/
export DEFAULT_COUNTRY=IN
export DEFAULT_CURRENCY=INR

### Applying migrations
 python manage.py migrate

## create dummy data
 python manage.py populatedb
 
## Create superuser
 python manage.py createsuperuser

## runserver
python manage.py runserver 0.0.0.0:8000
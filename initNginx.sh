## Removes all but config files.
 #sudo apt-get remove nginx nginx-common

## Removes everything.
 #sudo apt-get purge nginx nginx-common
 #sudo apt-get autoremove



sudo apt-get install nginx -y

source ~/code/backend/venv/bin/activate

cp nginx-config-files/uwsgi_params ~/code/backend/saleor

cp nginx-config-files/saleor.config /etc/nginx/sites-available/

sudo ln -s /etc/nginx/sites-available/saleor.conf /etc/nginx/sites-enabled/

sudo /etc/init.d/nginx start    # start nginx
#sudo /etc/init.d/nginx restart # restart nginx

cd ~/code/backend/saleor
uwsgi --socket mysite.sock --module saleor.wsgi --chmod-socket=666
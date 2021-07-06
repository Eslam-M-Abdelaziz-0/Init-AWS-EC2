## Removes all but config files.
 #sudo apt-get remove nginx nginx-common

## Removes everything.
 #sudo apt-get purge nginx nginx-common
 #sudo apt-get autoremove



sudo apt-get install nginx -y

source ~/code/backend/venv/bin/activate

rm /etc/nginx/conf.d/default.conf
cp nginx/nginx.conf /etc/nginx/conf.d

sudo /etc/init.d/nginx start    # start nginx
#sudo /etc/init.d/nginx restart # restart nginx


#uwsgi --http :8000 --module saleor.wsgi
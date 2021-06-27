
sudo apt-get install nginx -y
sudo /etc/init.d/nginx start    # start nginx

source ~/code/backend/venv/bin/activate

mv nginx-config-files/uwsgi_params ~/code/backend/saleor/uwsgi_params

mv nginx-config-files/saleor.config /etc/nginx/sites-available/saleor.conf

sudo ln -s /etc/nginx/sites-available/saleor.conf /etc/nginx/sites-enabled/

sudo /etc/init.d/nginx restart # restart nginx

cd ~/code/backend/saleor
uwsgi --socket mysite.sock --module saleor.wsgi --chmod-socket=666
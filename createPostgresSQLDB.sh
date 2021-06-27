


### settiing up postgres user.
 su -c "CREATE ROLE saleor WITH LOGIN PASSWORD 'saleor';" postgres
 su -c "CREATE DATABASE saleor;" postgres
 su -c "ALTER USER saleor WITH SUPERUSER;" postgres


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
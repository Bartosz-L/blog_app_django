
**1. Docker** ([https://www.docker.com/] )  
Install Docker locally. Tested on: Docker Desktop community, Version 2.1.7.0 (41536), Channel edge

**2. Build from docker image**  
`docker-compose build`

**3. Migrations and superuser**  
`docker-compose run web python manage.py makemigrations blog`  
`docker-compose run web python manage.py migrate`  
`docker-compose run web python manage.py createsuperuser`

**4. Run app**  
`docker-compose up`  

**4. Stop app**  
`docker-compose stop`  
command will stop your containers, but it won’t remove them  
`docker-compose down`  
command will stop your containers, but it also removes the stopped containers as well as any networks that were created





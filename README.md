# README

For running with docker:

For setup application use next commands: 
```
    sudo docker-compose build
    sudo docker-compose run web rake db:create
    sudo docker-compose run web rake db:migrate
    sudo docker-compose up
```

App should now be running on port 3000 on your Docker daemon.

On Docker for Mac and Docker for Windows, go to http://localhost:3000 on a web browser

For run tests use 
```
    sudo docker-compose run web rails test
```

Also application is deployed to heroku: https://boiling-oasis-85793.herokuapp.com/ 
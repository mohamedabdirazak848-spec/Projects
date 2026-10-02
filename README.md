# My First Websites

A simple HTML and CSS website served with Nginx and Docker, deployed on a DigitalOcean droplet.

## Docker Hub

#### https://hub.docker.com/r/mohamedabdirazak/my_first_website 
#### https://hub.docker.com/r/mohamedabdirazak/challenge_task 
#### https://hub.docker.com/r/mohamedabdirazak/my_first_page 

## Pull the Image

#### ```docker pull mohamedabdirazak/my_first_website```
#### ```docker pull mohamedabdirazak/challenge_task```
#### ```docker pull mohamedabdirazak/my_first_page```

## Run It

#### ```docker run -d -p 80:80 mohamedabdirazak/my_first_website```
#### ```docker run -d -p 8080:80 mohamedabdirazak/challenge_task```
#### ```docker run -d -p 8081:80 mohamedabdirazak/my_first_page```

Then visit `localhost:<port number>` in your browser.

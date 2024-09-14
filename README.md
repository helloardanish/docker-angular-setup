## Create an angular project without installing angular

#### Run the following commands to setup in your machine

```
git clone git@github.com:helloardanish/docker-angular-setup.git

cd docker-angular-setup

docker compose up

docker exec -it docker-angular-setup-frontend-1 bash

ng new reslin

# move the project directory in desired directory
```

## Setup live change

#### Create Dockerfile in angular project directory

```
# Dockerfile
FROM node:22

# Set the working directory in the container
WORKDIR /app

# Copy only package.json and package-lock.json first to leverage Docker's cache
COPY package*.json ./

# Install Angular CLI globally and project dependencies
RUN npm install -g @angular/cli \
    && npm install

# Copy the rest of the application
COPY . .

# Disable Angular analytics to prevent prompts
# RUN npx ng analytics off

# Expose port 4200 for the Angular app
EXPOSE 4200

# Start the Angular application
CMD ["npm", "run", "start"]
```


#### Change package.json file start script

```
"start": "ng serve",
# To
"start": "ng serve --host 0.0.0.0",
```


#### Add analytics to false in angular.json file else it will keep waiting for inputs

```
"cli": {
    "analytics": false
  },
```

#### Create compose.yaml file

```
services:
  angular-app:
    build:
      context: ./test-angular-app
      dockerfile: Dockerfile
    ports:
      - "4200:4200"
    volumes:
      - ./test-angular-app:/app  # Mount the current directory to /app in the container
    stdin_open: true  # Allow running commands interactively
    tty: true  # Keep the container running
```

#### Run it:

```
docker-compose up --build
```

It should detect the changes instantly now, feels like working on local development.

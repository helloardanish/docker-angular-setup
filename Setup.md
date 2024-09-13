# Step 1: Write docker file

```
FROM node:22

WORKDIR /app

RUN npm install -g @angular/cli

CMD ["tail", "-f", "/dev/null"]

```

# Step 2: Write compose file (using docker compose v2)

```
services:
  frontend:
    build: .
    ports:
      - "4200:4200"
    volumes:
      - ".:/app" #sync local folder with container

    stdin_open: true
    tty: true

```

# Step 3: Build the image

```
docker compose build
```

# Step 4: Run the image using compose

```
docker compose up
docker compose up -d
docker-compose up --build
```

# Step 5: Access bash inside container


```
docker exec -it <running <ID or Name>> bash
docker exec -it docker-project-setup-frontend-1 bash
```

To get id or name of the runnning container use below command:

```
docker ps
```

or use docker desktop to view the image and get the name.


# Step 6: Create the angular projects

```
ng new test-angular-app
```

# Step 7: Run the angular projects

```
cd test-angular-app/
ng serve --host 0.0.0.0
```

# Step 8: Verify in the browser


## To run just run below command

```
docker-compose up --build
```

### Take machine access to generate component and services.

```
docker ps #get the image name/id
docker exec -it docker-angular-setup-angular-app-1 bash
```

```
ng g c home
```

Change sync with local work space
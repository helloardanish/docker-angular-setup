FROM node:22

WORKDIR /app

RUN npm install -g @angular/cli

CMD ["tail", "-f", "/dev/null"]

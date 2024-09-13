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
# Use a base image with Node.js pre-installed
FROM node:14-alpine

# Set the working directory inside the container
WORKDIR /app

# Copy package.json and package-lock.json (if available) to the container
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application code to the container
COPY . .

# Build the Vue.js application for production
RUN npm run build

# Expose port 80 to the outside world
EXPOSE 80

# Define the command to run the application
CMD ["npm", "run", "serve"]

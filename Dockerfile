# Set the base image
FROM node:14

# Set working directory in container
WORKDIR /app

# Copy all items in the host working directory to the working directory in container
COPY . .

# Set environment variables
ENV NODE_ENV=production DB_HOST=item-db

# Install dependencies for production and build the project
RUN npm install --production --unsafe-perm && npm run build

# Expose port 8080
EXPOSE 8080

# Command to be executed
CMD [ "npm", "start" ]
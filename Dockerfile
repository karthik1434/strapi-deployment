# Use official Node.js image as base
FROM node:18-alpine

# Set working directory inside the container
WORKDIR /app

# Copy only package.json and package-lock.json from the Strapi folder
COPY strapi/package.json ./

# Install Strapi dependencies
RUN npm install --only=production

# Copy the entire Strapi backend app
COPY strapi/ ./

# Expose the default Strapi port
EXPOSE 1337

# Start the Strapi server
CMD ["npm", "run", "start"]

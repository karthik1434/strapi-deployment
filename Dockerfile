# Use official Strapi image with Node.js
FROM strapi/base:latest

# Create and set working directory
RUN mkdir -p /srv/app
WORKDIR /srv/app

# Create package.json manually
RUN printf '{
  "name": "strapi-app",
  "version": "1.0.0",
  "description": "Generated from Dockerfile",
  "scripts": {
    "start": "strapi start",
    "build": "strapi build"
  },
  "dependencies": {
    "strapi": "latest"
  }
}' > package.json

# Install dependencies
RUN npm install --production && npm cache clean --force

# Copy rest of your app (optional, based on context)
# COPY . .

# Build the Strapi app
RUN npm run build

# Environment variables
ENV NODE_ENV=production
ENV PORT=1337

# Expose port
EXPOSE 1337

# Start the app
CMD ["npm", "start"]

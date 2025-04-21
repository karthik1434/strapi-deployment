# Use official Node.js base image
FROM node:18-alpine

# Install git and other dependencies
RUN apk add --no-cache git bash python3 make g++ && \
    git config --global url."https://github.com/".insteadOf git@github.com:

# Set working directory
WORKDIR /app

# Clone Strapi
RUN git clone https://github.com/strapi/strapi.git .

# Install dependencies
RUN yarn install

# Build Strapi
RUN yarn build

# Expose default Strapi port
EXPOSE 1337

# Start the Strapi app
CMD ["yarn", "develop"]

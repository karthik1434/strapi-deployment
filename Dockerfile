# Use official Strapi image with Node.js
FROM strapi/base:latest

# Create and set working directory
RUN mkdir -p /srv/app
WORKDIR /srv/app

# Copy package files first for better caching
COPY package*.json ./

# Install dependencies
RUN npm install --production && npm cache clean --force

# Copy all other files
COPY . .

# Build the Strapi app (if needed)
RUN npm run build

# Environment variables
ENV NODE_ENV=production
ENV PORT=1337

# Expose port
EXPOSE 1337

# Start command
CMD ["npm", "start"]
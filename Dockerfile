# Use official Strapi image
FROM strapi/strapi:latest

# Set working directory explicitly (important!)
WORKDIR /srv/app

# Copy package.json and lock file
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the Strapi app
COPY . .

# Set environment (optional if you handle via docker run)
ENV NODE_ENV=production

# Expose the default port
EXPOSE 1337

# Start the app
CMD ["npm", "start"]
# Use official Strapi v3.6 image
FROM strapi/strapi:3.6



# Copy package.json first for better layer caching
COPY package*.json ./
RUN npm install

# Copy the rest of the application
COPY . .

# Build Strapi (if needed)
# RUN npm run build

ENV NODE_ENV=production

EXPOSE 1337

CMD ["npm", "start"]
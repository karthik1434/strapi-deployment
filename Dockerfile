FROM strapi/strapi:4.1.5

WORKDIR /app

COPY . .

RUN npm install

ENV NODE_ENV production

RUN npm run build

EXPOSE 1337

CMD ["npm", "run", "start"]
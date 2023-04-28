FROM node:current-alpine
WORKDIR /app

COPY package*.json ./
RUN npm install --force

COPY . .
CMD ["npm","start"]
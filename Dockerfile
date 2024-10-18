FROM node:14
WORKDIR /usr/src/app
COPY . /usr/src/app
RUN npm install 
COPY package*.json ./
EXPOSE 3000
CMD ["node", "server.js"]
SHELL ["/bin/bash", "-c"]
USER node









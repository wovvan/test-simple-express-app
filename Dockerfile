FROM node
USER shelterzoom
RUN whoami
RUN apt-get update && apt-get install -y supervisor
RUN mkdir -p /var/log/supervisor
COPY etc/supervisor/shelterZoom.conf /etc/supervisor/conf.d/shelterZoom.conf

WORKDIR /usr/src/app

# Install app dependencies
# A wildcard is used to ensure both package.json AND package-lock.json are copied
# where available (npm@5+)
COPY package*.json ./

RUN npm install
# If you are building your code for production
# RUN npm install --only=production

# Bundle app source
COPY . .

EXPOSE 3000
CMD [ "/usr/bin/supervisord" ]
FROM node
RUN useradd -d /home/shelterzoom -ms /bin/bash -g root -G sudo -p shelterzoom shelterzoom
USER shelterzoom
WORKDIR /home/shelterzoom
RUN apt-get update && apt-get install -y supervisor
RUN mkdir -p /var/log/supervisor
COPY etc/supervisor/shelterZoom.conf /etc/supervisor/conf.d/shelterZoom.conf



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
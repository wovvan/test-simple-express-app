FROM node
RUN apt-get update && apt-get install -y supervisor
RUN mkdir -p /var/log/supervisor
COPY etc/supervisor/shelterZoom.conf /etc/supervisor/conf.d/shelterZoom.conf
#COPY etc/supervisor/shelterZoom.conf /root/shelterZoom.conf

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
#CMD [ "/bin/bash" ]
CMD [ "/usr/bin/supervisord", "-c /etc/supervisor/conf.d/shelterZoom.conf" ]
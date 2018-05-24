FROM node
RUN apt-get update
RUN apt-get install -y python-pip
RUN pip install supervisor
RUN mkdir /var/log/supervisor/
ADD etc/supervisor/shelterZoom.conf /etc/supervisor/conf.d/
ADD etc/supervisor/supervisord.conf /etc/supervisor/

WORKDIR /usr/src/app

COPY package*.json ./

RUN npm install
COPY . .

EXPOSE 3000
#CMD supervisord -c /etc/supervisor/supervisord.conf
CMD ["supervisord"]
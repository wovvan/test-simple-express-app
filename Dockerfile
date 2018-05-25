FROM node
RUN apt-get update

RUN apt-get install -y xvfb wkhtmltopdf

#Install Graphicsmagick for convert pdf to png
RUN apt-get install -y python-software-properties
RUN apt-get install -y software-properties-common
RUN add-apt-repository ppa:rwky/graphicsmagick
RUN apt-get update
RUN apt-get install -y graphicsmagick



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
FROM node:10

RUN npm install -g bower -y
RUN npm install -g cnpm --registry=https://registry.npm.taobao.org
RUN git clone https://github.com/mgicode/ether-browser.git --depth 1


#COPY explorer/  /explorer/;
#RUN chmod 777   /explorer/
#RUN ls -la /explorer/*

WORKDIR /ether-browser/

RUN bower install --allow-root   --config.interactive
RUN bower install angular --save-dev  --allow-root   --config.interactive
RUN yarn install
#RUN npm install -g grunt-cli
#RUN grunt

EXPOSE 8000

CMD ["npm", "start"]


#docker rmi -f ether_browser
#docker build  -t ether_browser  .
#docker rm -f ether_browser

#docker run --name  ether_browser   -p:8000:8000  -e  ETH_NODE_URL='http://192.168.0.110:8645'  ether_browser


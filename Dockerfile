FROM jamesalbert/node8-python36

ENV HOST localhost
ENV PORT 3000

# Install GYP dependencies globally, will be used to code build other dependencies
RUN npm install -g --production node-gyp && \
    npm cache clean --force
ADD package.json /package.json
RUN npm install --production && \
    npm install --production redis@0.10.0 talib@1.0.2 tulind@0.8.7 pg && \
    npm cache clean --force

ADD optimizer/requirements.txt /requirements.txt
RUN pip install -r /requirements.txt
WORKDIR /usr/src/app

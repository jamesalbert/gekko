#!/bin/bash

if [ -d /node_modules ]; then
  mv /node_modules /usr/src/app
fi

sed -i 's/127.0.0.1/0.0.0.0/g' /usr/src/app/web/vue/UIconfig.js
sed -i 's/localhost/'${HOST}'/g' /usr/src/app/web/vue/UIconfig.js
sed -i 's/3000/'${PORT}'/g' /usr/src/app/web/vue/UIconfig.js

npm start

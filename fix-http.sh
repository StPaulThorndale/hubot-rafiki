#!/bin/sh

DIR=/opt/hubot-rafiki
HTTP_MODULE_PATH="$DIR/node_modules/scoped-http-client/src/index.js"
sed -i 's|https = require('\''https'\'');|https = require('\''http'\'');|' $HTTP_MODULE_PATH
sed -i 's|port: port,|port: 8080,|' $HTTP_MODULE_PATH
sed -i 's|host: this.options.hostname,|host: '\''web-proxy.corp.hpecorp.net'\'',|' $HTTP_MODULE_PATH
sed -i 's|path: this.fullPath(),|path: '\''http://'\'' + this.options.hostname + this.fullPath(),|' $HTTP_MODULE_PATH


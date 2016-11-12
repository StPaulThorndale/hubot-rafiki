#!/bin/sh
#
# Fix the scoped-http-client connection parameters
#

# Set parameters
DIR="./"
PROXY_HOST="web-proxy.company.com"
PROXY_PORT="8080"

# Modify configuration
HTTP_MODULE_PATH="$DIR/node_modules/scoped-http-client/src/index.js"
sed -i 's|https = require('\''https'\'');|https = require('\''http'\'');|' $HTTP_MODULE_PATH
sed -i 's|port: port,|port: $PROXY_PORT,|' $HTTP_MODULE_PATH
sed -i 's|host: this.options.hostname,|host: '\''$PROXY_HOST'\'',|' $HTTP_MODULE_PATH
sed -i 's|path: this.fullPath(),|path: '\''http://'\'' + this.options.hostname + this.fullPath(),|' $HTTP_MODULE_PATH

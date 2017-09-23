#!/bin/bash
#
# pkill -f nono

HUBOT_HOME_DIR=./
HUBOT_BIN='bin/hubot'
HUBOT_LOGS_DIR=./logs

cd ${HUBOT_HOME_DIR}
if [ "$(pgrep node)" != "" ]
then
    echo "Killing previous process... ($(pgrep node))"
    pkill node
fi

mkdir -p ${HUBOT_LOGS_DIR}

if [ ! -f ./hubot.heroku.env ]; then
   echo "hubot.heroku.env file not found!"
   exit 1
fi

source ./hubot.heroku.env

./fix-http.sh
./fix-freshdesk.sh

${HUBOT_HOME_DIR}${HUBOT_BIN} --name ${HUBOT_NAME} --adapter ${ADAPTER} >${HUBOT_LOGS_DIR}/${HUBOT_NAME}.log 2>&1

sleep 2
echo NONO PID:
pgrep node
tail -n 20 ${HUBOT_LOGS_DIR}/${HUBOT_NAME}.log


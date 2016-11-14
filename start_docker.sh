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

if [ ! -f ./hubot.env ]; then
    echo "hubot.env file not found!"
    exit 1
fi

source ./hubot.env

${HUBOT_HOME_DIR}${HUBOT_BIN} --name ${HUBOT_NAME} --adapter ${ADAPTER} >${HUBOT_LOGS_DIR}/${HUBOT_NAME}.log 2>&1

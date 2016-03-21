#!/bin/bash

ps -aef | grep rafiki | grep -v grep | awk {'print $2'} | xargs kill


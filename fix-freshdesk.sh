#!/bin/sh
#
# Filename:       fit-freshdesk.sh
#
# Description:    When installing the hubot-freshdesk module using npm, its 'index.coffee'
#                 file is empty.
#

# Set parameter(s)
FRESHDESK_INDEX="./node_modules/hubot-freshdesk/index.coffee"

# Remove hubot-freshdesk index.coffee
rm -f $FRESHDESK_INDEX

# Create new hubot-freshdesk index.coffee
cat > $FRESHDESK_INDEX <<EOF
fs = require 'fs'
path = require 'path'

module.exports = (robot, scripts) ->
  scriptsPath = path.resolve(__dirname, 'src')
  fs.exists scriptsPath, (exists) ->
    if exists
      for script in fs.readdirSync(scriptsPath)
        if scripts? and '*' not in scripts
          robot.loadFile(scriptsPath, script) if script in scripts
        else
          robot.loadFile(scriptsPath, script)

EOF

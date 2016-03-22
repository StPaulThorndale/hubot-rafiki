# Description
#   Support-related responses
#
# Commands:
#   hubot support (email) - Reply with the Freshdesk support email address for IT issues/questions

module.exports = (robot) ->

  robot.respond /(support)|(support email)/i, (msg) ->
     msg.send "If you need to file an IT Support ticket, please send an email to support@splc.freshdesk.com or log a **New Support Ticket** at https://splc.freshdesk.com. You can say `rafiki get tickets` to get a list of all the open tickets in the queue."
     
  robot.respond /timer\s+(\d+)\s+(.*)$/i, (res) ->
    min = res.match[1]
    message = res.match[2]
    setTimeout ->
      res.send message
    , min * 1000 * 60

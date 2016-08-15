# Description
#   Support-related responses
#
# Commands:
#   hubot important links - Display important links to remember
#   hubot support (email) - Reply with the Freshdesk support email address for IT issues/questions

importantLinks = """

The following is a list of important links for you:

- **IT Support Ticket Submission:** Send an email to support@splc.freshdesk.com (To retrieve tickets, use `rafiki get tickets`)
- **Flowdock Information:** https://github.com/StPaulThorndale/Support/wiki/Flowdock
- **Printer Drivers**
    - Black/White Ricoh (public link) - http://support.ricoh.com/bb/html/dr_ut_e/ra/model/mp6002_7502_9002/mp6002_7502_9002en.htm
    - Color Ricoh (public link) - http://support.ricoh.com/bb/html/dr_ut_e/ra/model/mpc450/mpc450en.htm
    - Office HP OfficeJet 8500 (public link) - http://support.hp.com/us-en/drivers/selfservice/HP-Officejet-Pro-8500-All-in-One-Printer-series---A909/3752454/model/3752458
    - Other Locations (internal link) - Open Windows Explorer and navigate to `\\\\splc.net\\SPLCNETSTORE01\\Admin`
- **Rafiki's code:** https://github.com/StPaulThorndale/hubot-rafiki
- **Troubleshooting:** https://github.com/StPaulThorndale/Support/wiki/Troubleshooting

Please don't hesitate to suggest other links to add to this list.

"""

module.exports = (robot) ->

  robot.respond /(support)|(support email)/i, (msg) ->
    msg.send "If you need to file an IT Support ticket, please send an email to support@splc.freshdesk.com or log a **New Support Ticket** at https://splc.freshdesk.com. You can say `rafiki get tickets` to get a list of all the open tickets in the queue."

  robot.respond /(links)|(important links)/i, (msg) ->
    msg.send importantLinks

  robot.respond /timer\s+(\d+)\s+(.*)$/i, (res) ->
    min = res.match[1]
    message = res.match[2]
    setTimeout ->
      res.send message
    , min * 1000 * 60

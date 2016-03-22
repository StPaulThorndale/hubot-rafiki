# Description
#   random hubot scripts for specific responses
#
# Commands:
#   hubot hammer time - Tell me what time it is
#   hubot tell me a joke - Tells you a random joke
#   hubot what road do i take - Reminds you which way to go

hammerTime = [
  "http://i.imgur.com/pms5kRX.jpg",
  "http://i.imgur.com/xClgIFB.png",
  "http://i.imgur.com/Mjv5R3z.gif",
  "http://i.imgur.com/BVaFydq.jpg",
  "http://i.imgur.com/9BPWJ40.gif",
  "http://i.imgur.com/rEA4Oyb.jpg",
  "http://i.imgur.com/j6dxPP3.jpg",
  "http://i.imgur.com/66VlXbr.jpg",
  "http://photos-c.ak.instagram.com/hphotos-ak-xaf1/10693447_1498553547059706_845892238_n.jpg",
]

jokes = [
   "What do you call a bear with no teeth? A gummy bear",
   "A peanut was walking down the street. He was assalted...",
   "Did you hear about the Scarecrow who won the Nobel Prize? He was outstanding in his field",
   "What do you call a cow with no legs? Ground Beef",
   "whats brown and sticky? a stick...",
   "What did Mario say when he broke up with Princess Peach? Its not you, its a-me, Mario!",
   "What did one bean say to the other bean? How you bean?",
   "What do you call a fish with no eyes? A fsh...",
   "How do you make a tissue dance? Put a little boogie in it...",
   "Whats green and smells like paint? Green paint",
   "Why did Adele cross the road? To say hello from the other side!",
   "What did the shoes say to the pants? SUP, BRITCHES!",
]

module.exports = (robot) ->

  robot.respond /ADAPTER$/i, (msg) ->
    msg.send robot.adapterName

  robot.respond /tell me a joke/i, (msg) ->
     msg.send msg.random jokes
     
  robot.respond /what road do i take/i, (msg) ->
    msg.send "Where were going, we dont need roads...\nhttps://rempelmasters.files.wordpress.com/2011/02/bttfextra.jpg"
    
  robot.respond /do you even hubot/i, (msg) ->
    msg.send "Do you even human?"

  robot.respond /TIME$/i, (msg) ->
    msg.send msg.random hammerTime
    msg.send "Server time is: #{new Date()}"

  robot.respond /timer\s+(\d+)\s+(.*)$/i, (res) ->
    min = res.match[1]
    message = res.match[2]
    setTimeout ->
      res.send message
    , min * 1000 * 60

# Description
#   Responses that help with Flowdock-related items
#
# Commands:
#   hubot what is flowdock - Provides a helpful answer that describes what Flowdock is and how to use it.

what_is_flowdock = """
What can you do with Flowdock? It is a very powerful chat and collaboration tool. The IT volunteers for SPLC have set up this Flowdock 
tenant to be able to chat in real time to talk about IT issues and support, however it can also be used for any topic. It has a full 
history of all chat conversations and is fully searchable for future reference. SPLC has 25 free user licenses to use Flowdock, meaning 
there is no cost as long as we invite up to but no more than 25 accounts here.

Here is a list of helpful information about Flowdock:

- Overall list of [Flowdock Features](https://www.flowdock.com/features)
- A description about Flowdock [flows/rooms](https://www.flowdock.com/help/flows)
- How to have discussions using [chat and threads](https://www.flowdock.com/help/chat) in a flow/room
- Some tips and examples on [formatting your text](https://www.flowdock.com/help/chat_input)
- How you can directly [notify and be notified](https://www.flowdock.com/help/notifications)
- [Searching](https://www.flowdock.com/help/search) a flow/room for older conversations
- General [FAQ](https://www.flowdock.com/help/faq) questions that can answer additional questions


In addition, **rafiki** is a special robot created for SPLC, here to help with IT topics as well. Issue the command `rafiki help` to 
see a full list of commands that **rafiki** listens to. For example, try `rafiki what do you look like` to see what he says. **Rafiki** 
can also be trained to have his own personality!
"""

module.exports = (robot) ->

  robot.respond /what is flowdock/i, (msg) ->
     msg.send what_is_flowdock

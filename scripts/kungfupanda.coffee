# Description:
#   Example scripts for you to examine and try out.
#
module.exports = (robot) ->

 robot.respond /(who's|who is) your (boss|master)/i, (msg) ->
  msg.send "The one who has reached inner peace."


# food 
 foodreplies = [
  "I am starving here",
  "I am running low on sugar"
 ]

 foodtriggers = [
  "hungry",
  "dessert(|s)",
  "(icecream|cake|donut)",
  "(breakfast|lunch|brunch|dinner)"
 ]

 regex = new RegExp foodtriggers.join('|'), "i"

 special_users= "bhan"
 robot.hear regex, (msg) ->
    msg.send msg.random foodreplies

# ikr
 cooltriggers = [
  "awesome",
  "attractive",
  "(special|cool|incredible|incroyable)"
 ]

 coolreplies = [
  "There is no charge for awesomeness... or attractiveness.",
  "So deadly, in fact, that our enemies would go blind from over-exposure to pure awesomeness!"
 ]
 
 
 cool_regex = new RegExp cooltriggers.join('|'), "i"

 robot.hear cool_regex, (msg) ->
    text = msg.message.text
    if text.match(/awesome/i) or text.match(/attractive/i)
       msg.send msg.random coolreplies
    else if (msg.message.user.name in ['bhan'])
       msg.reply "IKR?!" 

 
 robot.hear /panda/i, (msg) ->
  msg.send "What's up? Panda is awesome!"
 
 robot.hear /coffee/i, (msg) ->
  msg.send "Btw, who is our barista?"

# qa
 qatriggers = [
  "(do you )?(think|agree)",
  "(what|where|when|why)",
  "are you"
 ] 
 
 qa_regex = new RegExp qatriggers.join('|'), "i"
 robot.respond qa_regex, (msg) -> 
# robot.respond /(do you )?(think|agree)/i, (msg) ->
  msg.reply "It depends...OK?"
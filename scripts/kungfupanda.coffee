# Description:
#   scripts for pobot.
#
module.exports = (robot) ->

 robot.respond /(who's|who is) your (boss|master)/i, (msg) ->
  msg.send "A Dragon Warrior doesn't work for anyone."
#  if (msg.message.user.name in ['bhan'])
#       msg.reply "...silence is golden..."
#  else
#       msg.reply "Find your inner peace and I will tell you."

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
  "(kool|special|cool|incredible|incroyable)"
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
       msg.send "*OMG* couldn't agree more +1" 

 
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
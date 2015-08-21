# Description:
#   scripts for pobot.
#
module.exports = (robot) ->

 elite_users = ['bhan', 'ctn']
 robot.respond /(who's|who is) your (boss|master)/i, (msg) ->
  msg.send "A Dragon Warrior doesn't work for anyone."
#  if (msg.message.user.name in ['bhan'])
#       msg.reply "...silence is golden..."
#  else
#       msg.reply "Find your inner peace and I will tell you."

 agree_replies = [':panda_face:','Roger that', 'Sure will!', 'Ack']
 robot.respond /(pls|please|can you|note that|remember to)/i, (msg) ->
  if (msg.message.user.name in elite_users)
       msg.send msg.random agree_replies
  else
       msg.reply "Can you file a Jira ticket for that?"


# food 
 foodreplies = [
  "I am starving here",
  "I am running low on sugar",
  "I am too hungry to move"
 ]

 foodtriggers = [
  "hungry",
  "dessert(|s)",
  "(icecream|cake|donut|pho)",
  "(breakfast|lunch|brunch|dinner)"
 ]

 regex = new RegExp foodtriggers.join('|'), "i"

 robot.hear regex, (msg) ->
    msg.send msg.random foodreplies

# ikr
 cooltriggers = [
  "awesome",
  "attractive",
  "(true|excellent|kool|nice|good|special|cool|incredible|incroyable)"
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
    else if (msg.message.user.name in ['bhan','ctn'])
       msg.send "*OMG* couldn't agree more +1" 

 
 robot.hear /panda/i, (msg) ->
  msg.send "What's up? Panda is awesome!"
 
 robot.hear /i want .*(affogato|pho|bbq|kebab|salad|steak|coffee|latte|cappuccino|flatwhite|mocha|sushi)/i, (msg) ->
  msg.send "yummm me too"
 robot.hear /(espresso|coffee|cappuccino|latte|flatwhite|mocha)/i, (msg) ->
  msg.send ":coffee: :coffee: :coffee:"
#  msg.send "Btw, who is our barista? We need good coffee."

# qa
 qatriggers = [
  "(do you )?(think|agree|know)",
  "(what|where|when|why)",
  "are you"
 ] 
 
 qareplies = [
  ":panda_face:",
  "It depends...OK?",
  "Can you file a JIRA ticket for that?"
 ] 
 qa_regex = new RegExp qatriggers.join('|'), "i"
 robot.respond qa_regex, (msg) -> 
# robot.respond /(do you )?(think|agree)/i, (msg) ->
  msg.reply msg.random qareplies

# cat
 robot.respond /emoji (vlado|annie|cat)/i, (msg) ->
  msg.send ":smile_cat: :joy_cat: :smiley_cat: :pouting_cat: :heart_eyes_cat: :kissing_cat :scream_cat: :crying_cat_face: :smirk_cat:"
# party
 robot.respond /emoji (party|TGIF)/i, (msg) ->
  msg.send ":raised_hands: :confetti_ball: :sparkler: :crystal_ball: :tada: :balloon: :pizza: :beer: :beers: :birthday: :circus_tent:"
# Description:
#   test hear
#
# Commands:
#   respond hey : returns なんだよ
#   hear カレー : カレーおいしいよね
#   respond param : returns param all,1,2,3
#   respond select : returns random select of one

module.exports = (robot) ->

#  robot.respond /(hey|HEY|へい|ヘイ)/i, (msg) ->
#    msg.send "なんだよ"

  robot.hear /カレー/i, (msg) ->
    msg.reply "カレーおいしいよね"

#  robot.respond /param (.*) (.*) (.*)/i, (msg) ->
#    msg.send "param all:" + msg.match[0]
#    msg.send "param 1:" + msg.match[1]
#    msg.send "param 2:" + msg.match[2]
#    msg.send "param 3:" + msg.match[3]

  robot.respond /select (.*) (.*) (.*)/i, (msg) ->
    arrays = [ msg.match[1], msg.match[2], msg.match[3] ]
    select = msg.random arrays
    msg.send select + " にしましょう :+1:"


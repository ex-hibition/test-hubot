# Description:
# call for ./shell/test.rb
#
# Commands:
# call for ./shell/test.rb


module.exports = (robot) ->

  # -- test.rbを実行する
  robot.respond /test\.rb/i, (msg) ->
    exec = require('child_process').exec
    cmd = "ruby /home/vagrant/test-hubot/scripts/shell/test.rb"
    msg.send "`Command : #{cmd}` 実行しまーす"
    exec cmd, (error, stdout, stderr) ->
       msg.send error if error?
       msg.send stdout if stdout?
       msg.send stderr if stderr?

  # -- test.shを実行する
  robot.respond /test\.sh/i, (msg) ->
    exec = require('child_process').exec
    cmd = "sh /home/vagrant/test-hubot/scripts/shell/test.sh"
    msg.send "`Command : #{cmd}` 実行しまーす"
    exec cmd, (error, stdout, stderr) ->
       msg.send error if error?
       msg.send stdout if stdout?
       msg.send stderr if stderr?

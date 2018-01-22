# Description:
# call for ./shell/test.rb
#
# Commands:
# call for ./shell/test.rb


module.exports = (robot) ->

  # -- test.rbを実行する
  robot.respond /exec\s+test\.+rb/i, (msg) ->
    exec = require('child_process').exec
    cmd = "ruby scripts/shell/test.rb"
    msg.send "`Command : #{cmd}` 実行しまーす"
    exec cmd, (error, stdout, stderr) ->
      msg.send error if error?
      msg.send stdout if stdout?
      msg.send stderr if stderr?

  # -- test.shを実行する
  robot.respond /exec\s+test\.sh/i, (msg) ->
    exec = require('child_process').exec
    cmd = "sh scripts/shell/test.sh"
    msg.send "`Command : #{cmd}` 実行しまーす"
    exec cmd, (error, stdout, stderr) ->
      msg.send error if error?
      msg.send stdout if stdout?
      msg.send stderr if stderr?

  # -- amazon_adv_api.rbを実行する
  # -- 引数を書籍タイトル検索文字列として利用する
  robot.respond /exec\s+adv_api\s+(.*)/i, (msg) ->
    exec = require('child_process').exec
    cmd = "(cd scripts/shell; ruby ./amazon_adv_api.rb #{msg.match[1]})"
    msg.send "`Command : #{cmd}` 実行しまーす"
    exec cmd, (error, stdout, stderr) ->
      msg.send error if error?
      msg.send stdout if stdout?
      msg.send stderr if stderr?

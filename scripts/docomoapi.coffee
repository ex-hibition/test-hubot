# Description:
#   DOCOMO雑談対話APIを使って雑談する
# Commands:
# 

# -- 環境変数取得
apikey = process.env.DOCOMO_APIKEY

# -- docomoapi url + apikey
url = 'https://api.apigw.smt.docomo.ne.jp/dialogue/v1/dialogue?APIKEY=' + apikey

module.exports = (robot) ->
  robot.respond /(.*)/i, (msg) ->
    message = msg.match[1]

    # -- 別処理の起動条件には反応しない
    return if /^exec\s+|^select\s+/.test(message)

    request = require('request'); 
    request.post
      url: url
      json:
        utt: message
        t: 20 # 関西弁モード
      ,(err, response, body) ->
         msg.send body.utt 

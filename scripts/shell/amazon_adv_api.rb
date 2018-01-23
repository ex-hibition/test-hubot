require 'bundler'
Bundler.require

# -- キーワード
keyword = ARGV[0]

# -- 設定情報
Amazon::Ecs.configure do |options|
  options[:AWS_access_key_id] = ENV['AWS_access_key_id']
  options[:AWS_secret_key] = ENV['AWS_secret_key']
  options[:associate_tag] = ENV['associate_tag']
end

# -- デバッグオン
#Amazon::Ecs.debug = true

# -- 検索条件
res = Amazon::Ecs.item_search('',
		{:title => "#{keyword}",
		 :search_index => 'Books',
		 :response_group => 'Medium, Images',
		 :country => 'jp',
#		 :sort => 'titlerank',
#		 :browse_node => '2250738051'
		})

res.items.each_with_index do |item, index|
  # -- 5個以上のURLリンクはSlackで自動展開されないため
  break if index == 4

  # -- item詳細
#  puts item.get_element('ItemAttributes')
  item_attributes = item.get_element('ItemAttributes')

  puts "Title: #{item_attributes.get('Title')}"
  puts "Author: #{item_attributes.get('Author')}"
  puts "発行日: #{item_attributes.get('PublicationDate')}"
  puts "ページ: #{item_attributes.get('NumberOfPages')}"
  puts "出版社: #{item_attributes.get('Label')}"

  # -- 画像
  puts "画像URL: #{item.get_hash('SmallImage')['URL']}"
end

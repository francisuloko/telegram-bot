#!/usr/bin/env ruby

require 'telegram/bot'
require_relative '../config/token'
require_relative '../lib/bot'
require_relative '../lib/channelstv'



start_message = <<~EOS
Hello there!

I'm Paddy, bringing you the lastest news.

Want to know what's happening
aroud the world?

Select source:

For bbc news: /bbc  
For cnn news: /cnn
For channels news: /channels

To end session: /stop

EOS

Telegram::Bot::Client.run(BOT_TOKEN) do |bot|
  bot.listen do |message|
    case message.text
    when '/start'
      bot.api.send_message(chat_id: message.chat.id, text:  start_message.to_s)
    when '/bbc'
      bot.api.send_message(chat_id: message.chat.id, text:  'coming soon...')
    when '/cnn'
      bot.api.send_message(chat_id: message.chat.id, text:  'coming soon...')
    when '/channels'
      channels = Paddy::ChannelsTv.new
      link = channels.news_links
      bot.api.send_message(chat_id: message.chat.id, text:  link[0])
      bot.listen do |message|
        if message.text == '/next'
          bot.api.send_message(chat_id: message.chat.id, text:  link.sample)
        end
      end
    when '/stop'
      bot.api.send_message(chat_id: message.chat.id, text:  'See you again friend')
    end
  end
end

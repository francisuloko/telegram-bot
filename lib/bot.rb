#!/usr/bin/env ruby

require 'telegram/bot'
require_relative '../config/token'
require_relative '../lib/bot'
require_relative '../lib/channelstv'



start_message = <<~EOS
Hello there!

I'm Paddy, here with the lastest Headlines.

Want to know what's happening
aroud the globe?

Select source:

1. /bbc
2. /cnn
3. /channels

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
      article = channels.news_links
      i = 0
      bot.api.send_message(chat_id: message.chat.id, text:  article[0])
      bot.listen do |message|
        if message.text == '/next' && i < 3 #article.length
          bot.api.send_message(chat_id: message.chat.id, text:  article[i])
          i += 1
        end
        bot.api.send_message(chat_id: message.chat.id, text:  'Want more, try /cnn or /bbc')
        break
      end
    when '/stop'
      bot.api.send_message(chat_id: message.chat.id, text:  'See you again friend')
    end
  end
end

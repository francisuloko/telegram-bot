#!/usr/bin/env ruby
# frozen_string_literal: true

require_relative '../lib/bot'
require_relative '../config/token'
require 'telegram/bot'

start_message = <<~EOS
Hello there!

I'm Paddy, with the lastest news.

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
      bot.api.send_message(chat_id: message.chat.id, text:  'loading...')
    when '/cnn'
      bot.api.send_message(chat_id: message.chat.id, text:  'loading...')
    when '/channels'
      bot.api.send_message(chat_id: message.chat.id, text:  'loading...')
    when '/stop'
      bot.api.send_message(chat_id: message.chat.id, text:  'See you again friend')
    end
  end
end

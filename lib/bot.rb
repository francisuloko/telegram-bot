#!/usr/bin/env ruby

require_relative '../lib/bot.rb'
require_relative '..config/token.rb'
require 'telegram/bot'

text = "Hi, I'm Paddy! to get started /options /map"

Telegram::Bot::Client.run(BOT_TOKEN) do |bot|
    bot.listen do |message|
    case message.text
    when '/start'
        bot.api.send_message(chat_id: message.chat.id, text:  "#{text}")
    when '/map'
        bot.api.send_location(chat_id: message.chat.id, latitude: -37.807416, longitude: 144.985339)
    end
    end
end
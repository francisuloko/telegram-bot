require 'telegram/bot'
require_relative '../config/token'
require_relative '../lib/news_source'

Telegram::Bot::Client.run(TOKEN) do |bot|
  bot.listen do |message|
    case message.text
    when '/start'
      source = Paddy::NewsSource.new
      articles = source.news_links
      bot.api.send_message(chat_id: message.chat.id, text: articles.sample)
      bot.api.send_message(chat_id: message.chat.id, text: '/next')
      bot.listen do |message|
        if message.text == '/next'
          bot.api.send_message(chat_id: message.chat.id, text: articles.sample)
          bot.api.send_message(chat_id: message.chat.id, text: '/next')
        elsif message.text == '/stop'
          bot.api.send_message(chat_id: message.chat.id, text: 'See you again friend')
          break
        end
      end
    end
  end
end

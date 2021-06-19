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
      bot.listen do |msg|
        case msg.text
        when '/next'
          bot.api.send_message(chat_id: msg.chat.id, text: articles.sample)
          bot.api.send_message(chat_id: msg.chat.id, text: '/next')
        when '/stop'
          bot.api.send_message(chat_id: msg.chat.id, text: 'See you again friend')
          break
        end
      end
    end
  end
end

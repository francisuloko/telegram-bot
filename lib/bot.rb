require 'telegram/bot'
require_relative '../config/token'
require_relative '../lib/news_source'

Telegram::Bot::Client.run(TOKEN) do |bot|
  bot.listen do |message|
    case message.text
    when '/start'
      bot.api.send_message(chat_id: message.chat.id, text: "Hi")
    when '/channels'
      channels = Paddy::NewsSource.new
      articles = channels.news_links
      i = 0
      bot.api.send_message(chat_id: message.chat.id, text: articles[i])
      bot.api.send_message(chat_id: message.chat.id, text: '/next')
      bot.listen do |message|
        if message.text == '/next' && i < articles.length
          i += 1
          bot.api.send_message(chat_id: message.chat.id, text: articles[i])
          bot.api.send_message(chat_id: message.chat.id, text: '/next')
          break if i == articles.length
        elsif message.text == '/stop'
          bot.api.send_message(chat_id: message.chat.id, text: 'See you again friend')
          break
        end
      end
    end
  end
end

# rubocop: disable Metrics/PerceivedComplexity, Metrics/CyclomaticComplexity

require 'telegram/bot'
require_relative '../config/token'
require_relative '../lib/bot'
require_relative '../lib/channelstv'

Telegram::Bot::Client.run(TOKEN) do |bot|
  bot.listen do |message|
    case message.text
    when '/start'
      bot.api.send_message(chat_id: message.chat.id, text: 'Hello...')
    when '/bbc'
      bot.api.send_message(chat_id: message.chat.id, text:  'coming soon...')
    when '/cnn'
      bot.api.send_message(chat_id: message.chat.id, text:  'coming soon...')
    when '/channels'
      channels = Paddy::ChannelsTv.new
      article = channels.news_links
      i = 0
      bot.api.send_message(chat_id: message.chat.id, text:  article[i])
      bot.api.send_message(chat_id: message.chat.id, text:  '/next')
      bot.listen do |message|
        if message.text == '/next' && i < article.length
          i += 1
          bot.api.send_message(chat_id: message.chat.id, text:  article[i])
          bot.api.send_message(chat_id: message.chat.id, text:  '/next')
        elsif message.text == '/stop'
          bot.api.send_message(chat_id: message.chat.id, text:  'See you again friend')
          break
        end
        break if i == article.length
      end
    end
    bot.api.send_message(chat_id: message.chat.id, text: 'Want more news, try /cnn or /bbc')
  end
end
# rubocop: enable Metrics/PerceivedComplexity, Metrics/CyclomaticComplexity

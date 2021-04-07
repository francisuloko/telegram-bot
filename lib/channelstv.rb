require 'nokogiri'
require 'httparty'
require 'byebug'

module Paddy
    class ChannelsTv
        attr_reader :news_links

        def initialize
            @news_links = []
        end 
      
        def scrape
            @url = "https://www.channelstv.com/category/world-news"
            @html = HTTParty.get(@url)
            @obj = Nokogiri::HTML(@html)
            @articles = @obj.css('div.cat_page')
        end

        def news_links
          @articles = scrape
          @articles.each do |article|
            @news_links << article.css('a')[0].attributes['href']
          end
          @news_links
        end
    end
end


def scrape
    latest_news = []
    url = "https://www.channelstv.com/category/world-news"
    html = HTTParty.get(url)
    obj = Nokogiri::HTML(html.body)
    articles = obj.css('div.cat_page')

    articles.each do |article|
        latest_news << article.css('a')[0].attributes['href']
    end
end

# puts scrape
require 'nokogiri'
require 'httparty'
require 'byebug'

module Paddy
    class ChannelsTv
        attr_reader :news_links

        def initialize
            @news_links = []
        end 
      
        private

        def scrape
            @url = "https://www.channelstv.com/category/world-news"
            @html = HTTParty.get(@url)
            @obj = Nokogiri::HTML(@html)
            @articles = obj.css('div.cat_page')
        end

        def news_links
          @articles = scrape
          @articles.each do |article|
            @news_links << article.css('a')[0].attributes['href']
          end
        end

        public
    end
end


def scrape
    latest_news = []
    url = "https://www.channelstv.com/category/world-news"
    html = HTTParty.get(url)
    obj = Nokogiri::HTML(html)
    articles = obj.css('div.cat_page')

    articles.each do |article|
        latest_news << article.css('a')[0].attributes['href']
    end
    latest_news
end
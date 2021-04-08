require 'nokogiri'
require 'httparty'
require 'byebug'

module Paddy
  class NewsSource
    attr_reader :scrapper
    def initialize
      @news_links = []
    end

    def news_links
      @news_links << bbc.flatten + channelstv.flatten
      byebug
    end

    # private

    def scrapper(url, elem)
      @html = HTTParty.get(url)
      @obj = Nokogiri::HTML(@html)
      @articles = @obj.css(elem)
      @articles
    end
    
    def bbc
      @news_array = []
      @url = 'https://www.bbc.com'
      @elem = 'a.block-link__overlay-link'
      @articles = scrapper(@url, @elem)
      @articles.each do |a|
        @news_array << @url + @articles.css('a')[1].attributes['href'].value
      end
      @news_array
    end
    
    def channelstv
      @news_array = []
      @url = 'https://www.channelstv.com/category/world-news'
      @elem = 'div.cat_page'
      @articles = scrapper(@url, @elem)
      @articles.each do |a|
        @news_array << @articles.css('a')[0].attributes['href']
      end
      @news_array
    end
  end
end

s = Paddy::NewsSource.new
s.news_links
s.bbc
s.channelstv

require 'nokogiri'
require 'httparty'
require 'byebug'

module Paddy
  class NewsSource
    def initialize
      @news_links = []
    end

    def news_links
      @news_links << channelstv + bbc + cnn
      @news_links = @news_links.flatten
    end

    private

    def scrapper(url, elem)
      html = HTTParty.get(url)
      obj = Nokogiri::HTML(html)
      articles = obj.css(elem)
    end

    def bbc
      news_array = []
      url = 'https://www.bbc.com'
      elem = 'div.media__content'
      articles = scrapper(url, elem)
      i = 0
      articles.each do |article|
        break if i == 11
        news_array << url + article.css('a')[0].attributes['href'].value
        i += 1
      end
      news_array
    end
    
    def channelstv
      news_array = []
      url = 'https://www.channelstv.com/category/world-news'
      elem = 'div.cat_page'
      articles = scrapper(url, elem)
      articles.each do |article|
        news_array << article.css('a')[0].attributes['href']
      end
      news_array
    end

    def cnn
      news_array = []
      url = 'https://edition.cnn.com/world'
      elem = 'h3.cd__headline'
      articles = scrapper(url, elem)
      i = 0
      articles.each do |article|
        break if i == 9
        news_array << url + article.css('a')[0].attributes['href'].value
        i += 1
      end
      news_array
    end 
  end
end

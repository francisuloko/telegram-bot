# rubocop: disable Metrics/PerceivedComplexity, Metrics/CyclomaticComplexity
require 'nokogiri'
require 'httparty'
require 'byebug'

module Paddy
  class NewsSource
    attr_reader

    def initialize
      @news_links = []
    end

    def news_links
      @articles = scrape
      @articles.each do |article|
        @news_links << article.css('a')[0].attributes['href']
      end
      @news_links
    end

    def scrape
      @url = 'https://www.channelstv.com/category/world-news'
      @html = HTTParty.get(@url)
      @obj = Nokogiri::HTML(@html)
      @articles = @obj.css('div.cat_page')
    end
  end
end
# rubocop: enable Metrics/PerceivedComplexity, Metrics/CyclomaticComplexity

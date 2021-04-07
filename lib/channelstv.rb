require 'nokogiri'
require 'httparty'
require 'byebug'

module Paddy
    class ChannelsTv
        attr_reader :obj

        def initialize
            count = ''
        end 

        def scrape
            @url = "https://www.channelstv.com/category/world-news"
            @html = HTTParty.get(@url)
            @obj = Nokogiri::HTML(@html)
        end
    end
end

require_relative '../lib/news_source'

RSpec.describe 'Paddy::NewsSource' do
  context '#news_link' do
    it 'returns array of news links' do
      src = Paddy::NewsSource.new
      expect(src.news_links.is_a? Array).to eq(true)
    end
  end

  context '#scrape' do
    it 'returns array of news article' do
      src = Paddy::NewsSource.new
      expect(src.news_links.is_a? Array).to eq(true)
    end
  end
end

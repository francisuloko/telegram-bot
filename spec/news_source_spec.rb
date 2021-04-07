require_relative '../lib/news_source'

describe 'Paddy::NewsSource' do
  describe '#news_link' do
    it 'returns array of news links' do
      expect(news_links).to eq([])
    end
  end

  describe '#scrape' do
    it 'returns array of news article' do
      expect(scrape).to eq([])
    end
  end
end

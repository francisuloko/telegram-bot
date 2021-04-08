require_relative '../lib/news_source'


RSpec.describe 'Paddy::NewsSource' do
  subject { Paddy::NewsSource.new }
  context '#news_link' do
    it 'returns array of news links' do
      expect(subject.news_links.is_a?(Array)).to eq(true)
    end

    it 'returns false if news_links is nil or empty' do
      expect(subject.news_links.nil?).not_to eq(true)
    end
  end

  context '#scrape' do
    it 'returns array of news article' do
      expect(subject.scrape.to_a.is_a?(Array)).to eq(true)
    end

    it 'returns false if news_links is nil or empty' do
      expect(subject.scrape.nil?).not_to eq(true)
    end
  end
end

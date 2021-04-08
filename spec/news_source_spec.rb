require_relative '../lib/news_source'

RSpec.describe 'Paddy::NewsSource' do
  subject { Paddy::NewsSource.new }
  context '#news_link' do
    it 'returns [] of news links' do
      expect(subject.news_links.is_a?([])).to eq(true)
    end

    it 'returns false if news_links is nil or empty' do
      expect(subject.news_links.nil?).not_to eq(true)
    end
  end

  context '#scrapper' do
    it 'returns [] of news article' do
      expect(subject.scrapper.to_a.is_a?([])).to eq(true)
    end

    it 'returns false if news_links is nil or empty' do
      expect(subject.scrapper.nil?).not_to eq(true)
    end
  end

  context '#bbc' do
    it 'returns [] of news article' do
      expect(subject.bbc.to_a.is_a?([])).to eq(true)
    end

    it 'returns false if news_links is nil or empty' do
      expect(subject.bbc.nil?).not_to eq(true)
    end
  end

  context '#channelstv' do
    it 'returns [] of news article' do
      expect(subject.channelstv.to_a.is_a?([])).to eq(true)
    end

    it 'returns false if news_links is nil or empty' do
      expect(subject.channelstv.nil?).not_to eq(true)
    end
  end
end

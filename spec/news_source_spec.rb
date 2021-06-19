require_relative '../lib/news_source'

RSpec.describe 'Paddy::NewsSource' do
  subject { Paddy::NewsSource.new }
  let(:url) { 'https://www.channelstv.com/category/world-news' }
  let(:elem) { 'div.cat_page' }
  let(:scrappr) { subject.send(:scrapper, url, elem) }
  let(:bbc) { subject.send(:bbc) }
  let(:channelstv) { subject.send(:channelstv) }

  describe '#news_link' do
    it 'returns arrays' do
      expect(subject.news_links.is_a?(Array)).to eq(true)
    end

    it 'return a flattened array' do
      expect(subject.news_links.length).not_to eq(1)
    end

    it 'returns false if array is empty' do
      expect(subject.news_links.nil?).not_to eq(true)
    end
  end

  describe '#scrapper' do
    it 'returns nokogiri object' do
      expect(scrappr).to eq(scrappr.css(elem))
    end

    it 'returns false if object is empty' do
      expect(scrappr.nil?).not_to eq(true)
    end
  end

  describe '#bbc' do
    it 'returns news links' do
      expect(bbc).to eq(bbc)
    end

    it 'returns false if array is empty' do
      expect(bbc.nil?).not_to eq(true)
    end
  end

  describe '#channelstv' do
    it 'returns news links' do
      expect(channelstv).to eq(channelstv)
    end

    it 'returns false if array is empty' do
      expect(channelstv.nil?).not_to eq(true)
    end
  end
end

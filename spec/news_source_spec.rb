require_relative '../lib/news_source'

RSpec.describe 'Paddy::NewsSource' do
  subject { Paddy::NewsSource.new }

  describe '#news_link' do
    it 'returns arrays' do
      expect(subject.news_links.is_a?(Array)).to eq(true)
    end

    it "return a flat array" do
      expect(subject.news_links.length).not_to eq(1)
    end

    it 'returns false if array is empty' do
      expect(subject.news_links.nil?).not_to eq(true)
    end
  end
end

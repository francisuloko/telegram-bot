# frozen_string_literal: true

RSpec.describe Telegram::Bot do
  it 'has a version number' do
    expect(Telegram::Bot::VERSION).not_to be nil
  end

  it 'does something useful' do
    expect(false).to eq(true)
  end
end
#!/usr/bin/env ruby
# frozen_string_literal: true

# require_relative '../lib/bot'
require_relative '../lib/channelstv'

# Bot.new

channels = Paddy::ChannelsTv.new

puts channels.scrape
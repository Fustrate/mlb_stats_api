# frozen_string_literal: true

require 'spec_helper'

RSpec.describe MLBStatsAPI::Stats do
  let(:client) { MLBStatsAPI::Client.new }

  before { stub_requests! }

  describe '#stats' do
    it 'requires a stats argument' do
      expect { client.stats(group: 'hitting') }
        .to raise_exception(ArgumentError, /stats arg/)
    end

    it 'requires a stats argument' do
      expect { client.stats(stats: 'season') }
        .to raise_exception(ArgumentError, /group arg/)
    end

    it 'finds one person by ID' do
      client.stats(group: 'hitting', stats: 'season')

      expect(a_get_request('v1/stats', group: 'hitting', stats: 'season'))
        .to have_been_made
    end
  end

  describe '#stats_leaders' do
    it 'requires a leaderCategories argument' do
      expect { client.stats_leaders }
        .to raise_exception(ArgumentError, /leaderCategories arg/)
    end

    it 'loads stats for a player in a game' do
      client.stats_leaders(leaderCategories: 'homeRuns')

      expect(a_get_request('v1/stats/leaders', leaderCategories: 'homeRuns'))
        .to have_been_made
    end
  end
end

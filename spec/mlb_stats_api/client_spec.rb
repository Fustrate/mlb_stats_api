# frozen_string_literal: true

require 'spec_helper'

RSpec.describe MLBStatsAPI::Client do
  let(:client) { described_class.new }

  describe '#new' do
    # Super exciting
    it 'creates a new client' do
      expect(client).to be_a described_class
    end
  end

  describe '#get' do
    it 'sends a request to AWS' do
      stub_requests!

      client.get '/standingsTypes'

      expect(a_get_request('v1/standingsTypes')).to have_been_made
    end
  end

  describe '#normalize_query_args' do
    it 'does nothing with no arguments' do
      expect(client.normalize_query_args({})).to eq({})
    end

    it 'removes nil values' do
      expect(client.normalize_query_args(sportId: 1, type: nil))
        .to eq(sportId: 1)
    end

    it 'turns arrays into comma-separated strings' do
      expect(client.normalize_query_args(leagueIds: [103, 104]))
        .to eq(leagueIds: '103,104')
    end
  end
end

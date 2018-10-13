# frozen_string_literal: true

require 'spec_helper'

RSpec.describe MLBStatsAPI::People do
  let(:client) { MLBStatsAPI::Client.new }

  before { stub_requests!(with_response: true) }

  describe '#person' do
    it 'finds one person by ID' do
      archie_bradley = client.person(605_151)

      expect(a_get_request('v1/people', personIds: '605151')).to have_been_made

      expect(archie_bradley['fullName']).to eq 'Archie Bradley'
    end

    it 'finds multiple people by ID' do
      players = client.people([605_151, 592_450])

      expect(players.map { |player| player['fullName'] })
        .to eq ['Archie Bradley', 'Aaron Judge']
    end
  end

  describe '#person_game_stats' do
    it 'loads stats for a player in a game' do
      stats = client.person_game_stats(592_450, gamePk: 563_346)

      expect(a_get_request('v1/people/592450/stats/game/563346'))
        .to have_been_made

      expect(stats.count).to eq 3
    end
  end
end

# frozen_string_literal: true

require 'spec_helper'

RSpec.describe MLBStatsAPI::Config do
  let(:client) { MLBStatsAPI::Client.new }

  before { stub_requests! }

  describe '#game_status' do
    it 'loads an extremely long list of game statuses' do
      client.game_status

      expect(a_get_request('v1/gameStatus')).to have_been_made
    end
  end

  describe '#baseball_stats' do
    it 'loads a list of baseball stats' do
      client.baseball_stats

      expect(a_get_request('v1/baseballStats')).to have_been_made
    end
  end

  describe '#game_types' do
    it 'loads a not-so-long list of game types' do
      client.game_types

      expect(a_get_request('v1/gameTypes')).to have_been_made
    end
  end

  describe '#languages' do
    it 'loads a list of languages' do
      client.languages

      expect(a_get_request('v1/languages')).to have_been_made
    end
  end

  describe '#league_leader_types' do
    it 'loads a list of stats that can have leaders' do
      client.league_leader_types

      expect(a_get_request('v1/leagueLeaderTypes')).to have_been_made
    end
  end

  describe '#metrics' do
    it 'loads a list of in-game metrics' do
      client.metrics

      expect(a_get_request('v1/metrics')).to have_been_made
    end
  end

  describe '#platforms' do
    it 'loads a list of media platforms' do
      client.platforms

      expect(a_get_request('v1/platforms')).to have_been_made
    end
  end

  describe '#positions' do
    it 'loads a list of in-game positions' do
      client.positions

      expect(a_get_request('v1/positions')).to have_been_made
    end
  end

  describe '#roster_types' do
    it 'loads a list of types of rosters' do
      client.roster_types

      expect(a_get_request('v1/rosterTypes')).to have_been_made
    end
  end

  describe '#schedule_event_types' do
    it 'loads a list of calendar event types' do
      client.schedule_event_types

      expect(a_get_request('v1/scheduleEventTypes')).to have_been_made
    end
  end

  describe '#situation_codes' do
    it 'loads a list of in-game situations' do
      client.situation_codes

      expect(a_get_request('v1/situationCodes')).to have_been_made
    end
  end

  describe '#standings_types' do
    it 'loads a list of standings types' do
      client.standings_types

      expect(a_get_request('v1/standingsTypes')).to have_been_made
    end
  end

  describe '#stat_groups' do
    it 'loads a list of general stat groups' do
      client.stat_groups

      expect(a_get_request('v1/statGroups')).to have_been_made
    end
  end

  describe '#stat_types' do
    it 'loads a list of individual stats' do
      client.stat_types

      expect(a_get_request('v1/statTypes')).to have_been_made
    end
  end
end

# frozen_string_literal: true

require 'spec_helper'

RSpec.describe MLBStatsAPI::Config do
  let(:client) { MLBStatsAPI::Client.new }

  describe '#game_status' do
    it 'loads an extremely long list of game statuses' do
      list = client.game_status

      expect(list.length).to eq 197

      expect(list[100]['detailedState']).to eq 'Completed Early: Tragedy'
    end
  end

  describe '#game_types' do
    it 'loads a not-so-long list of game types' do
      list = client.game_types

      expect(list.length).to eq 12

      expect(list[7]['description']).to eq 'Nineteenth Century Series'
    end
  end

  describe '#languages' do
    it 'loads a list of languages' do
      list = client.languages

      expect(list.length).to eq 3

      expect(list.map { |lang| lang['name'] }).to eq %w[English Spanish Korean]
    end
  end

  describe '#league_leader_types' do
    it 'loads a list of stats that can have leaders' do
      list = client.league_leader_types

      expect(list.length).to eq 34
    end
  end

  describe '#metrics' do
    it 'loads a list of in-game metrics' do
      list = client.metrics

      expect(list.length).to eq 18
    end
  end

  describe '#platforms' do
    it 'loads a list of media platforms' do
      list = client.platforms

      expect(list.length).to eq 12
    end
  end

  describe '#positions' do
    it 'loads a list of in-game positions' do
      list = client.positions

      expect(list.length).to eq 27
    end
  end

  describe '#roster_types' do
    it 'loads a list of types of rosters' do
      list = client.roster_types

      expect(list.length).to eq 7
    end
  end

  describe '#schedule_event_types' do
    it 'loads a list of calendar event types' do
      list = client.schedule_event_types

      expect(list.length).to eq 19
    end
  end

  describe '#situation_codes' do
    it 'loads a list of in-game situations' do
      list = client.situation_codes

      expect(list.length).to eq 602
    end
  end

  describe '#standings_types' do
    it 'loads a list of standings types' do
      list = client.standings_types

      expect(list.length).to eq 11
    end
  end

  describe '#stat_groups' do
    it 'loads a list of general stat groups' do
      list = client.stat_groups

      expect(list.length).to eq 4
    end
  end

  describe '#stat_types' do
    it 'loads a list of individual stats' do
      list = client.stat_types

      expect(list.length).to eq 23
    end
  end
end

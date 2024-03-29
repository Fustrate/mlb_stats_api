# frozen_string_literal: true

require 'spec_helper'

RSpec.describe MLBStatsAPI::Schedules do
  let(:client) { MLBStatsAPI::Client.new }

  before { stub_requests! }

  describe '#standings' do
    it 'loads general standings with default arguments' do
      client.standings

      expect(a_get_request('v1/standings', hydrate: 'team', leagueId: '103,104'))
        .to have_been_made
    end

    it 'allows requesting no hydration' do
      client.standings(hydrate: nil)

      expect(a_get_request('v1/standings', leagueId: '103,104'))
        .to have_been_made
    end

    it 'allows requesting a specific league' do
      client.standings(leagues: :national)

      expect(a_get_request('v1/standings', hydrate: 'team', leagueId: '104'))
        .to have_been_made
    end

    it 'allows requesting multiple leagues' do
      client.standings(leagues: %i[big_east acc])

      expect(a_get_request('v1/standings', hydrate: 'team', leagueId: '107,108'))
        .to have_been_made
    end

    it 'loads wildcard standings' do
      client.standings(standingsTypes: :wildCard, leagueId: 103)

      expect(a_get_request('v1/standings', hydrate: 'team', leagueId: '103', standingsTypes: 'wildCard'))
        .to have_been_made
    end

    it 'loads spring training standings' do
      client.standings(standingsTypes: :springTraining)

      expect(a_get_request('v1/standings', hydrate: 'team', leagueId: '114,115', standingsTypes: 'springTraining'))
        .to have_been_made
    end
  end
end

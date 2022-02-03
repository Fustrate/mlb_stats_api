# frozen_string_literal: true

module MLBStatsAPI
  # Operations pertaining to standings
  module Standings
    # View standings for a league.
    def standings(options = {})
      options[:hydrate] = 'team' unless options.key?(:hydrate)

      if options[:leagues] && !options[:leagueId]
        league_ids = Leagues::LEAGUES.values_at(*options.delete(:leagues))

        options[:leagueId] = league_ids
      end

      options[:leagueId] = [103, 104] unless Array(options[:leagueId])&.any?

      get '/standings', options
    end
  end
end

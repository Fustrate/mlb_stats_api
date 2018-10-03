# frozen_string_literal: true

module MLBStatsAPI
  # Operations pertaining to sports
  # @see https://statsapi.mlb.com/docs/#tag/sports
  module Sports
    # View information for all sportIds.
    # @see https://statsapi.mlb.com/docs/#operation/sports
    def sports
      get '/sports'
    end

    # View information for any given sportId.
    # @see https://statsapi.mlb.com/docs/#operation/sports
    def sport(sport_id, options = {})
      get "/sports/#{sport_id}", options
    end

    # View information on a players for a given sportId.
    # @see https://statsapi.mlb.com/docs/#operation/sportPlayers
    def sport_players(sport_id, season, options = {})
      options[:season] = season

      get "/sports/#{sport_id}/players", options
    end
  end
end

# frozen_string_literal: true

module MLBStatsAPI
  # Operations pertaining to sports
  module Sports
    # View information for all sportIds.
    def sports() = get('/sports')

    # View information for any given sportId.
    def sport(sport_id, options = {}) = get("/sports/#{sport_id}", options)

    # View information on a players for a given sportId.
    def sport_players(sport_id, season, options = {}) = get("/sports/#{sport_id}/players", options.merge(season:))
  end
end

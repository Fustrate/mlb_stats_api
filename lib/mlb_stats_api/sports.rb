# frozen_string_literal: true

module MLBStatsAPI
  # Operations pertaining to sports
  module Sports
    # View information for all sports.
    def sports = get('/sports')

    # View information for any given sport ID.
    def sport(sport_id, **) = get("/sports/#{sport_id}", **)

    # View information on all players for a given sport ID, optionally filtered by season.
    def sport_players(sport_id, season, **options) = get("/sports/#{sport_id}/players", **options.merge(season:))
  end
end

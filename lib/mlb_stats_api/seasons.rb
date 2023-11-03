# frozen_string_literal: true

module MLBStatsAPI
  # Operations pertaining to seasons
  module Seasons
    # View current season info.
    def seasons(**) = get('/seasons', sportId: 1, **)

    # View information on an individual season.
    def season(year, **) = get("/seasons/#{year}", sportId: 1, **)
  end
end

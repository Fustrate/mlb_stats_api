# frozen_string_literal: true

module MLBStatsAPI
  # Operations pertaining to seasons
  module Seasons
    # View current season info.
    def seasons(options = {}) = get('/seasons', { sportId: 1 }.merge(options))

    # View information on an individual season.
    def season(year, options = {}) = get("/seasons/#{year}", { sportId: 1 }.merge(options))
  end
end

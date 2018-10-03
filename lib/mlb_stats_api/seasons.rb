# frozen_string_literal: true

module MLBStatsAPI
  # Operations pertaining to seasons
  # @see https://statsapi.mlb.com/docs/#tag/season
  module Seasons
    # View current season info.
    # @see https://statsapi.mlb.com/docs/#operation/seasons
    def seasons(options = {})
      get '/seasons', { sportId: 1 }.merge(options)
    end

    # View information on an individual season.
    # @see https://statsapi.mlb.com/docs/#operation/seasons
    def season(year, options = {})
      get "/seasons/#{year}", { sportId: 1 }.merge(options)
    end
  end
end

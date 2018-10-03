# frozen_string_literal: true

module MLBStatsAPI
  # Operations pertaining to seasons
  # @see https://statsapi.mlb.com/docs/#tag/season
  module Seasons
    # Fetch one or more seasons' start and end dates
    #
    # @param year [String] comma-separated list of years
    #
    # @return [Array<Hash>] a list of matching seasons
    def seasons(year: nil)
      get '/seasons', sportId: 1, season: year
    end
    alias season seasons
  end
end

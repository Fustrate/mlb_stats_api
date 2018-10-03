# frozen_string_literal: true

# Although this group has two endpoints, they both have the same function.
#
# /v1/seasons/{seasonId} is the same as /v1/seasons?season={seasonId}
module MLBStatsAPI
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

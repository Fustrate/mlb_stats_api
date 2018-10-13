# frozen_string_literal: true

module MLBStatsAPI
  # Operations pertaining to stats
  # @see https://statsapi.mlb.com/docs/#tag/stats
  module Stats
    # View statistics based on statType, group, season, and organization.
    # @see https://statsapi.mlb.com/docs/#operation/stats
    def stats(options = {})
      raise ArgumentError, '#stats requires a stats arg' unless options[:stats]
      raise ArgumentError, '#stats requires a group arg' unless options[:group]

      get '/stats', options
    end

    # View leaders for a statistic.
    # @see https://statsapi.mlb.com/docs/#operation/leaders
    def stats_leaders(options = {})
      unless options[:leaderCategories]
        raise ArgumentError, '#stats_leaders requires a leaderCategories arg'
      end

      get '/stats/leaders', options
    end
  end
end

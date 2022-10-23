# frozen_string_literal: true

module MLBStatsAPI
  # Operations pertaining to stats
  module Stats
    # View statistics based on statType, group, season, and organization.
    def stats(**options)
      raise ArgumentError, '#stats requires a stats arg' unless options[:stats]
      raise ArgumentError, '#stats requires a group arg' unless options[:group]

      get '/stats', **options
    end

    # View leaders for a statistic.
    def stats_leaders(**options)
      raise ArgumentError, '#stats_leaders requires a leaderCategories arg' unless options[:leaderCategories]

      get '/stats/leaders', **options
    end
  end
end

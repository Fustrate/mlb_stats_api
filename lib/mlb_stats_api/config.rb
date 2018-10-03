# frozen_string_literal: true

module MLBStatsAPI
  # These methods all return lists of possible values
  # @see https://statsapi.mlb.com/docs/#tag/config
  module Config
    # @see https://statsapi.mlb.com/docs/#operation/gameStatus
    def game_status
      get('/gameStatus')
    end

    # @see https://statsapi.mlb.com/docs/#operation/baseballStats
    def baseball_stats
      get('/baseballStats')
    end

    # @see https://statsapi.mlb.com/docs/#operation/gameTypes
    def game_types
      get('/gameTypes')
    end

    # @see https://statsapi.mlb.com/docs/#operation/languages
    def languages
      get('/languages')
    end

    # @see https://statsapi.mlb.com/docs/#operation/leagueLeaderTypes
    def league_leader_types
      get('/leagueLeaderTypes')
    end

    # @see https://statsapi.mlb.com/docs/#operation/metrics
    def metrics
      get('/metrics')
    end

    # @see https://statsapi.mlb.com/docs/#operation/platforms
    def platforms
      get('/platforms')
    end

    # @see https://statsapi.mlb.com/docs/#operation/positions
    def positions
      get('/positions')
    end

    # @see https://statsapi.mlb.com/docs/#operation/rosterTypes
    def roster_types
      get('/rosterTypes')
    end

    # @see https://statsapi.mlb.com/docs/#operation/scheduleEventTypes
    def schedule_event_types
      get('/scheduleEventTypes')
    end

    # @see https://statsapi.mlb.com/docs/#operation/sitCodes
    def situation_codes
      get('/situationCodes')
    end

    # @see https://statsapi.mlb.com/docs/#operation/standingsTypes
    def standings_types
      get('/standingsTypes')
    end

    # @see https://statsapi.mlb.com/docs/#operation/statGroups
    def stat_groups
      get('/statGroups')
    end

    # @see https://statsapi.mlb.com/docs/#operation/statTypes
    def stat_types
      get('/statTypes')
    end
  end
end

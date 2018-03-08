# frozen_string_literal: true

module MLBStatsAPI
  module Config
    def game_status
      get('/gameStatus')
    end

    def game_types
      get('/gameTypes')
    end

    def languages
      get('/languages')
    end

    def league_leader_types
      get('/leagueLeaderTypes')
    end

    def metrics
      get('/metrics')
    end

    def platforms
      get('/platforms')
    end

    def positions
      get('/positions')
    end

    def roster_types
      get('/rosterTypes')
    end

    def schedule_event_types
      get('/scheduleEventTypes')
    end

    def situation_codes
      get('/situationCodes')
    end

    def standings_types
      get('/standingsTypes')
    end

    def stat_groups
      get('/statGroups')
    end

    def stat_types
      get('/statTypes')
    end
  end
end

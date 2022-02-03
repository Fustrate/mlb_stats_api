# frozen_string_literal: true

module MLBStatsAPI
  # These methods all return lists of possible values
  module Config
    def game_status = get('/gameStatus')

    def baseball_stats = get('/baseballStats')

    def game_types = get('/gameTypes')

    def languages = get('/languages')

    def league_leader_types = get('/leagueLeaderTypes')

    def metrics = get('/metrics')

    def platforms = get('/platforms')

    def positions = get('/positions')

    def roster_types = get('/rosterTypes')

    def schedule_event_types = get('/scheduleEventTypes')

    def situation_codes = get('/situationCodes')

    def standings_types = get('/standingsTypes')

    def stat_groups = get('/statGroups')

    def stat_types = get('/statTypes')
  end
end

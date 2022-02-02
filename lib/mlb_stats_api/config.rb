# frozen_string_literal: true

module MLBStatsAPI
  # These methods all return lists of possible values
  # @see https://statsapi.mlb.com/docs/#tag/config
  module Config
    # @see https://statsapi.mlb.com/docs/#operation/gameStatus
    def game_status = get('/gameStatus')

    # @see https://statsapi.mlb.com/docs/#operation/baseballStats
    def baseball_stats = get('/baseballStats')

    # @see https://statsapi.mlb.com/docs/#operation/gameTypes
    def game_types = get('/gameTypes')

    # @see https://statsapi.mlb.com/docs/#operation/languages
    def languages = get('/languages')

    # @see https://statsapi.mlb.com/docs/#operation/leagueLeaderTypes
    def league_leader_types = get('/leagueLeaderTypes')

    # @see https://statsapi.mlb.com/docs/#operation/metrics
    def metrics = get('/metrics')

    # @see https://statsapi.mlb.com/docs/#operation/platforms
    def platforms = get('/platforms')

    # @see https://statsapi.mlb.com/docs/#operation/positions
    def positions = get('/positions')

    # @see https://statsapi.mlb.com/docs/#operation/rosterTypes
    def roster_types = get('/rosterTypes')

    # @see https://statsapi.mlb.com/docs/#operation/scheduleEventTypes
    def schedule_event_types = get('/scheduleEventTypes')

    # @see https://statsapi.mlb.com/docs/#operation/sitCodes
    def situation_codes = get('/situationCodes')

    # @see https://statsapi.mlb.com/docs/#operation/standingsTypes
    def standings_types = get('/standingsTypes')

    # @see https://statsapi.mlb.com/docs/#operation/statGroups
    def stat_groups = get('/statGroups')

    # @see https://statsapi.mlb.com/docs/#operation/statTypes
    def stat_types = get('/statTypes')
  end
end

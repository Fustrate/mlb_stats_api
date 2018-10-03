# frozen_string_literal: true

module MLBStatsAPI
  # Operations pertaining to players,umpires, and coaches
  # @see https://statsapi.mlb.com/docs/#tag/person
  module People
    # View one or more person's stats and biographical information.
    # @see https://statsapi.mlb.com/docs/#operation/person
    def person(person_ids, options = {})
      ids = Array(person_ids)

      result = get '/people', options.merge(personIds: ids)

      return result.dig('people', 0) if ids.length == 1

      result
    end
    alias people person

    #
    # @see https://statsapi.mlb.com/docs/#operation/currentGameStats
    def person_game_stats(person_id, options = {})
      get(
        "/people/#{person_id}/game/#{options.delete(:gamePk) || 'current'}",
        options
      )
    end
  end
end

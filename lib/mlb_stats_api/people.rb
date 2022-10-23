# frozen_string_literal: true

module MLBStatsAPI
  # Operations pertaining to players, umpires, and coaches
  module People
    # View one or more person's stats and biographical information.
    def person(person_ids, **options)
      ids = Array(person_ids)

      result = get('/people', **options.merge(personIds: ids))['people']

      return result.first if ids.length == 1

      result
    end
    alias people person

    # View a player's stats for a specific game.
    def person_game_stats(person_id, **options)
      game = options.delete(:gamePk) || 'current'

      get("/people/#{person_id}/stats/game/#{game}", **options)['stats']
    end
  end
end

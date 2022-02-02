# frozen_string_literal: true

module MLBStatsAPI
  # @see https://statsapi.mlb.com/docs/#tag/homerunderby
  module HomeRunDerby
    # View a home run derby object based on gamePk.
    # @see https://statsapi.mlb.com/docs/#operation/homeRunDerbyBracket
    def home_run_derby(game_pk, options = {}) = get("/homeRunDerby/#{game_pk}", options)

    # View a home run derby object based on bracket.
    # @see https://statsapi.mlb.com/docs/#operation/homeRunDerbyBracket
    def home_run_derby_bracket(game_pk, options = {}) = get("/homeRunDerby/#{game_pk}/bracket", options)

    # View a home run derby object based on pool.
    # @see https://statsapi.mlb.com/docs/#operation/homeRunDerbyPool
    def home_run_derby_pool(game_pk, options = {}) = get("/homeRunDerby/#{game_pk}/pool", options)
  end
end

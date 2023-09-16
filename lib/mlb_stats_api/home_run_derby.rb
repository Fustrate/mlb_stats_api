# frozen_string_literal: true

module MLBStatsAPI
  module HomeRunDerby
    # View a home run derby object based on gamePk.
    def home_run_derby(game_pk, **) = get("/homeRunDerby/#{game_pk}", **)

    # View a home run derby object based on bracket.
    def home_run_derby_bracket(game_pk, **) = get("/homeRunDerby/#{game_pk}/bracket", **)

    # View a home run derby object based on pool.
    def home_run_derby_pool(game_pk, **) = get("/homeRunDerby/#{game_pk}/pool", **)
  end
end

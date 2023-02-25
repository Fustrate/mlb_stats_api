# frozen_string_literal: true

module MLBStatsAPI
  # Operations pertaining to leagues
  module Leagues
    LEAGUES = {
      acc: 108,
      al: 103,
      american: 103,
      big_east: 107,
      cactus: 114,
      california: 110,
      eastern: 113,
      grapefruit: 115,
      international: 117,
      midwest: 118,
      national: 104,
      nl: 104,
      pcl: 112,
      south_atlantic: 116,
      southern: 111,
      texas: 109
    }.freeze

    # View league information.
    def leagues(**options)
      raise ArgumentError, '#leagues requires a sportId or leagueIds' unless options[:sportId] || options[:leagueIds]

      get '/league', **options
    end

    # View All-Star Ballots per league.
    def all_star_ballot(league_id, season = nil, **options)
      options[:season] = season || Time.now.year

      get "/league/#{league_id}/allStarBallot", **options
    end

    # View All-Star Write-ins per league.
    def all_star_write_ins(league_id, season = nil, **options)
      options[:season] = season || Time.now.year

      get "/league/#{league_id}/allStarWriteIns", **options
    end

    # View All-Star Final Vote per league.
    def all_star_final_vote(league_id, season = nil, **options)
      options[:season] = season || Time.now.year

      get "/league/#{league_id}/allStarFinalVote", **options
    end
  end
end

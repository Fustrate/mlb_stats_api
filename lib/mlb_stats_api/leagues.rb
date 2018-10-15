# frozen_string_literal: true

module MLBStatsAPI
  # Operations pertaining to leagues
  # @see https://statsapi.mlb.com/docs/#tag/league
  module Leagues
    LEAGUES = {
      american: 103,
      national: 104,
      al: 103,
      nl: 104,
      big_east: 107,
      acc: 108,
      texas: 109,
      california: 110,
      southern: 111,
      pcl: 112,
      eastern: 113,
      cactus: 114,
      grapefruit: 115,
      south_atlantic: 116,
      international: 117,
      midwest: 118
    }.freeze

    # View league information.
    # @see https://statsapi.mlb.com/docs/#operation/league
    def leagues(options = {})
      unless options[:sportId] || options[:leagueIds]
        raise ArgumentError, '#leagues requires a sportId or leagueIds'
      end

      get '/league', options
    end

    # View All-Star Ballots per league.
    # @see https://statsapi.mlb.com/docs/#operation/allStarBallot
    def all_star_ballot(league_id, season = nil, options = {})
      options[:season] = season || Time.now.year

      get "/league/#{league_id}/allStarBallot", options
    end

    # View All-Star Write-ins per league.
    # @see https://statsapi.mlb.com/docs/#operation/allStarWriteIns
    def all_star_write_ins(league_id, season = nil, options = {})
      options[:season] = season || Time.now.year

      get "/league/#{league_id}/allStarWriteIns", options
    end

    # View All-Star Final Vote per league.
    # @see https://statsapi.mlb.com/docs/#operation/allStarFinalVote
    def all_star_final_vote(league_id, season = nil, options = {})
      options[:season] = season || Time.now.year

      get "/league/#{league_id}/allStarFinalVote", options
    end
  end
end

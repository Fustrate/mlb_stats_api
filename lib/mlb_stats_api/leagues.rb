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
  end
end

# frozen_string_literal: true

module MLBStatsAPI
  module Divisions
    # There are actually far more divisions from other leagues in the API.
    # I don't think I'll add them until necessary.
    DIVISIONS = {
      al_east: 201,
      al_central: 202,
      al_west: 200,
      nl_east: 204,
      nl_central: 205,
      nl_west: 203
    }.freeze

    # View league division directorial information.
    def divisions(options = {}) = get('/divisions', options)
  end
end

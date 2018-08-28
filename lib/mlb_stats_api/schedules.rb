# frozen_string_literal: true

module MLBStatsAPI
  module Schedules
    def schedule(options = {})
      get('/schedule', options)
    end
  end
end

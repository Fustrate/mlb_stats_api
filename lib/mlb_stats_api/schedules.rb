# frozen_string_literal: true

module MLBStatsAPI
  module Schedules
    SCHEDULE_TYPES = {
      default: '/schedule',
      postseason: '/schedule/postseason',
      tied: '/schedule/games/tied',
      postseason_series: '/schedule/postseason/series',
      tune_in: '/schedule/postseason/tuneIn'
    }.freeze

    def schedule(type = :default, options = {})
      raise ArgumentError, 'invalid schedule type' unless SCHEDULE_TYPES[type]

      get(SCHEDULES[type], options)
    end
  end
end

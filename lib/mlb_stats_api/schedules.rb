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

    def schedule(**options)
      endpoint = SCHEDULE_TYPES[options.delete(:type) || :default]

      raise ArgumentError, 'Invalid schedule type.' unless endpoint

      get endpoint, **{ sportId: 1 }.merge(options)
    end
  end
end

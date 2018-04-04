# frozen_string_literal: true

module MLBStatsAPI
  class Venue < Base
    def id
      @data['id']
    end

    def name
      @data['name']
    end
  end
end

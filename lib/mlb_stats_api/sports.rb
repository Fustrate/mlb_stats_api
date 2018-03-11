# frozen_string_literal: true

module MLBStatsAPI
  module Sports
    def sports
      get('/sports')
    end

    def sport(sport_id)
      get("/sports/#{sport_id}")
    end
  end
end

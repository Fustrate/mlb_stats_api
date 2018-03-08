# frozen_string_literal: true

module MLBStatsAPI
  module People
    # This can find a player, coach, or umpire by ID
    def person(person_id)
      get("/people/#{person_id}")['people'].first
    end
  end
end

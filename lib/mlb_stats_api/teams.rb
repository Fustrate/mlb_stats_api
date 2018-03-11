# frozen_string_literal: true

module MLBStatsAPI
  module Teams
    def team(team_id)
      get("/teams/#{team_id}")
    end
  end
end

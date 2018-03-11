# frozen_string_literal: true

module MLBStatsAPI
  module Teams
    def team(team_id)
      get("/teams/#{team_id}")
    end

    def affiliates(team_id, season: nil)
      get("/teams/#{team_id}/affiliates", season: season)
    end

    def coaches(team_id, date: nil)
      date ||= Date.today

      get("/teams/#{team_id}/coaches", date: date.strftime('%m/%d/%Y'))
    end

    # def leaders(team_id)
    #   get("/teams/#{team_id}/leaders")
    # end

    def roster(team_id, type:, date: nil)
      get("/teams/#{team_id}/roster/#{type}", date: date.strftime('%m/%d/%Y'))
    end
  end
end

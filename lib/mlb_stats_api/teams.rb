# frozen_string_literal: true

module MLBStatsAPI
  module Teams
    def team(team_id)
      data = fetch("mlb_stats_api:teams:#{team_id}") do
        get("/teams/#{team_id}").dig('teams', 0)
      end

      MLBStatsAPI::Team.new data
    end

    def teams(*team_ids)
      teams = []
      ids = []

      team_ids.map do |team_id|
        value = @cache.load("mlb_stats_api:teams:#{team_id}")

        if value
          teams << MLBStatsAPI::Team.new(value)
        else
          ids << team_id
        end
      end

      return teams if ids.none?

      get('/teams', teamId: ids.join(',')).dig('teams').each do |data|
        teams << MLBStatsAPI::Team.new(data)

        @cache.store("mlb_stats_api:teams:#{data['id']}", data)
      end

      teams
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

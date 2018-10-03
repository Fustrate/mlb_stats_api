# frozen_string_literal: true

module MLBStatsAPI
  module Teams
    def team(team_id)
      data = load("mlb_stats_api:teams:#{team_id}") do
        get("/teams/#{team_id}", hydrate: 'venue(timezone)').dig('teams', 0)
      end

      MLBStatsAPI::Team.new data
    end

    def teams(*team_ids)
      teams = ids = []

      team_ids.each do |team_id|
        value = @cache.load("mlb_stats_api:teams:#{team_id}")

        if value
          teams << MLBStatsAPI::Team.new(value)
        else
          ids << team_id
        end
      end

      teams.concat load_teams_by_id(ids)
    end

    def affiliates(team_id, season: nil)
      get "/teams/#{team_id}/affiliates", season: season
    end

    def coaches(team_id, date: nil)
      date ||= Date.today

      get "/teams/#{team_id}/coaches", date: date.strftime('%m/%d/%Y')
    end

    # def leaders(team_id)
    #   get("/teams/#{team_id}/leaders")
    # end

    def roster(team_id, type:, date: nil)
      get "/teams/#{team_id}/roster/#{type}", date: date.strftime('%m/%d/%Y')
    end

    protected

    def load_teams_by_id(ids)
      return [] if ids.none?

      get('/teams', teamId: ids.join(','), hydrate: 'venue(timezone)')
        .dig('teams')
        .map do |data|
          @cache.store("mlb_stats_api:teams:#{data['id']}", data)

          MLBStatsAPI::Team.new(data)
        end
    end
  end
end

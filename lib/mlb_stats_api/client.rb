# frozen_string_literal: true

module MLBStatsAPI
  class Client
    include HTTParty

    include MLBStatsAPI::Conferences
    include MLBStatsAPI::Config
    include MLBStatsAPI::Divisions
    include MLBStatsAPI::Drafts
    include MLBStatsAPI::Games
    include MLBStatsAPI::HomeRunDerby
    include MLBStatsAPI::Leagues
    include MLBStatsAPI::People
    include MLBStatsAPI::Schedules
    include MLBStatsAPI::Seasons
    include MLBStatsAPI::Sports
    include MLBStatsAPI::Standings
    include MLBStatsAPI::Stats
    include MLBStatsAPI::Teams
    include MLBStatsAPI::Venues

    DEFAULT_VERSION = '1'

    headers 'Content-Type' => 'application/json', 'Accept-Encoding' => 'gzip'

    base_uri 'http://statsapi-default-elb-prod-876255662.us-east-1.elb.amazonaws.com'

    def get(endpoint, query = {})
      version = query.delete(:version) || DEFAULT_VERSION

      response = self.class.get("/api/v#{version}#{endpoint}", query: query)

      raise_exception(response) unless response.code == 200

      response.parsed_response
    end

    protected

    def raise_exception(response)
      case response.code
      when 401
        raise MLBStatsAPI::UnauthorizedError, response
      when 403
        raise MLBStatsAPI::ForbiddenError, response
      when 404
        raise MLBStatsAPI::NotFoundError, response
      else
        raise MLBStatsAPI::Error, response
      end
    end
  end
end

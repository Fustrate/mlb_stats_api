# frozen_string_literal: true

require 'logger'

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

    headers 'Content-Type' => 'application/json'
    # , 'Accept-Encoding' => 'gzip, deflate'

    base_uri 'http://statsapi.mlb.com'

    format :json

    attr_accessor :logger

    def initialize(logger: nil)
      @logger = logger || ::Logger.new(STDOUT)
    end

    def get(endpoint, query = {})
      url = "/api/v#{query.delete(:version) || DEFAULT_VERSION}#{endpoint}"

      query.reject! { |_, v| v.nil? }

      @logger&.info("Fetching URL: #{url} Query: #{query.inspect}")

      response = if query.any?
                   self.class.get(url, query: query)
                 else
                   self.class.get(url)
                 end

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

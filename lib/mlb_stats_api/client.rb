# frozen_string_literal: true

require 'httparty'
require 'json'
require 'logger'
require 'moneta'

module MLBStatsAPI
  class Client
    include ::HTTParty

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

    # They keep switching this damn thing around!
    base_uri 'http://statsapi.mlb.com/'
    # base_uri 'http://statsapi-default-elb-prod-876255662.us-east-1.elb.amazonaws.com/'

    format :json

    attr_accessor :logger, :cache

    def initialize(logger: IO::NULL, cache: nil)
      @cache = if cache
                 Moneta.new(cache.class.to_s.to_sym, backend: cache)
               else
                 Moneta.new(:Null)
               end

      @logger = logger.respond_to?(:log) ? logger : ::Logger.new(logger)
    end

    def get(endpoint, **query)
      url = "/api/v#{query.delete(:version) || DEFAULT_VERSION}#{endpoint}"

      args = normalize_query_args(query)

      @logger.info "Fetching URL: #{url} Query: #{args.inspect}"

      response = self.class.get url, query: args.merge(t: Time.now.to_i)

      raise_exception(response) unless response.code == 200

      response.parsed_response
    end

    def normalize_query_args(query) = query.compact.transform_values { _1.is_a?(Array) ? _1.join(',') : _1 }

    def load(key, **options)
      value = cache.load(key)

      return value if value

      value = yield

      cache.store(key, value, options)

      value
    end

    protected

    def raise_exception(response)
      case response.code
      when 401
        raise MLBStatsAPI::Errors::UnauthorizedError, response
      when 403
        raise MLBStatsAPI::Errors::ForbiddenError, response
      when 404
        raise MLBStatsAPI::Errors::NotFoundError, response
      else
        raise MLBStatsAPI::Errors::Error, response
      end
    end
  end
end

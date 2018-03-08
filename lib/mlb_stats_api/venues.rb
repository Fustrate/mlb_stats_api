# frozen_string_literal: true

require 'mlb_stats_api/venue'

module MLBStatsAPI
  module Venues
    def venue(venue_id)
      MLBStatsAPI::Venue.new get("/venues/#{venue_id}")['venues'].first
    end
  end
end

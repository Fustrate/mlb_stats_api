# frozen_string_literal: true

module MLBStatsAPI
  module Venues
    def venue(venue_id)
      MLBStatsAPI::Venue.new get("/venues/#{venue_id}")['venues'].first
    end
  end
end

# frozen_string_literal: true

module MLBStatsAPI
  module Venues
    def venue(venue_id)
      MLBStatsAPI::Venue.new get("/venues/#{venue_id}").dig('venues', 0)
    end
  end
end

# frozen_string_literal: true

module MLBStatsAPI
  # Operations pertaining to venues
  module Venues
    # View information for a venue based on venueId.
    def venue(venue_id) = get("/venues/#{venue_id}").dig('venues', 0)
  end
end

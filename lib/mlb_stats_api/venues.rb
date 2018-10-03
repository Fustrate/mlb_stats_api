# frozen_string_literal: true

module MLBStatsAPI
  # Operations pertaining to venues
  # @see https://statsapi.mlb.com/docs/#tag/venue
  module Venues
    # View information for a venue based on venueId.
    # @see https://statsapi.mlb.com/docs/#operation/venues
    def venue(venue_id)
      MLBStatsAPI::Venue.new get("/venues/#{venue_id}").dig('venues', 0)
    end
  end
end

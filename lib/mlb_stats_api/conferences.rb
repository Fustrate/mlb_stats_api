# frozen_string_literal: true

module MLBStatsAPI
  # Only the Pacific Coast League uses conferences
  module Conferences
    # View all PCL conferences.
    def conferences(**) = get('/conferences', **)

    # View PCL conferences by conference ID.
    def conference(conference_id, **) = get("/conferences/#{conference_id}", **)
  end
end

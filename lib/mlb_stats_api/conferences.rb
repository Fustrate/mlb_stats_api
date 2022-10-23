# frozen_string_literal: true

module MLBStatsAPI
  # Only the Pacific Coast League uses conferences
  module Conferences
    # View all PCL conferences.
    def conferences(**options) = get('/conferences', **options)

    # View PCL conferences by conference ID.
    def conference(conference_id, **options) = get("/conferences/#{conference_id}", **options)
  end
end

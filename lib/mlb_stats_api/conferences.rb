# frozen_string_literal: true

module MLBStatsAPI
  # Only the Pacific Coast League uses conferences
  # @see https://statsapi.mlb.com/docs/#tag/conference
  module Conferences
    # View all PCL conferences.
    # @see https://statsapi.mlb.com/docs/#operation/conferences
    def conferences(options = {})
      get '/conferences', options
    end

    # View PCL conferences by conferenceId.
    # @see https://statsapi.mlb.com/docs/#operation/conferences
    def conference(conference_id, options = {})
      get "/conferences/#{conference_id}", options
    end
  end
end

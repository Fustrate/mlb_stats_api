# frozen_string_literal: true

module MLBStatsAPI
  # Operations pertaining to MLB Rule 4 Draft (First-Year Player Draft)
  # @see https://statsapi.mlb.com/docs/#tag/draft
  module Drafts
    # View drafted players by year.
    # @see https://statsapi.mlb.com/docs/#operation/draft
    def draft(year, options = {}) = get("/draft/#{year}", options)

    # View draft eligible prospects by year.
    # @see https://statsapi.mlb.com/docs/#operation/draftProspects
    def draft_prospects(year, options = {}) = get("/draft/#{year}/prospects", options)

    # View latest player drafted, endpoint best used when draft is currently
    # open.
    # @see https://statsapi.mlb.com/docs/#operation/latestDraftPicks
    def draft_latest(year, options = {}) = get("/draft/#{year}/latest", options)
  end
end

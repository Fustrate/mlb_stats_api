# frozen_string_literal: true

module MLBStatsAPI
  # Operations pertaining to MLB Rule 4 Draft (First-Year Player Draft)
  module Drafts
    # View drafted players by year.
    def draft(year, **) = get("/draft/#{year}", **)

    # View draft eligible prospects by year.
    def draft_prospects(year, **) = get("/draft/#{year}/prospects", **)

    # View latest player drafted, endpoint best used when draft is currently open.
    def draft_latest(year, **) = get("/draft/#{year}/latest", **)
  end
end

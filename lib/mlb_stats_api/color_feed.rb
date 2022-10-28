# frozen_string_literal: true

require 'hana'

module MLBStatsAPI
  class ColorFeed < Base
    attr_reader :game_pk

    def initialize(api, game_pk, data)
      super(data)

      @api = api
      @game_pk = game_pk
    end

    def items
      return [] unless @data

      @data['items']
    end

    def reload!
      @data = @api.get("/game/#{@game_pk}/feed/color")

      true
    rescue Net::OpenTimeout
      false
    end

    # The color feed doesn't use diffs, even though there's an endpoint for it.
    alias update! reload!

    # def timestamps
    #   @api.color_feed_timestamps(@id)
    # end

    # def update!
    #   return reload! unless @data

    #   diffs = @api.color_feed_diff(
    #     @data['game_pk'],
    #     timecode: @data['timecode']
    #   )

    #   return process_diffs(diffs) if diffs.is_a?(Array)

    #   # If the diff is too large or too old, a new feed is returned
    #   @data = diffs if diffs.is_a?(Hash)

    #   true
    # rescue Net::OpenTimeout
    #   false
    # end

    # def process_diffs(diffs)
    #   diffs.each do |diff_set|
    #     Hana::Patch.new(diff_set['diff']).apply(@data)
    #   end

    #   @api.logger&.info 'Successfully processed color feed diff'

    #   true
    # rescue Hana::Patch::Exception
    #   @api.logger&.info 'Failed to process color feed diff; nuking'

    #   # Nuke it!
    #   @data = nil

    #   reload!

    #   false
    # end
  end
end

# frozen_string_literal: true

module MLBStatsAPI
  class LiveFeed < Base
    attr_reader :id

    def initialize(api, data)
      @api = api
      @data = data

      # If we need to nuke and start over, keep this piece
      @id = data['gameData']['game']['pk']
    end

    def boxscore
      @data['liveData']['boxscore']
    end

    def decisions
      @data['liveData']['decisions']
    end

    def leaders
      @data['liveData']['leaders']
    end

    def linescore
      @data['liveData']['linescore']
    end

    def plays
      @data['liveData']['plays']
    end

    def timestamps
      @api.live_feed_timestamps(@id)
    end

    def reload!
      @data = @api.get("/game/#{@id}/feed/live", version: '1.1')

      true
    end

    def update!
      return reload! unless @data

      diffs = @api.live_feed_diff(
        @data['gamePk'],
        timecode: @data['metaData']['timeStamp']
      )

      return process_diffs(diffs) if diffs.is_a(Array)

      # If the diff is too large or too old, a new feed is returned
      @data = diffs if diffs.is_a?(Hash)

      true
    end

    def process_diffs(diffs)
      diffs.each do |diff_set|
        Hana::Patch.new(diff_set['diff']).apply(@data)
      end

      @api.logger&.info 'Successfully processed live feed diff'

      true
    rescue Hana::Patch::Exception
      @api.logger&.info 'Failed to process live feed diff; nuking'

      # Nuke it!
      @data = nil

      reload!

      false
    end
  end
end

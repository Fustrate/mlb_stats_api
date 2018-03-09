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
    end

    def update!
      return reload! unless @data

      diffs = @api.live_feed_diff(
        @data['gamePk'],
        timecode: @data['metaData']['timeStamp']
      )

      begin
        diffs.each do |diff_set|
          patch = Hana::Patch.new diff_set['diff']

          @data = patch.apply(@data)
        end
      rescue Hana::Patch::Exception
        # Nuke it!
        @data = nil

        reload!
      end
    end
  end
end

# frozen_string_literal: true

module MLBStatsAPI
  class LiveFeed < Base
    attr_reader :id

    def initialize(api, data)
      super(data)

      @api = api

      # If we need to nuke and start over, keep this piece
      @id = data['gamePk']
    end

    def game_data = @data['gameData']

    def live_data = @data['liveData']

    def metadata = @data['metaData']

    def boxscore = @data.dig('liveData', 'boxscore')

    def decisions = @data.dig('liveData', 'decisions')

    def leaders = @data.dig('liveData', 'leaders')

    def linescore = @data.dig('liveData', 'linescore')

    def plays = @data.dig('liveData', 'plays')

    def timestamps = @api.live_feed_timestamps(@id)

    def reload!
      @data = @api.get("/game/#{@id}/feed/live", version: '1.1')

      true
    rescue Net::OpenTimeout
      false
    end

    def update!
      return reload! unless @data

      diffs = @api.live_feed_diff(
        @data['gamePk'],
        timecode: @data.dig('metaData', 'timeStamp')
      )

      return process_diffs(diffs) if diffs.is_a?(Array)

      # If the diff is too large or too old, a new feed is returned
      @data = diffs if diffs.is_a?(Hash)

      true
    rescue Net::OpenTimeout
      false
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

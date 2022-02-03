# frozen_string_literal: true

module MLBStatsAPI
  module Games
    PREGAME_STATUSES = /Preview|Warmup|Pre-Game|Delayed Start|Scheduled/
    POSTGAME_STATUSES = /Final|Game Over|Postponed|Completed Early/

    def self.pregame_status?(status) = PREGAME_STATUSES.match?(status)

    def self.postgame_status?(status) = POSTGAME_STATUSES.match?(status)

    def boxscore(game_id) = get("/game/#{game_id}/boxscore")

    def content(game_id, limit: nil) = get("/game/#{game_id}/content", highlightLimit: limit)

    def context_metrics(game_id, timecode: nil) = get("/game/#{game_id}/contextMetrics", timecode:)

    # This endpoint can return very large payloads. It is STRONGLY recommended that clients ask for diffs and use
    # "Accept-Encoding: gzip" header.
    def live_feed(game_id, timecode: nil)
      MLBStatsAPI::LiveFeed.new self, get("/game/#{game_id}/feed/live", version: '1.1', timecode:)
    end

    def live_feed_diff(game_id, timecode: nil, snapshot_at: nil)
      query = { version: '1.1' }

      if timecode
        query[:startTimecode] = timecode
      elsif snapshot_at
        query[:endTimecode] = snapshot_at
      else
        raise ArgumentError, 'Please pass either a timecode or a snapshot.'
      end

      get "/game/#{game_id}/feed/live/diffPatch", query
    end

    def live_feed_timestamps(game_id) = get("/game/#{game_id}/feed/live/timestamps", version: '1.1')

    def color_feed(game_id, timecode: nil)
      MLBStatsAPI::ColorFeed.new self, game_id, get("/game/#{game_id}/feed/color", timecode:)
    end

    # def color_feed_diff(game_id, timecode: nil, snapshot_at: nil)
    #   query = {}

    #   if timecode
    #     query[:startTimecode] = timecode
    #   elsif snapshot_at
    #     query[:endTimecode] = snapshot_at
    #   else
    #     raise ArgumentError, 'Please pass either a timecode or a snapshot.'
    #   end

    #   get "/game/#{game_id}/feed/color/diffPatch", query
    # end

    # def color_feed_timestamps(game_id)
    #   get "/game/#{game_id}/feed/color/timestamps"
    # end

    def linescore(game_id) = get("/game/#{game_id}/linescore")

    def play_by_play(game_id, timecode: nil) = get("/game/#{game_id}/playByPlay", timecode:)

    def win_probability(game_id, timecode: nil) = get("/game/#{game_id}/winProbability", timecode:)
  end
end

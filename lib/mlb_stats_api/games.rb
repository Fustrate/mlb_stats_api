# frozen_string_literal: true

module MLBStatsAPI
  module Games
    PREGAME_STATUSES = /Preview|Warmup|Pre-Game|Delayed Start|Scheduled/
    POSTGAME_STATUSES = /Final|Game Over|Postponed|Completed Early/

    def self.pregame_status?(status) = PREGAME_STATUSES.match?(status)

    def self.postgame_status?(status) = POSTGAME_STATUSES.match?(status)

    def boxscore(game_pk) = get("/game/#{game_pk}/boxscore")

    def content(game_pk, limit: nil) = get("/game/#{game_pk}/content", highlightLimit: limit)

    def context_metrics(game_pk, timecode: nil) = get("/game/#{game_pk}/contextMetrics", timecode:)

    # This endpoint can return very large payloads. It is STRONGLY recommended that clients ask for diffs and use
    # "Accept-Encoding: gzip" header.
    def live_feed(game_pk, timecode: nil)
      MLBStatsAPI::LiveFeed.new self, get("/game/#{game_pk}/feed/live", version: '1.1', timecode:)
    end

    def live_feed_diff(game_pk, timecode: nil, snapshot_at: nil)
      query = { version: '1.1' }

      if timecode
        query[:startTimecode] = timecode
      elsif snapshot_at
        query[:endTimecode] = snapshot_at
      else
        raise ArgumentError, 'Please pass either a timecode or a snapshot.'
      end

      get "/game/#{game_pk}/feed/live/diffPatch", query
    end

    def live_feed_timestamps(game_pk) = get("/game/#{game_pk}/feed/live/timestamps", version: '1.1')

    def color_feed(game_pk, timecode: nil)
      MLBStatsAPI::ColorFeed.new self, game_pk, get("/game/#{game_pk}/feed/color", timecode:)
    end

    # def color_feed_diff(game_pk, timecode: nil, snapshot_at: nil)
    #   query = {}

    #   if timecode
    #     query[:startTimecode] = timecode
    #   elsif snapshot_at
    #     query[:endTimecode] = snapshot_at
    #   else
    #     raise ArgumentError, 'Please pass either a timecode or a snapshot.'
    #   end

    #   get "/game/#{game_pk}/feed/color/diffPatch", query
    # end

    # def color_feed_timestamps(game_pk)
    #   get "/game/#{game_pk}/feed/color/timestamps"
    # end

    def linescore(game_pk) = get("/game/#{game_pk}/linescore")

    def play_by_play(game_pk, timecode: nil) = get("/game/#{game_pk}/playByPlay", timecode:)

    def win_probability(game_pk, timecode: nil) = get("/game/#{game_pk}/winProbability", timecode:)
  end
end

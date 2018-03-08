# frozen_string_literal: true

module MLBStatsAPI
  module Games
    def boxscore(game_id)
      get("/games/#{game_id}/boxscore")
    end

    def content(game_id, limit: nil)
      get("/games/#{game_id}/content", highlightLimit: limit)
    end

    def context_metrics(game_id, timecode: nil)
      get("/games/#{game_id}/contextMetrics", timecode: timecode)
    end

    # This endpoint can return very large payloads. It is STRONGLY recommended
    # that clients ask for diffs and use "Accept-Encoding: gzip" header.
    def live_feed(game_id, timecode: nil)
      get("/games/#{game_id}/feed/live", version: '1.1', timecode: timecode)
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

      get("/games/#{game_id}/feed/live/diffPatch", query)
    end

    def linescore(game_id)
      get("/games/#{game_id}/linescore")
    end

    def play_by_play(game_id, timecode: nil)
      get("/games/#{game_id}/playByPlay", timecode: timecode)
    end

    def win_probability(game_id, timecode: nil)
      get("/games/#{game_id}/winProbability", timecode: timecode)
    end
  end
end

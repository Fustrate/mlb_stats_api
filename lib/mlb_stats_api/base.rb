# frozen_string_literal: true

module MLBStatsAPI
  class Base
    attr_reader :data

    def initialize(data)
      @data = data
    end

    def [](key)
      @data[key]
    end

    def dig(*path)
      @data.dig(*path)
    end
  end
end

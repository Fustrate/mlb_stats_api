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
  end
end

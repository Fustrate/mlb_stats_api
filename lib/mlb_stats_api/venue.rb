# frozen_string_literal: true

module MLBStatsAPI
  class Venue
    attr_reader :id, :name

    def initialize(data)
      @data = data

      @id = data['id']
      @name = data['name']
    end
  end
end

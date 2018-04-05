# frozen_string_literal: true

module MLBStatsAPI
  class Team < Base
    def id
      @data['id']
    end

    def name
      @data['teamName']
    end

    def location
      @data['locationName']
    end

    def abbreviation
      @data['abbreviation']
    end
    alias code abbreviation

    def file_code
      @data['fileCode']
    end

    def short_name
      @data['shortName']
    end

    def league_id
      @data.dig('league', 'id')
    end

    def division_id
      @data.dig('division', 'id')
    end

    def full_name
      @data['name']
    end

    # So we don't get huge printouts
    def inspect
      %(#<MLBGameday::Team @name="#{name}">)
    end
  end
end

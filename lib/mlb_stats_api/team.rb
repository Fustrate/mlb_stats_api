# frozen_string_literal: true

module MLBStatsAPI
  class Team < Base
    def id() = @data['id']

    def name() = @data['teamName']

    def location() = @data['locationName']

    def abbreviation() = @data['abbreviation']
    alias code abbreviation

    def file_code() = @data['fileCode']

    def short_name() = @data['shortName']

    def league_id() = @data.dig('league', 'id')

    def division_id() = @data.dig('division', 'id')

    def full_name() = @data['name']

    # So we don't get huge printouts
    def inspect() = %(#<MLBGameday::Team @name="#{name}">)
  end
end

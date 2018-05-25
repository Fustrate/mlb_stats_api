# frozen_string_literal: true

module MLBStatsAPI
  module Standings
    STANDINGS_TYPES = {
      regular_season: 'regularSeason',
      wild_card: 'wildCard',
      division_leaders: 'divisionLeaders',
      wild_card_with_leaders: 'wildCardWithLeaders',
      first_half: 'firstHalf',
      second_half: 'secondHalf',
      spring_training: 'springTraining',
      post_season: 'postseason',
      by_division: 'byDivision',
      by_conference: 'byConference',
      by_league: 'byLeague'
    }.freeze

    def standings(type:, league_ids:, season: nil)
      raise 'Invalid standings type.' unless STANDINGS_TYPES[type]

      get(
        "/standings/#{STANDINGS_TYPES[type]}",
        leagueId: Array(league_ids).join(','),
        season: (season || Date.today.year)
      )
    end
  end
end

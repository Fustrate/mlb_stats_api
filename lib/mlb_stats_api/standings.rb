# frozen_string_literal: true

module MLBStatsAPI
  module Standings
    TYPES = {
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

    def standings(leagues:, type: :regular_season, season: nil)
      raise 'Invalid standings type.' unless TYPES[type]

      league_ids = Leagues::LEAGUES.values_at(*leagues)

      if league_ids.none?
        raise 'Invalid league(s) - see Leagues::LEAGUES for available names.'
      end

      get(
        "/standings/#{TYPES[type]}",
        leagueId: league_ids.join(','),
        season: (season || Date.today.year)
      )
    end
  end
end

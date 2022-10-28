# frozen_string_literal: true

require 'zeitwerk'

Zeitwerk::Loader.for_gem.then do |loader|
  loader.inflector.inflect('mlb_stats_api' => 'MLBStatsAPI')
  loader.setup
end

module MLBStatsAPI
end

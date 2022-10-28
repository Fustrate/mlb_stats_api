# frozen_string_literal: true

require 'hana'
require 'httparty'
require 'json'
require 'zeitwerk'

loader = Zeitwerk::Loader.for_gem
loader.inflector.inflect('mlb_stats_api' => 'MLBStatsAPI')
loader.setup

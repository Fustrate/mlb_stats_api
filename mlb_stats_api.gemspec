# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'mlb_stats_api/version'

Gem::Specification.new do |spec|
  spec.name = 'mlb_stats_api'
  spec.version = MLBStatsAPI::VERSION
  spec.authors = ['Steven Hoffman']
  spec.email = ['git@fustrate.com']
  spec.metadata = {
    'rubygems_mfa_required' => 'true'
  }

  spec.summary = %(MLB has a new Stats API!)
  spec.homepage = 'http://github.com/fustrate/mlb_stats_api'
  spec.license = 'MIT'
  spec.required_ruby_version = '>= 3.1.0'

  spec.files = `git ls-files -z`.split("\x0").reject { _1.match(%r{^(test|spec|features)/}) }
  spec.bindir = 'exe'
  spec.executables = spec.files.grep(%r{^exe/}) { File.basename(_1) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '> 2.3'
  spec.add_development_dependency 'rake', '> 13.0'
  spec.add_development_dependency 'rspec', '~> 3.11'
  spec.add_development_dependency 'rubocop', '~> 1.26'
  spec.add_development_dependency 'webmock', '~> 3.14'

  spec.add_dependency 'hana', '~> 1.3'
  spec.add_dependency 'httparty', '~> 0.20'
  spec.add_dependency 'moneta', '~> 1.4'
end

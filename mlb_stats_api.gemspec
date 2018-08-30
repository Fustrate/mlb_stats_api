# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'mlb_stats_api/version'

Gem::Specification.new do |spec|
  spec.name = 'mlb_stats_api'
  spec.version = MLBStatsAPI::VERSION
  spec.authors = ['Steven Hoffman']
  spec.email = ['git@fustrate.com']

  spec.summary = %(MLB has a new Stats API!)
  spec.homepage = 'http://github.com/fustrate/mlb_stats_api'
  spec.license = 'MIT'

  spec.files = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir = 'exe'
  spec.executables = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '> 1.16'
  spec.add_development_dependency 'rake', '> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.8'
  spec.add_development_dependency 'webmock', '~> 3.4'

  spec.add_dependency 'hana', '~> 1.3'
  spec.add_dependency 'httparty', '~> 0.16'
  spec.add_dependency 'moneta', '~> 1.0'
end

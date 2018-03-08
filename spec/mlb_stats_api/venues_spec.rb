# frozen_string_literal: true

require 'spec_helper'

RSpec.describe MLBStatsAPI::Venues do
  let(:client) { MLBStatsAPI::Client.new }

  describe '#venue' do
    it 'loads a venue by ID' do
      venue = client.venue(22)

      expect(venue.name).to eq 'Dodger Stadium'
    end
  end
end

# frozen_string_literal: true

require 'spec_helper'

RSpec.describe MLBStatsAPI::Venues do
  let(:client) { MLBStatsAPI::Client.new }

  before { stub_requests!(with_response: true) }

  describe '#venue' do
    it 'loads a venue by ID' do
      venue = client.venue(22)

      expect(a_get_request('v1/venues/22')).to have_been_made

      expect(venue.name).to eq 'Dodger Stadium'
    end
  end
end

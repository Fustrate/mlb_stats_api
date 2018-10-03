# frozen_string_literal: true

require 'spec_helper'

RSpec.describe MLBStatsAPI::Client do
  let(:client) { described_class.new }

  describe '#new' do
    # Super exciting
    it 'creates a new client' do
      expect(client).to be_a described_class
    end
  end

  describe '#get' do
    it 'sends a request to AWS' do
      WebMock.stub_request(:any, /amazonaws\.com/)

      client.get('/standingsTypes')

      expect(a_request(:get, %r{amazonaws\.com/api/v1/standingsTypes}))
        .to have_been_made
    end
  end
end

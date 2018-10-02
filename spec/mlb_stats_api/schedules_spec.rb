# frozen_string_literal: true

require 'spec_helper'

RSpec.describe MLBStatsAPI::Schedules do
  let(:client) { MLBStatsAPI::Client.new }

  before { WebMock.stub_request(:any, /amazonaws\.com/) }

  describe '#schedule' do
    it 'loads a normal schedule' do
      client.schedule

      # Test for the question mark to ensure no further URI segments
      expect(a_request(:get, %r{/api/v1/schedule\?}))
        .to have_been_made
    end

    it 'defaults to a normal schedule with options' do
      client.schedule(hydrate: 'hydrations')

      expect(a_request(:get, %r{/api/v1/schedule\?hydrate=hydrations}))
        .to have_been_made
    end

    it 'loads a postseason schedule' do
      client.schedule :postseason

      expect(a_request(:get, %r{/api/v1/schedule/postseason}))
        .to have_been_made
    end

    it 'loads a tied games schedule' do
      client.schedule :tied

      expect(a_request(:get, %r{/api/v1/schedule/games/tied}))
        .to have_been_made
    end

    it 'loads a postseason series schedule' do
      client.schedule :postseason_series

      expect(a_request(:get, %r{/api/v1/schedule/postseason/series}))
        .to have_been_made
    end

    it 'loads a postseason tuneIn schedule' do
      client.schedule :tune_in

      expect(a_request(:get, %r{/api/v1/schedule/postseason/tuneIn}))
        .to have_been_made
    end
  end
end

# frozen_string_literal: true

require 'spec_helper'

RSpec.describe MLBStatsAPI::Schedules do
  let(:client) { MLBStatsAPI::Client.new }

  before { stub_requests! }

  describe '#schedule' do
    it 'loads a normal schedule' do
      client.schedule

      expect(a_get_request('v1/schedule', sportId: '1')).to have_been_made
    end

    it 'defaults to a normal schedule with options' do
      client.schedule(hydrate: 'hydrations')

      expect(a_get_request('v1/schedule', sportId: '1', hydrate: 'hydrations'))
        .to have_been_made
    end

    it 'loads a postseason schedule' do
      client.schedule type: :postseason

      expect(a_get_request('v1/schedule/postseason', sportId: '1'))
        .to have_been_made
    end

    it 'loads a tied games schedule' do
      client.schedule type: :tied

      expect(a_get_request('v1/schedule/games/tied', sportId: '1'))
        .to have_been_made
    end

    it 'loads a postseason series schedule' do
      client.schedule type: :postseason_series

      expect(a_get_request('v1/schedule/postseason/series', sportId: '1'))
        .to have_been_made
    end

    it 'loads a postseason tuneIn schedule' do
      client.schedule type: :tune_in

      expect(a_get_request('v1/schedule/postseason/tuneIn', sportId: '1'))
        .to have_been_made
    end
  end
end

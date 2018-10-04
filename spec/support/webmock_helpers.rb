# frozen_string_literal: true

module WebmockHelpers
  def stubbed_get_response(request)
    query = request.uri.query&.gsub(/[?&]?t=\d+/, '')&.gsub(/\W/, '_') || ''

    path = [request.uri.path.gsub(%r{/?api/v[\d\.]+/?}, ''), query]
      .reject(&:empty?)

    data_file = File.expand_path "../data/#{path.join('/')}.json", __dir__

    raise "Could not locate #{data_file}" unless File.exist?(data_file)

    {
      body: File.new(data_file),
      status: 200
    }
  end

  def a_get_request(endpoint, query = {})
    a_request(:get, %r{/api/#{endpoint}\?})
      .with(query: query.merge(t: Time.now.to_i.to_s))
  end

  def stub_requests!(with_response: false)
    if with_response
      WebMock.stub_request(:any, /amazonaws\.com/)
        .to_return { |request| stubbed_get_response(request) }
    else
      WebMock.stub_request(:any, /amazonaws\.com/)
    end
  end
end

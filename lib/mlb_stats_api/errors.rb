# frozen_string_literal: true

module MLBStatsAPI
  class Error < ::RuntimeError
    def initialize(response)
      super()

      @response = response
    end

    def to_s
      format(
        '%<code>s: %<message>s (%<uri>s)',
        code: @response.code,
        message: '', # @response.response,
        uri: @response.request.last_uri.to_s
      )
    end
  end

  class ForbiddenError < Error
  end

  class NotFoundError < Error
  end

  class UnauthorizedError < Error
  end
end

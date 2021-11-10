module Api
  class ApplicationController < ActionController::Base
    def render_response(data, status = :ok)
      render json: {
        status: status,
        payload: data
      }
    end
  end
end

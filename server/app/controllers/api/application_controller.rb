module Api
  class ApplicationController < ActionController::API
    def render_response(data, status = :ok)
      render json: {
        status: status,
        payload: data
      }
    end
  end
end

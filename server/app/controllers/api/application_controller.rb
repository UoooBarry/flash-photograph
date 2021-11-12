module Api
  class ApplicationController < ActionController::API
    def render_response(data, status = :ok)
      render json: {
        status: status,
        payload: data
      }
    end

    def render_process_entity_errors(entity)
      render_response({ errors: entity.errors.full_messages }, :error)
    end
  end
end

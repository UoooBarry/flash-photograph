module Api
  class PhotographsController < ApplicationController
    include DeviceRecognize
    before_action :recognize_device
    around_action :can_view?, only: :show

    def show
      render_response(photograph: Photograph.find(params[:id]))
    end

    private

    def can_view?
      @device ||= Device.find(request.env['device_id'])

      @viewed = Viewed.find_or_initialize_by(device: @device, photograph_id: params[:id])

      if @viewed.new_record?
        @viewed.save
        yield
      else
        render_response({ error: 'already viewed' }, :bad)
      end
    end
  end
end

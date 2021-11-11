module Api
  class PhotographsController < ApplicationController
    include DeviceRecognize
    before_action :recognize_device
    around_action :can_view?, only: :show

    def show
      render_response(able_to_view: true, photograph: Photograph.find(params[:id]))
    end

    def create
      @photograph = Photograph.new(photograph_params)
      @photograph.device_id = @device.id

      if @photograph.save
        render_response(sucess: true, photograph: @photograph)
      else
        render_response(sucess: false, errors: @photograph.errors.full_messages)
      end
    end

    private

    def photograph_params
      params.permit(:image, :duration)
    end

    def can_view?
      @device ||= Device.find(request.env['device_id'])

      @viewed = Viewed.find_or_initialize_by(device: @device, photograph_id: params[:id])

      if @viewed.new_record?
        @viewed.save
        yield
      else
        render_response(able_to_view: false)
      end
    end
  end
end

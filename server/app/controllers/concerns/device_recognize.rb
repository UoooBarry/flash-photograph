module DeviceRecognize
  extend ActiveSupport::Concern

  def recognize_device
    @device = Device.find(request.env['device_id'])
  end
end

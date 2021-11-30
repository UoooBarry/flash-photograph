class RequestMapDevice
  def initialize(app)
    @app = app
  end

  def call(env)
    ip = env['REMOTE_ADDR']
    _user_agent = env['HTTP_USER_AGENT']

    @device = Device.find_or_create_by(last_ip: ip)

    env['device_id'] = @device.id

    @app.call(env)
  end
end

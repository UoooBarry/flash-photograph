class RequestMapDevice
  def initialize(app)
    @app = app
  end

  def call(env)
    ip = env['REMOTE_ADDR']
    user_agent = env['HTTP_USER_AGENT']

    @device = Device.find_or_create_by(last_ip: ip, user_agent: user_agent)

    env['device_id'] = @device.id

    @app.call(env)
  end
end

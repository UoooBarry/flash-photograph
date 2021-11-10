class Device < ApplicationRecord
  has_many :vieweds

  scope :system_device, -> { find_by(user_agent: 'System', last_ip: '0.0.0.0') }

  def watched?(photograph)
    Viewed.exists?(device: self, photograph: photograph)
  end
end

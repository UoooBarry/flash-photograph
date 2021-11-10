class Photograph < ApplicationRecord
  has_one :device

  validates :duration, presence: true
end

class Photograph < ApplicationRecord
  belongs_to :device

  validates :duration, presence: true
end

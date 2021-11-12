class Photograph < ApplicationRecord
  has_one :device

  mount_uploader :url, ::ImageUploader
  alias_attribute :image, :url

  validates :duration, :url, presence: true
  validates :duration, inclusion: 1..10
end

class Viewed < ApplicationRecord
  belongs_to :photograph
  belongs_to :device
end

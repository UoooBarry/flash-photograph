class Viewed < ApplicationRecord
  belongs_to :photograph
  belongs_to :device

  def tap!
    update!(tapped: true)
  end
end

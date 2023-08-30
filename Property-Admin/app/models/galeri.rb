class Galeri < ApplicationRecord
  belongs_to :Account
  has_one_attached :image
end

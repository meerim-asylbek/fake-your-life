class Artist < ApplicationRecord
  has_many :hires, dependent: :destroy
  has_many :accesories, through: :hires
  has_many :reviews, dependent: :destroy
  has_many_attached :photos
  

end

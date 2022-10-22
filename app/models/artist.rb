class Artist < ApplicationRecord
  has_many :hires, dependet: :destroy
  has_many :accesories, through: :hires, dependet: :destroy
  has_many :reviews, dependet: :destroy
  has_many_attached :photos
end

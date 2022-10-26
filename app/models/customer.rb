class Customer < ApplicationRecord
  has_many :hires
  has_many :reviews
  has_one_attached :avatar
end

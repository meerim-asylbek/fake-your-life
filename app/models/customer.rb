class Customer < ApplicationRecord
  has_many :hires
  has_many :reviews
end

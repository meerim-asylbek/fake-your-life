class Hire < ApplicationRecord
  has_many :hire_adds
  belongs_to :artist
  belongs_to :customer
end

class Hire < ApplicationRecord
  has_many :hire_adds
  has_many :adds, through: :hire_adds
  belongs_to :artist
  belongs_to :customer
end

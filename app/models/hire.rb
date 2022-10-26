class Hire < ApplicationRecord
  belongs_to :artist
  belongs_to :customer
end

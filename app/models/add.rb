class Add < ApplicationRecord
  
  validates :name, presence: true
  validates :category, presence: true
  validates :picture_url, presence: true
end

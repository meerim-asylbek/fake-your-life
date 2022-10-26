class Add < ApplicationRecord
  has_many :hire_adds
  validates :name, presence: true
  validates :category, presence: true
  validates :picture_url, presence: true
end

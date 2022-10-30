class Customer < ApplicationRecord
  has_many :hires
  has_many :reviews
  has_one_attached :avatar
  belongs_to :user
  has_many :artists, through: :hires

  validates :first_name, presence: true, allow_blank: false
  validates :last_name, presence: true, allow_blank: false
  validates :address, presence: true, allow_blank: false
  validates :age, presence: true, allow_blank: false 
end

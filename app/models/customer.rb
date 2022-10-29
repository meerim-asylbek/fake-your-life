class Customer < ApplicationRecord
  has_many :hires
  has_many :reviews
  has_one_attached :avatar

  belongs_to :user

  validates :first_name, presence: true, length: { in: 6..199, too_long: "%{count} characters is the maximun allowed", too_short: "%{count} characters is the minimum allowed" }, allow_blank: false
  validates :last_name, presence: true, allow_blank: false
  validates :address, presence: true, allow_blank: false
  validates :age, presence: true, allow_blank: false, numericality: { only_integer: true, greater_than_or_equal_to: 18 }
end

class Artist < ApplicationRecord
  #has_many :hires, dependent: :destroy
  #has_many :accesories, through: :hires
  #has_many_attached :photos
  belongs_to :user
  has_many :reviews

  validates :name, presence: true, length: { in: 6..199, too_long: "%{count} characters is the maximun allowed", too_short: "%{count} characters is the minimum allowed" }, allow_blank: false
  validates :category, presence: true, allow_blank: false
  validates :address, presence: true, allow_blank: false
  validates :description, presence: true, allow_blank: false
  validates :price, presence: true, allow_blank: false, numericality: true 
  validates :age, presence: true, allow_blank: false, numericality: { only_integer: true, greater_than_or_equal_to: 18 }
  #validates :photos, presence: true, allow_blank: false

end

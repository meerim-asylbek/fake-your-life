class Artist < ApplicationRecord
  has_many_attached :photos
  belongs_to :user
  has_many :hires, dependent: :destroy
  has_many :customers, through: :hires
  has_many :reviews

  validates :name, presence: true, allow_blank: false
  validates :category, presence: true, allow_blank: false
  validates :address, presence: true, allow_blank: false
  validates :description, presence: true, allow_blank: false
  validates :price, presence: true, allow_blank: false, numericality: true
  validates :age, presence: true, allow_blank: false, numericality: { only_integer: true, greater_than_or_equal_to: 18 }
 validates :photos, presence: true, allow_blank: false

end

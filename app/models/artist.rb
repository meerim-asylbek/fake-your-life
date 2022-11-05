class Artist < ApplicationRecord
  has_many_attached :photos
  belongs_to :user
  has_many :hires, dependent: :destroy
  has_many :customers, through: :hires
  has_many :reviews
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  validates :name, presence: true, allow_blank: false
  validates :category, presence: true, allow_blank: false
  validates :address, presence: true, allow_blank: false
  validates :description, presence: true, allow_blank: false
  validates :price, presence: true, allow_blank: false, numericality: true
  validates :age, presence: true, allow_blank: false, numericality: { only_integer: true, greater_than_or_equal_to: 18 }
  validates :photos, presence: true, allow_blank: false

  def rating_quantity
    self.reviews.size
  end

  def average_rating
    if self.reviews.size > 0
      self.reviews.average(:rating).round(1)
    else
      'undefined'
    end
  end

  def average_rating_div
    if self.reviews.size > 0
      self.reviews.average(:rating).to_f.divmod 1
    else
      'undefined'
    end
  end
end

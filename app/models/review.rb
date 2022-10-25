class Review < ApplicationRecord

  validates :rating, presence: true, numericality: { only_integer: true, in: 0..5 }
  validates :comment, presence: true, length: { in: 6..255 }
end

class Program < ApplicationRecord
  belongs_to :centre

  has_one_attached :cover_photo
  has_one_attached :cover_photo2
  has_one_attached :cover_photo3
end

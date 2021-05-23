class StaffPage < ApplicationRecord

  extend FriendlyId
  friendly_id :name, use: [:slugged]

  has_one_attached :cover_photo

  has_many_attached :images

  validates :name,         presence: true
  validates :body,         presence: true
  validates :location,     presence: true
  validates :state,        inclusion: { in: ['draft', 'published'] }
  validates :published_at, presence: true, if: :published?
  

  scope :published, -> { where(state: "published").where('published_until > ?', DateTime.now)}

  def published?
    state == 'published'
  end
end

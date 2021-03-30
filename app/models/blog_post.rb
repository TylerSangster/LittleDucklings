class BlogPost < ActiveRecord::Base
  extend FriendlyId

  validates :title,        presence: true
  validates :state,        inclusion: { in: ['draft', 'published'] }
  validates :publisher,    presence: true, if: :published?
  validates :published_at, presence: true, if: :published?
  validates :body,   presence: true

  friendly_id :title, use: [:slugged]

  paginates_per 8

  def published?
    state == 'published'
  end

end
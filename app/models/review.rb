class Review < ApplicationRecord
  scope :published, -> { where(state: "published")}
  def published?
    state == 'published'
  end
end

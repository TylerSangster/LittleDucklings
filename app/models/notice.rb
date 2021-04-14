class Notice < ApplicationRecord
  scope :published, -> { where(state: "published").where('published_until > ?', DateTime.now)}
end

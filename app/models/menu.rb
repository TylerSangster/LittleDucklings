class Menu < ApplicationRecord
  scope :published, -> { where(state: "published")}
end

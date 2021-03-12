class Item < ApplicationRecord
  belongs_to :menu
  enum type: [:european, :pan_asian, :wok, :non_alcohol_drink, :alcohol_drink]
end

class Message < ActiveRecord::Base
  has_many_attached :images
  belongs_to :conversation
  belongs_to :admin_user
  validates_presence_of :body, :conversation_id, :user_id

  # def message_time
  #   created_at.strftime(“%m/%d/%y at %l:%M %p”)
  # end
end
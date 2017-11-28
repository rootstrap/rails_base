class Message < ApplicationRecord
  belongs_to :chat
  belongs_to :user

  validates :user_in_chat
  validates :content, presence: true

  after_save :update_chat_generic_data

  private

  def update_chat_generic_data
    chat.update_column(:last_message, content)
  end

  def user_in_chat
    chat.users.includes(user)
  end
end

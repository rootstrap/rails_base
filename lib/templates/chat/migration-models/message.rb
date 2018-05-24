# == Schema Information
#
# Table name: messages
#
#  id                :integer          not null, primary key
#  user_id           :integer
#  chat_id           :integer
#  content           :string
#  image             :string
#  image_orientation :integer
#  message_type      :string
#  sent              :boolean
#  read              :boolean
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#
# Indexes
#
#  index_messages_on_chat_id  (chat_id)
#  index_messages_on_user_id  (user_id)
#

class Message < ApplicationRecord
  belongs_to :chat
  belongs_to :user

  validates :content, presence: true
  validate :user_in_chat

  scope :order_by_date, -> { order(created_at: :desc) }

  after_save :update_chat_generic_data

  private

  def update_chat_generic_data
    chat.update_column(:last_message, content)
  end

  def user_in_chat
    chat.users.includes(user)
  end
end
